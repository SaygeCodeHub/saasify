import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/enums/employee_type_enum.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_screen.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/custom_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/userInput/custom_checkbox.dart';

showAddEmployeeDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
      actions: [
        BlocListener<EmployeeBloc, EmployeeStates>(
          listener: (context, state) {
            if (state is InvitationSent) {
              const CircularProgressIndicator();
            }
            if (state is InvitationSent) {
              Navigator.pushReplacementNamed(
                  context, HRMSDashboardScreen.routeName);
            }
            if (state is InvitingFailed) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ErrorAlertDialog(
                      description: state.errorMessage.toString());
                },
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(spacingStandard),
            child: PrimaryButton(
                backgroundColor: AppColors.darkBlue,
                onPressed: () {
                  context
                      .read<EmployeeBloc>()
                      .add(InviteEmployee(inviteDetails: {}));
                },
                buttonWidth: spacingXXXHuge,
                buttonTitle: 'Invite'),
          ),
        )
      ],
      title: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.30,
          child:
              OverflowBar(alignment: MainAxisAlignment.spaceBetween, children: [
            const Text(StringConstants.kInviteMember),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AddEmployeeScreen.routeName);
              },
              child: Text("Add Manually",
                  style: Theme.of(context)
                      .textTheme
                      .drawerModuleTextStyle
                      .copyWith(color: AppColors.orange)),
            )
          ])),
      content: SizedBox(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            const Divider(),
            const SizedBox(height: spacingHuge),
            Text(StringConstants.kEmailAddress,
                style: Theme.of(context).textTheme.userNameTextStyle),
            const SizedBox(height: spacingSmall),
            TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    counterText: "",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15))),
            const SizedBox(height: spacingHuge),
            Text(StringConstants.kAssignRole,
                style: Theme.of(context).textTheme.userNameTextStyle),
            const SizedBox(height: spacingMedium),
            Column(
                children: List.generate(
                    EmployeeType.values.length,
                    (index) => Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: spacingSmall),
                        child: CustomCheckbox(
                            checkBoxTitle: EmployeeType.values[index].name))))
          ])));
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
