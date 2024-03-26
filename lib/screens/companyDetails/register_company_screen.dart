import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../configs/app_spacing.dart';
import '../../models/user/user_model.dart';
import '../skeleton_screen.dart';
import '../widgets/buttons/primary_button.dart';
import '../widgets/image_picker_widget.dart';
import '../widgets/lable_and_textfield_widget.dart';

class RegisterCompanyWebScreen extends StatefulWidget {
  const RegisterCompanyWebScreen({super.key});

  @override
  State<RegisterCompanyWebScreen> createState() =>
      _RegisterCompanyWebScreenState();
}

class _RegisterCompanyWebScreenState extends State<RegisterCompanyWebScreen> {
  final TextEditingController textEditingControllerOwnerName =
      TextEditingController();
  final TextEditingController textEditingControllerCompanyName =
      TextEditingController();
  final TextEditingController textEditingControllerIdentificationNumber =
      TextEditingController();
  final TextEditingController textEditingControllerAddress =
      TextEditingController();

  Uint8List? _imageBytes;

  void _handleImagePicked(Uint8List imageBytes) {
    setState(() {
      _imageBytes = imageBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonScreen(
      appBarTitle: 'Add Company',
      bodyContent: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImagePickerWidget(
              label: 'Company Logo',
              initialImage: _imageBytes,
              onImagePicked: _handleImagePicked,
            ),
            const SizedBox(height: spacingHuge),
            LabelAndTextFieldWidget(
              prefixIcon: const Icon(Icons.person),
              label: 'Owner Name',
              isRequired: true,
              textFieldController: textEditingControllerOwnerName,
            ),
            const SizedBox(height: spacingStandard),
            LabelAndTextFieldWidget(
              prefixIcon: const Icon(Icons.business),
              label: 'Company Name',
              isRequired: true,
              textFieldController: textEditingControllerCompanyName,
            ),
            const SizedBox(height: spacingStandard),
            LabelAndTextFieldWidget(
              prefixIcon: const Icon(Icons.numbers_outlined),
              label: 'EIN / TIN / GST Number',
              isRequired: true,
              textFieldController: textEditingControllerIdentificationNumber,
            ),
            LabelAndTextFieldWidget(
              prefixIcon: const Icon(Icons.location_city),
              label: 'Address',
              maxLines: 2,
              isRequired: false,
              textFieldController: textEditingControllerAddress,
            ),
          ],
        ),
      ),
      bottomBarButtons: [
        PrimaryButton(
          buttonTitle: 'Save Profile Details',
          onPressed: () async {
            saveUserDetailsToLocalDatabase(
                context,
                _imageBytes,
                textEditingControllerOwnerName,
                textEditingControllerCompanyName,
                textEditingControllerIdentificationNumber,
                textEditingControllerAddress);
          },
        ),
      ],
    );
  }
}

Future<void> saveUserDetailsToLocalDatabase(context, imageBytes, ownerName,
    companyName, identificationNumber, address) async {
  if (ownerName.text.isEmpty ||
      companyName.text.isEmpty ||
      identificationNumber.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Please fill in all required fields.'),
    ));
    return;
  }

  final newCompany = UserModel(
    ownerName: ownerName.text,
    companyName: companyName.text,
    identificationNumber: identificationNumber.text,
    logo: imageBytes,
    address: address.text.isEmpty ? null : address.text,
  );

  final companiesBox = Hive.box<UserModel>('userDetails');
  await companiesBox.add(newCompany);

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Company added successfully'),
  ));
  await companiesBox.close();
}
