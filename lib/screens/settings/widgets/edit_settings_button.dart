import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

import '../../../bloc/settings/settings_bloc.dart';
import '../../../bloc/settings/settings_events.dart';
import '../../../utils/constants/string_constants.dart';

class EditSettingsButton extends StatelessWidget {
  final bool isMobile;
  final GlobalKey<FormState> formKey;

  const EditSettingsButton({super.key, this.isMobile = false, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        onPressed: () {
          context.read<SettingsBloc>().add(UpdateSettings());
        },
        buttonTitle: StringConstants.kEdit,
        buttonWidth:
            !isMobile ? MediaQuery.sizeOf(context).width * 0.10 : null);
  }
}
