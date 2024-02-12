import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';
import 'package:saasify/configs/dashboard_route.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';

class RootScreen extends StatelessWidget {
  static const routeName = 'RootScreen';

  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<InitialiseAppBloc>().add(InitialiseApp());
    return BlocListener<InitialiseAppBloc, InitialiseAppStates>(
      listener: (context, state) {
        if (state is InitialisingAppFailed) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ErrorAlertDialog(
                  description: state.errorMessage.toString());
            },
          );
        }
        if (state is AppInitialised) {
          DashboardRouting(
                  featureKey: state.initialiseAppModel.data!
                      .accessibleModules![0].moduleKey!,
                  context: context)
              .navigateTo();
          context.read<AttendanceBloc>().isGeoFencingEnabled =
              state.isGeoFencing;
        }
      },
      child: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
