// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/onboarding/onboarding_bloc.dart';
// import '../../../bloc/onboarding/onboarding_event.dart';
// import '../../../utils/constants/string_constants.dart';
// import '../../../widgets/primary_button.dart';
// import '../../dashboard/dashboard_screen.dart';
//
// class NextButton extends StatelessWidget {
//
//   const NextButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return PrimaryButton(
//         onPressed: (state.selectedBranchIndex != -1)
//             ? () {
//           context.read<OnboardingBloc>().add(
//               SetCompanyAndBranchIds(
//                   companyId:
//                   selectedCompany.companyId,
//                   branchId: selectedCompany
//                       .branches[state
//                       .selectedBranchIndex]
//                       .branchId));
//           Navigator.pushReplacementNamed(context,
//               DashboardsScreen.routeName);
//         }
//             : null,
//         buttonTitle: StringConstants.kNext);
//   }
// }
