import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_events.dart';
import 'package:saasify/bloc/register/register_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/register/register_user_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/register/register_repository.dart';
import 'package:uuid/uuid.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  final Cache cache = getIt<Cache>();
  final Map userInputAuthenticationMap = {};
  final RegisterRepository _registerRepository = getIt<RegisterRepository>();

  RegisterStates get initialState => InitialiseRegisterStates();

  RegisterBloc() : super(InitialiseRegisterStates()) {
    on<RegisterUser>(_registerUser);
  }

  FutureOr<void> _registerUser(
      RegisterUser event, Emitter<RegisterStates> emit) async {
    emit(RegisteringUser());
    try {
      RegisterUserModel registerUserModel =
          await _registerRepository.registerUser(event.userDetails);
      if (registerUserModel.status == 200) {
        await saveUserSelections(registerUserModel);
        await saveDeviceDetailsToFirestore(
            'user@saasify.com',
            registerUserModel.data.name.toString(),
            registerUserModel.data.userId.toString());
        userInputAuthenticationMap.clear();
        emit(UserRegistered(registerData: registerUserModel.data));
      } else {
        emit(FailedToRegisterUser(errorMessage: registerUserModel.message));
      }
    } catch (e) {
      emit(FailedToRegisterUser(errorMessage: e.toString()));
    }
  }

  saveUserSelections(RegisterUserModel registerUserModel) async {
    getIt<Cache>().setUserLoggedIn(true);
    getIt<Cache>().setUserId(registerUserModel.data.userId.toString());
    getIt<Cache>().setUserName(registerUserModel.data.name.toString());
  }

  Future<void> saveDeviceDetailsToFirestore(
      String email, String name, String collectionId) async {
    try {
      var uuid = const Uuid();
      String documentId = uuid.v4();
      Map<String, dynamic> deviceInfo = await getDeviceDetails();

      await FirebaseFirestore.instance
          .collection(collectionId)
          .doc(documentId)
          .set({
        'email': email,
        'name': name,
        'timestamp': FieldValue.serverTimestamp(),
        'device_details': deviceInfo,
      });
    } catch (error) {
      log("Error saving device details: $error");
    }
  }

  Future<Map<String, dynamic>> getDeviceDetails() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String platform = getPlatformName();

    if (platform == 'android') {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return {
        'platform': platform,
        'device_id': androidInfo.id,
        'os': 'Android',
        'os_version': androidInfo.version.release,
        'device_brand': androidInfo.brand,
      };
    } else if (platform == 'ios') {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return {
        'platform': platform,
        'device_id': iosInfo.identifierForVendor,
        'os': 'iOS',
        'os_version': iosInfo.systemVersion,
        'device_brand': 'iOS',
      };
    } else if (platform == 'macos') {
      MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
      return {
        'platform': platform,
        'device_id': macInfo.model,
        'os': 'macOS',
        'os_version': macInfo.majorVersion,
        'device_brand': 'MacOS',
      };
    } else if (platform == 'windows') {
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      return {
        'platform': platform,
        'device_id': windowsInfo.computerName,
        'os': 'Windows',
        'os_version': windowsInfo.deviceId,
        'device_brand': 'Windows',
      };
    } else {
      throw Exception("Unsupported platform");
    }
  }

  String getPlatformName() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else if (Platform.isMacOS) {
      return 'macos';
    } else if (Platform.isWindows) {
      return 'windows';
    } else {
      throw Exception("Unsupported platform");
    }
  }
}
