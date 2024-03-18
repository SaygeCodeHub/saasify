import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saasify/bloc/details/details_bloc.dart';
import 'package:saasify/bloc/details/details_event.dart';
import 'package:saasify/bloc/details/details_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/details/fetch_details_model.dart';
import 'package:saasify/data/models/screenArguments/no_data_screen_arguments.dart';
import 'package:saasify/screens/details/widgets/staggered_grid_card_item.dart';
import 'package:saasify/screens/generalScreens/no_data_found_screen.dart';
import 'package:saasify/utils/button_utils.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = 'DetailsScreen';
  final String endpoint;

  const DetailsScreen({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    context.read<DetailsBloc>().add(FetchDetails());
    return ScreenSkeleton(
      childScreenBuilder: (isMobile) {
        return BlocConsumer<DetailsBloc, DetailsState>(
          listener: (context, state) {
            if (state is DetailsCouldNotFetch) {
              Navigator.pushReplacementNamed(
                  context, NoDataFoundScreen.routeName,
                  arguments: NoDataScreenArguments(
                      heading: "Error Fetching Data",
                      message: state.errorMessage));
            }
          },
          builder: (context, state) {
            if (state is FetchingDetails) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DetailsFetched) {
              return Padding(
                  padding: const EdgeInsets.all(spacingStandard),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          isMobile
                              ? const SizedBox.shrink()
                              : IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios)),
                          ModuleHeading(
                              label: state.fetchDetailsModel.data!.heading),
                          const Spacer(),
                          ...List.generate(
                              state.fetchDetailsModel.data!.utilityButtons
                                  .length, (index) {
                            UtilityButton button = state
                                .fetchDetailsModel.data!.utilityButtons[index];
                            return IconButton(
                                onPressed: () {
                                  ButtonUtils.buttonAction(context, {},
                                      buttonAction: button.buttonAction,
                                      endPoint: button.endPoint,
                                      apiMethodType: button.apiMethodType);
                                },
                                icon: ButtonUtils.getButtonIconFromType(
                                    button.buttonIcon));
                          })
                        ],
                      ),
                      const SizedBox(height: spacingStandard),
                      Expanded(
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: StaggeredGrid.count(
                              crossAxisCount: (isMobile) ? 1 : 2,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              children: List.generate(
                                  state.fetchDetailsModel.data!.sections.length,
                                  (index) => StaggeredGridCardItem(
                                      sections: state.fetchDetailsModel.data!
                                          .sections[index])),
                            )),
                      )
                    ],
                  ));
            } else if (state is DetailsCouldNotFetch) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
