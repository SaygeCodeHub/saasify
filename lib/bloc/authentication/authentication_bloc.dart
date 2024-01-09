import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import '../../data/database/database_util.dart';
import '../../di/app_module.dart';
import '../../repositories/authentication/authentication_repository.dart';
import '../../widgets/sidebar.dart';
import 'authentication_event.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  FirebaseAuth auth = FirebaseAuth.instance;
  Map authDetails = {};
  bool loginButtonEnabled = false;

  final AuthenticationRepository _authenticationRepository =
      getIt<AuthenticationRepository>();

  AuthenticationStates get initialState => AuthenticationInitial();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<TextFieldChange>(_textFieldChange);
    on<SignIn>(_signIn);
    on<CheckIfLoggedIn>(_checkIfLoggedIn);
    on<LogOut>(_logOut);

    // OTP Logic

    on<GetOtp>(_getOtp);
    on<OtpReceivedOnPhone>(_otpReceivedOnPhone);
    on<VerifyOtp>(_onVerifyOtp);
    on<OtpVerified>(_loginWithCredential);
    on<OtpVerificationError>(_onOtpVerificationError);
  }

  bool _checkIfNullOrEmpty(String? value) {
    if (value == null || value == '' || value.trim() == '') {
      return false;
    }
    return true;
  }

  FutureOr<void> _textFieldChange(
      TextFieldChange event, Emitter<AuthenticationStates> emit) {
    loginButtonEnabled = (_checkIfNullOrEmpty(authDetails['email'])) &&
        _checkIfNullOrEmpty(authDetails['password']);
    emit(TextFieldChanged());
  }

  _signIn(SignIn event, Emitter<AuthenticationStates> emit) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential = await _authenticationRepository.signIn(
          authDetails["email"], authDetails["password"]);

      Map map = await _authenticationRepository.fetchModules(userCredential.user!.uid);

      log(map.toString());

      Map userDetailsMap = {
        'user_id': userCredential.user!.uid,
        'user_name': "",
        'user_contact': "",
        'user_email': authDetails["email"]
      };

      AuthenticationModel authenticationModel =
          await _authenticationRepository.authenticateUser(userDetailsMap);

      if (authenticationModel.status == 200) {
        _customerCache.setIsLoggedIn(true);
        _customerCache.setUserId(authenticationModel.data.user.userId);
        _customerCache
            .setUserContact(authenticationModel.data.user.userContact??0);
        _customerCache.setUserName(authenticationModel.data.user.userName);
        if (authenticationModel.data.companies.length == 1) {
          _customerCache
              .setCompanyId(authenticationModel.data.companies.first.companyId);
        }
        if (authenticationModel.data.companies[0].branches.length == 1) {
          _customerCache.setBranchId(
              authenticationModel.data.companies.first.branches.first.branchId);
        }
        emit(AuthenticationSuccess(authenticationModel: authenticationModel));
      } else {
        emit(AuthenticationError(error: authenticationModel.message));
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      emit(AuthenticationError(error: e.message ?? e.code));
    } catch (e) {
      emit(AuthenticationError(error: e.toString()));
    }
  }

  FutureOr<void> _checkIfLoggedIn(
      CheckIfLoggedIn event, Emitter<AuthenticationStates> emit) async {
    bool? isLoggedIn = await _customerCache.getIsLoggedIn();
    String userName = await _customerCache.getUserName();
    int userContact = await _customerCache.getUserContact();
    if (isLoggedIn == true) {
      SideBar.userContact = userContact;
      SideBar.userName = userName;
      emit(IsLoggedIn());
    }
  }

  FutureOr<void> _logOut(
      LogOut event, Emitter<AuthenticationStates> emit) async {
    await _customerCache.clearAll();
    await DatabaseUtil.ordersBox.clear();
    await DatabaseUtil.products.clear();
    emit(LoggedOut());
  }

  // OTP Logic

  _otpReceivedOnPhone(
      OtpReceivedOnPhone event, Emitter<AuthenticationStates> emit) async {
    emit(OtpReceived(
        verificationId: event.verificationId,
        userName: authDetails['user_name'] ?? ""));
  }

  FutureOr<void> _getOtp(
      GetOtp event, Emitter<AuthenticationStates> emit) async {
    emit(OtpLoading());
    try {
      await _authenticationRepository.verifyPhoneNumber(
        phoneNumber: "+91 ${authDetails['user_contact']}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          // add(OtpVerified(
          //     credential: credential,
          //     userName: authDetails['user_name'] ?? ""));
        },
        codeSent: (String verificationId, int? resendToken) {
          add(OtpReceivedOnPhone(
              verificationId: verificationId, token: resendToken));
        },
        verificationFailed: (FirebaseAuthException e) {
          add(OtpVerificationError(error: e.code));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _onVerifyOtp(
      VerifyOtp event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(OtpLoading());
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OtpVerified(
          credential: credential, userName: authDetails['user_name'] ?? ""));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _loginWithCredential(
      OtpVerified event, Emitter<AuthenticationStates> emit) async {
    try {
      await auth.signInWithCredential(event.credential).then((user) async {
        if (user.user != null) {
          Map userDetailsMap = {
            'user_id': user.user!.uid,
            'user_name': "",
            'user_contact': user.user!.phoneNumber
          };
          AuthenticationModel authenticationModel =
              await _authenticationRepository.authenticateUser(userDetailsMap);
          if (authenticationModel.status == 200) {
            _customerCache.setIsLoggedIn(true);
            _customerCache.setUserId(user.user!.uid);
            _customerCache
                .setCompanyId(authenticationModel.data.companies[0].companyId);
            _customerCache.setBranchId(
                authenticationModel.data.companies[0].branches[0].branchId);
            _customerCache
                .setUserContact(authenticationModel.data.user.userContact??0);
            _customerCache.setUserName(authenticationModel.data.user.userName);
            SideBar.userContact = authenticationModel.data.user.userContact ?? 0;
            SideBar.userName = authenticationModel.data.user.userName;
            emit(PhoneOtpVerified(userData: authenticationModel.data));
          } else if (authenticationModel.status == 404) {
            emit(PhoneAuthError(error: authenticationModel.message.toString()));
            emit(AuthenticationFormLoaded());
          } else {
            emit(PhoneAuthError(error: authenticationModel.message));
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthError(error: e.code));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  _onOtpVerificationError(
      OtpVerificationError event, Emitter<AuthenticationStates> emit) async {
    emit(PhoneAuthError(error: event.error));
    emit(AuthenticationFormLoaded());
  }
}
