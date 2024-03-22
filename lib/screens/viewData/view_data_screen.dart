import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/viewData/view_data_bloc.dart';
import 'package:saasify/bloc/viewData/view_data_event.dart';
import 'package:saasify/bloc/viewData/view_data_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/screenArguments/no_data_screen_arguments.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/generalScreens/no_data_found_screen.dart';
import 'package:saasify/screens/viewData/view_data_mobile.dart';
import 'package:saasify/screens/viewData/view_data_web.dart';
import 'package:saasify/utils/button_utils.dart';
import 'package:saasify/widgets/buttons/back_button.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class ViewListScreen extends StatelessWidget {
  static const String routeName = 'ViewListScreen';

  final String endpoint;

  const ViewListScreen({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    List<int> selectedIds = [];
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      context
          .read<ViewDataBloc>()
          .add(FetchData(endpoint: endpoint, isMobile: isMobile));
      return Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: BlocConsumer<ViewDataBloc, ViewDataStates>(
          listener: (context, state) {
            if (state is ErrorFetchingData) {
              Navigator.pushReplacementNamed(
                  context, NoDataFoundScreen.routeName,
                  arguments: NoDataScreenArguments(
                      heading: "Error Fetching Data", message: state.error));
            }
          },
          builder: (context, state) {
            if (state is FetchingData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorFetchingData) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is DataFetched) {
              return Column(
                children: [
                  Row(
                    children: [
                      isMobile
                          ? const SizedBox.shrink()
                          : CustomBackButton(onPressed: () {
                              Navigator.pop(context);
                            }),
                      ModuleHeading(
                          label: (state.viewData.tableName.isEmpty)
                              ? state.viewData.screenName
                              : state.viewData.tableName),
                      const Spacer(),
                      ...List.generate(state.viewData.utilityButtons!.length,
                          (index) {
                        UtilityButton button =
                            state.viewData.utilityButtons![index];
                        return IconButton(
                            onPressed: () {
                              ButtonUtils.buttonAction(
                                  context, {"selectedIds": selectedIds},
                                  buttonAction: button.buttonAction,
                                  endPoint: button.endPoint,
                                  apiMethodType: button.apiMethodType);
                            },
                            icon: ButtonUtils.getButtonIconFromType(state
                                .viewData.utilityButtons![index].buttonIcon));
                      })
                    ],
                  ),
                  const SizedBox(height: spacingStandard),
                  Expanded(
                      child: ResponsiveLayout(
                          mobileBody: ViewDataMobile(
                              viewData: state.viewData,
                              onRefresh: () {
                                context.read<ViewDataBloc>().add(FetchData(
                                    endpoint: endpoint, isMobile: isMobile));
                              }),
                          provideMobilePadding: false,
                          desktopBody: ViewDataWeb(
                              viewData: state.viewData,
                              onRefresh: () {
                                context.read<ViewDataBloc>().add(FetchData(
                                    endpoint: endpoint, isMobile: isMobile));
                              },
                              onSelectChanged: (selectedIds) {
                                selectedIds = selectedIds;
                              },
                              viewPosData: state.viewPosData,
                              isMobile: isMobile)))
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
    });
  }
}

Color getColorFromStatus(String? statusColor) {
  return Color(int.tryParse(statusColor ?? '') ?? 0xFFF7F9FB);
}
