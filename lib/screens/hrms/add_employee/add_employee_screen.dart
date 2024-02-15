import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_web.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'add_employee_mobile.dart';

class AddEmployeeScreen extends StatelessWidget {
  static const routeName = 'AddEmployeeScreen';

  AddEmployeeScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<EmployeeBloc>().resetEmployeeDetails();
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: spacingMedium),
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacingMedium),
                      child: Row(children: [
                        isMobile ? const SizedBox.shrink() : const BackButton(),
                        const SizedBox(width: spacingXMedium),
                        const ModuleHeading(label: 'Add New Employee'),
                      ])),
                  Form(
                    key: _formKey,
                    child: Expanded(
                      child: ResponsiveLayout(
                          mobileBody: AddEmployeeMobile(formKey: _formKey),
                          provideMobilePadding: false,
                          desktopBody: AddEmployeeWeb(formKey: _formKey)),
                    ),
                  )
                ]));
  }
}
