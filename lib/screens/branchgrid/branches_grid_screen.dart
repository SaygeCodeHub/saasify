import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/branches/branches_bloc.dart';
import 'package:saasify/bloc/branches/branches_event.dart';
import 'package:saasify/bloc/branches/branches_states.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/branchgrid/widgets/branch_grid_mobile_screen.dart';
import 'package:saasify/screens/branchgrid/widgets/branch_grid_web_screen.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_color.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/alert_dialogue_box.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class StoreGridScreen extends StatelessWidget {
  static const String routeName = 'StoreGridScreen';

  StoreGridScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<BranchesBloc>().add(FetchAllBranches());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kBranches),
                  desktop: const Expanded(child: SideBar(selectedIndex: 1))),
              Expanded(
                  flex: 5,
                  child: BlocConsumer<BranchesBloc, BranchesStates>(
                      listener: (context, state) {
                    if (state is SavingBranch) {
                      ProgressBar.show(context);
                    }
                    if (state is SavedBranch) {
                      ProgressBar.dismiss(context);
                      showDialog(
                          context: context,
                          builder: (dialogueCtx) {
                            return AlertDialogueBox(
                                title: StringConstants.kSuccess,
                                message: state.message,
                                checkMarkVisible: true,
                                primaryButtonTitle: StringConstants.kOk,
                                primaryOnPressed: () {
                                  Navigator.pop(dialogueCtx);
                                  context
                                      .read<BranchesBloc>()
                                      .add(FetchAllBranches());
                                });
                          });
                    }
                    if (state is EditedBranches) {
                      context.read<BranchesBloc>().add(FetchAllBranches());
                    }
                    if (state is ErrorEditingBranches) {
                      ProgressBar.dismiss(context);
                      showDialog(
                          context: context,
                          builder: (dialogueCtx) {
                            return AlertDialogueBox(
                                title: StringConstants.kSomethingWentWrong,
                                message: state.message,
                                errorMarkVisible: true,
                                primaryButtonTitle: StringConstants.kOk,
                                primaryOnPressed: () {
                                  Navigator.pop(dialogueCtx);
                                });
                          });
                    }
                    if (state is ErrorSavingBranch) {
                      ProgressBar.dismiss(context);
                      showDialog(
                          context: context,
                          builder: (dialogueCtx) {
                            return AlertDialogueBox(
                                title: StringConstants.kSomethingWentWrong,
                                message: state.message,
                                errorMarkVisible: true,
                                primaryButtonTitle: StringConstants.kOk,
                                primaryOnPressed: () {
                                  Navigator.pop(dialogueCtx);
                                });
                          });
                    }
                    if (state is ErrorFetchingBranches) {
                      ProgressBar.dismiss(context);
                      showDialog(
                          context: context,
                          builder: (dialogueCtx) {
                            return AlertDialogueBox(
                                title: StringConstants.kSomethingWentWrong,
                                message: state.message,
                                errorMarkVisible: true,
                                primaryButtonTitle: StringConstants.kOk,
                                primaryOnPressed: () {
                                  Navigator.pop(dialogueCtx);
                                });
                          });
                    }
                  }, buildWhen: (prev, curr) {
                    return curr is FetchedBranches || curr is FetchingBranches;
                  }, builder: (context, state) {
                    if (state is FetchingBranches) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchedBranches) {
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return (constraints.maxWidth < 600)
                              ? BranchGridMobileScreen(
                                  branchesData: state.branchList)
                              : BranchGridWebScreen(
                                  branchesData: state.branchList);
                        },
                      );
                    } else if (state is ErrorFetchingBranches) {
                      return Expanded(
                          child: Center(
                              child: Text(StringConstants.kNoDataAvailable,
                                  style: Theme.of(context)
                                      .textTheme
                                      .tinier
                                      .copyWith(
                                          color: AppColor.saasifyLightGrey))));
                    } else {
                      return const SizedBox.shrink();
                    }
                  }))
            ]));
  }
}
