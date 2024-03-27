import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:saasify/screens/home/home_screen.dart';
import 'package:saasify/utils/custom_dialogs.dart';
import '../../../configs/app_spacing.dart';
import '../../models/user/user_details.dart';
import '../../utils/global.dart';
import '../skeleton_screen.dart';
import '../widgets/buttons/primary_button.dart';
import '../widgets/form_widgets.dart';
import '../widgets/image_picker_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterCompanyWebScreen extends StatefulWidget {
  const RegisterCompanyWebScreen({super.key});

  @override
  RegisterCompanyWebScreenState createState() =>
      RegisterCompanyWebScreenState();
}

class RegisterCompanyWebScreenState extends State<RegisterCompanyWebScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController identificationNumberController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  Uint8List? _imageBytes;

  void _handleImagePicked(Uint8List imageBytes) {
    setState(() => _imageBytes = imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonScreen(
      appBarTitle: 'Add Company',
      bodyContent: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: _buildFormBody(),
        ),
      ),
      bottomBarButtons: _buildBottomBarButtons(context),
    );
  }

  Widget _buildFormBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ImagePickerWidget(
            label: 'Company Logo',
            initialImage: _imageBytes,
            onImagePicked: _handleImagePicked),
        const SizedBox(height: spacingHuge),
        buildTextField(ownerNameController, 'Owner Name', Icons.person, true),
        const SizedBox(height: spacingMedium),
        buildTextField(
            companyNameController, 'Company Name', Icons.business, true),
        const SizedBox(height: spacingMedium),
        buildTextField(identificationNumberController, 'EIN / TIN / GST Number',
            Icons.numbers_outlined, true),
        const SizedBox(height: spacingMedium),
        buildTextField(addressController, 'Address', Icons.location_city, false,
            maxLines: 2),
      ],
    );
  }

  List<Widget> _buildBottomBarButtons(context) {
    return [
      PrimaryButton(
        buttonTitle: 'Save Profile Details',
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if (kIsOfflineModule) {
              await saveUserDetailsToLocalDatabase();
            } else {
              bool companyRegistered = await uploadImageAndSaveUrl(
                  FirebaseAuth.instance.currentUser!.uid);
              if (companyRegistered) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDialogs().showSuccessDialog(
                          context, 'Company added successfully.',
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen())));
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDialogs().showAlertDialog(
                          context, 'Company not registered.',
                          onPressed: () => Navigator.pop(context));
                    });
              }
            }
          }
        },
      ),
    ];
  }

  Future<void> saveUserDetailsToLocalDatabase() async {
    final newCompany = UserDetails(
      ownerName: ownerNameController.text,
      companyName: companyNameController.text,
      identificationNumber: identificationNumberController.text,
      logo: _imageBytes,
      address:
          addressController.text.isNotEmpty ? addressController.text : null,
    );

    try {
      final companiesBox = Hive.box<UserDetails>('userDetails');
      await companiesBox.add(newCompany);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Company added successfully')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to add company: $e')));
    }
  }

  Future<bool> uploadImageAndSaveUrl(String userId) async {
    try {
      final storageRef = firebase_storage.FirebaseStorage.instance.ref();
      final imagesRef =
          storageRef.child("user_images/$userId/profile_picture.jpg");

      final uploadTask = imagesRef.putData(_imageBytes!);
      final completedTask = await uploadTask;

      final downloadUrl = await completedTask.ref.getDownloadURL();

      final usersRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      await usersRef.collection('user_details').doc('profile').set({
        'image_url': downloadUrl,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
