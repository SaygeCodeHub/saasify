import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/viewData/view_data_bloc.dart';
import 'package:saasify/bloc/viewData/view_data_event.dart';
import 'package:saasify/bloc/viewData/view_data_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/viewData/view_data_mobile.dart';
import 'package:saasify/screens/viewData/view_data_web.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class ViewDataScreen extends StatelessWidget {
  static const String routeName = 'ViewDataScreen';

  final String endpoint;

  const ViewDataScreen({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      context
          .read<ViewDataBloc>()
          .add(FetchData(endpoint: endpoint, isMobile: isMobile));
      return Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: BlocBuilder<ViewDataBloc, ViewDataStates>(
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
                  ModuleHeading(
                    label: state.viewData.tableName,
                  ),
                  Expanded(
                      child: ResponsiveLayout(
                          mobileBody: ViewDataMobile(viewData: state.viewData),
                          desktopBody: ViewDataWeb(viewData: state.viewData)))
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

getColorFromStatus(List<Status> statusTypes, String status) {
  return statusTypes.firstWhere((element) => element.status == status,
      orElse: () => Status(status: status, color: "F7F9FB"));
}
