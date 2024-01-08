import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/branches/widgets/branches_mobile_screen.dart';
import 'package:saasify/screens/branches/widgets/branches_web_screen.dart';
import '../../bloc/onboarding/onboarding_bloc.dart';
import '../../bloc/onboarding/onboarding_event.dart';
import '../../data/models/authentication/authentication_model.dart';

class BranchesScreen extends StatelessWidget {
  final Company selectedCompany;
  static const routeName = 'BranchesScreen';

  BranchesScreen({super.key, required this.selectedCompany});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<OnboardingBloc>().add(SelectBranch(branchIndex: -1));

    return PopScope(
        canPop: false,
        child: Scaffold(body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.maxWidth < 600)
              ? BranchesMobileScreen(
                  branchList: selectedCompany.branches,
                  selectedCompany: selectedCompany)
              : BranchesWebScreen(
                  branchList: selectedCompany.branches,
                  selectedCompany: selectedCompany);
        })));
  }
}
