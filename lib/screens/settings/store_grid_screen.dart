import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/branches/branches_bloc.dart';
import 'package:saasify/bloc/branches/branches_event.dart';
import 'package:saasify/bloc/branches/branches_states.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/settings/widgets/add_store_popup.dart';
import 'package:saasify/screens/settings/widgets/branches_grid.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_page_header.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/alert_dialogue_box.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import '../dashboard/dashboard_screen.dart';

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
                  child: Padding(
                      padding: const EdgeInsets.only(
                          right: spacingXHuge,
                          top: spacingXMedium,
                          left: spacingXHuge,
                          bottom: spacingXHuge),
                      child: BlocConsumer<BranchesBloc, BranchesStates>(
                          listener: (context, state) {
                        if (state is ErrorFetchingBranches) {
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
                        return curr is FetchedBranches ||
                            curr is FetchingBranches;
                      }, builder: (context, state) {
                        if (state is FetchingBranches) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedBranches) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomPageHeader(
                                  titleText: StringConstants.kBranches,
                                  onBack: () {
                                    Navigator.pushReplacementNamed(
                                        context, DashboardsScreen.routeName);
                                  },
                                  backIconVisible: true,
                                  buttonTitle: StringConstants.kAddNewBranch,
                                  buttonVisible: true,
                                  textFieldVisible: false,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) =>
                                            const AddStorePopup());
                                  },
                                ),
                                const SizedBox(height: spacingStandard),
                                BranchesGrid(branchesData: state.branchList)
                              ]);
                        } else if (state is ErrorFetchingBranches) {
                          return Expanded(
                              child: Center(
                                  child: Text(StringConstants.kNoDataAvailable,
                                      style: Theme.of(context)
                                          .textTheme
                                          .tinier
                                          .copyWith(
                                              color:
                                                  AppColor.saasifyLightGrey))));
                        } else {
                          return const SizedBox.shrink();
                        }
                      })))
            ]));
  }
}
