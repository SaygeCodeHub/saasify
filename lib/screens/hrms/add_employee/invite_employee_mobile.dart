import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/selectable_modules_form_field.dart';

import '../../../bloc/employee/employee_bloc.dart';
import '../../../bloc/employee/employee_event.dart';
import '../../../bloc/employee/employee_states.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/enums/employee_type_enum.dart';
import '../../../data/models/screenArguments/update_employee_screen_arguments.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/progress_bar.dart';
import '../../../widgets/alertDialogs/error_alert_dialog.dart';
import '../../../widgets/alertDialogs/success_alert_dialog.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/form/form_input_fields.dart';
import '../../../widgets/layoutWidgets/multifield_row.dart';
import '../../../widgets/text/label_text_widget.dart';
import '../../../widgets/userInput/custom_checkbox.dart';
import '../hrms_dashboard_screen.dart';
import 'add_employee_screen.dart';

class InviteEmployeeMobileScreen extends StatelessWidget {
  static const routeName = 'InviteEmployeeMobileScreen';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  InviteEmployeeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EmployeeBloc>().inviteDetails = {
      "user_email": "",
      "designations": [2],
      "approvers": [],
      "accessible_modules": <Map<String, dynamic>>[]
    };
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BlocListener<EmployeeBloc, EmployeeStates>(
            listener: (context, state) {
              if (state is InvitingEmployee) {
                return ProgressBar.show(context);
              }
              if (state is InvitationSent) {
                ProgressBar.dismiss(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SuccessAlertDialog(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, HRMSDashboardScreen.routeName);
                          },
                          description:
                              '${state.inviteEmployeeModel.message} on ${context.read<EmployeeBloc>().inviteDetails['user_email']}');
                    });
              }
              if (state is InvitingFailed) {
                ProgressBar.dismiss(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ErrorAlertDialog(
                          description: state.errorMessage.toString());
                    });
              }
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: mobileBodyPadding,
                  vertical: spacingStandard,
                ),
                child: PrimaryButton(
                    backgroundColor: AppColors.darkBlue,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        context.read<EmployeeBloc>().add(InviteEmployee());
                      }
                    },
                    // buttonWidth: spacingXXXHuge,
                    buttonTitle: 'Invite'))),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(mobileBodyPadding),
              child: Column(children: [
                OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringConstants.kInviteMember,
                          style: Theme.of(context).textTheme.titleLarge),
                      InkWell(
                          onTap: () {
                            context.read<EmployeeBloc>().resetEmployeeDetails();
                            Navigator.pushReplacementNamed(
                                context, AddEmployeeScreen.routeName,
                                arguments: UpdateEmployeeScreenArguments());
                          },
                          child: Text("Add Manually",
                              style: Theme.of(context)
                                  .textTheme
                                  .drawerModuleTextStyle
                                  .copyWith(color: AppColors.orange)))
                    ]),
                Expanded(
                  child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            const Divider(),
                            const SizedBox(height: spacingStandard),
                            EmailTextField(
                                isRequired: true,
                                onTextFieldChanged: (value) {
                                  context
                                      .read<EmployeeBloc>()
                                      .inviteDetails['user_email'] = value;
                                }),
                            const SizedBox(height: spacingStandard),
                            Text(StringConstants.kDesignation,
                                style: Theme.of(context)
                                    .textTheme
                                    .userNameTextStyle),
                            const SizedBox(height: spacingSmall),
                            MultiFieldRow(
                                childrenWidgets: List.generate(
                                    EmployeeType.values.length,
                                    (index) => CustomCheckbox(
                                        onChanged: (value) {
                                          if (value!) {
                                            context
                                                .read<EmployeeBloc>()
                                                .inviteDetails['designations']
                                                .add(EmployeeType
                                                    .values[index].index);
                                          } else {
                                            context
                                                .read<EmployeeBloc>()
                                                .inviteDetails['designations']
                                                .remove(EmployeeType
                                                    .values[index].index);
                                          }
                                        },
                                        checkBoxTitle:
                                            EmployeeType.values[index].name,
                                        isChecked: context
                                            .read<EmployeeBloc>()
                                            .inviteDetails["designations"]
                                            .contains(EmployeeType
                                                .values[index].index)))),
                            const SizedBox(height: spacingStandard),
                            const LabelTextWidget(label: "Accesible Features"),
                            SelectableModulesFormField(
                                selectedFeatures: context
                                    .read<EmployeeBloc>()
                                    .inviteDetails['accessible_modules'],
                                onSelected: (value) {
                                  context
                                          .read<EmployeeBloc>()
                                          .inviteDetails['accessible_modules'] =
                                      value;
                                })
                          ]))),
                ),
              ])),
        ));
  }
}
