import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_event.dart';
import 'package:saasify/bloc/inventory/inventory_states.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/inventory/widgets/inventory_list_data_table.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';

import '../../widgets/custom_page_header.dart';

class InventoryListScreen extends StatelessWidget {
  static const String routeName = 'InventoryListScreen';

  static List selectedIds = [];

  InventoryListScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<InventoryBloc>().add(FetchInventoryList());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 6),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kInventoryManagement),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 6),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<InventoryBloc, InventoryStates>(
                          listener: (context, state) {
                        if (state is UpdatingStock) {
                          ProgressBar.show(context);
                        } else if (state is UpdatedStock) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (dialogueCtx) {
                                return AlertDialogueBox(
                                    title: 'Success',
                                    message: state.message,
                                    checkMarkVisible: true,
                                    primaryButtonTitle: StringConstants.kOk,
                                    primaryOnPressed: () {
                                      Navigator.pop(dialogueCtx);
                                      context
                                          .read<InventoryBloc>()
                                          .add(FetchInventoryList());
                                    });
                              });
                        } else if (state is ErrorUpdatingStock) {
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
                        return curr is FetchedInventoryList ||
                            curr is FetchingInventoryList;
                      }, builder: (context, state) {
                        if (state is FetchingInventoryList) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedInventoryList) {
                          return Column(children: [
                            const CustomPageHeader(
                                utilityVisible: true,
                                titleText: StringConstants.kInventoryManagement,
                                textFieldVisible: true),
                            const SizedBox(height: spacingStandard),
                            InventoryListDataTable(
                                productList: state.productList),
                            Visibility(
                                visible: state.productList.isEmpty,
                                child: Center(
                                    child: Text(
                                        StringConstants.kNoDataAvailable,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColor
                                                    .saasifyLightGrey)))),
                            Visibility(
                                visible: state.productList.isEmpty,
                                child: const Spacer())
                          ]);
                        } else if (state is ErrorFetchingInventoryList) {
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
