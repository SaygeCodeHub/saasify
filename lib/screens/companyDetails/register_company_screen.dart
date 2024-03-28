import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/companies/companies_bloc.dart';
import 'package:saasify/bloc/companies/companies_event.dart';
import 'package:saasify/bloc/companies/companies_state.dart';
import 'package:saasify/screens/home/home_screen.dart';
import 'package:saasify/utils/custom_dialogs.dart';
import '../../../configs/app_spacing.dart';
import '../skeleton_screen.dart';
import '../widgets/buttons/primary_button.dart';
import '../widgets/form_widgets.dart';
import '../widgets/image_picker_widget.dart';

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

  List<Widget> _buildBottomBarButtons(BuildContext context) {
    return [
      BlocListener<CompaniesBloc, CompaniesState>(
        listener: (context, state) {
          if (state is AddingCompany) {
            const CircularProgressIndicator();
          } else if (state is CompanyAdded) {
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
          } else if (state is CompanyNotAdded) {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogs().showAlertDialog(
                      context, 'Company not registered.',
                      onPressed: () => Navigator.pop(context));
                });
          }
        },
        child: PrimaryButton(
          buttonTitle: 'Save Profile Details',
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              context.read<CompaniesBloc>().add(AddCompany(companyDetailsMap: {
                    'owner_name': ownerNameController.text,
                    'company_name': companyNameController.text,
                    'einNumber': identificationNumberController.text,
                    'address': addressController.text,
                    'logoUrl': _imageBytes
                  }));
            }
          },
        ),
      ),
    ];
  }

  Future<void> saveUserDetailsToLocalDatabase() async {}
}
