import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/buttons/secondary_button.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/custom_dropdown_widget.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/formWidgets/check_box_widget.dart';
import '../../widgets/formWidgets/radio_button_widget.dart';
import '../../widgets/text/module_heading.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = 'newScreen';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? selectedValue;
  String? checkedValue;

  final List<String> titles = [
    'Send me email notifications',
    'Once an hour at most',
    'Never'
  ];

  final List<String> text = [
    'Most secure',
    'Standard',
    'Don\'t send me any sign-in notifications'
  ];

  final List subText = [
    'Receive an email everytime someone signs in to your Cuboid account from an unrecognized device.',
    'Receive an email when someone signs in from a new location, with an unrecognized device',
    null
  ];

  final List<String> checkboxTitle = [
    'Tips and tricks',
    'Offers and promotions',
    'Research opportunities',
    'Cuboid Developer Newsletter: Best practices for connecting your work to substance via our platform ',
    'Cuboid Platform Changelog: Stay in the know when we make updates to our API\'s'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenSkeleton(
            childScreenBuilder: (bool isMobile) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: spacingMedium),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: spacingMedium, right: spacingMedium),
                          child: Row(children: [
                            isMobile
                                ? const SizedBox.shrink()
                                : const BackButton(),
                            const SizedBox(width: spacingXMedium),
                            const ModuleHeading(
                                label: StringConstants.kNotifications),
                            const Expanded(child: SizedBox())
                          ])),
                      Expanded(
                          child: BackgroundCardWidget(
                              childScreen: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: spacingMedium,
                                      vertical: spacingLarge),
                                  child: Form(
                                      child: SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                        Text(
                                            StringConstants.kEmailNotifications,
                                            style: Theme.of(context)
                                                .textTheme
                                                .formSectionHeadingTextStyle),
                                        const SizedBox(height: spacingSmall),
                                        Text(
                                            StringConstants
                                                .kEmailNotificationDescription,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subDetailTextStyle),
                                        const SizedBox(height: spacingLarge),
                                        Text(
                                            StringConstants
                                                .kSendMeEmailNotifications,
                                            style: Theme.of(context)
                                                .textTheme
                                                .formSectionHeadingTextStyle),
                                        const SizedBox(height: spacingSmall),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: titles.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomRadioListTile(
                                                  dense: true,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  value: 'value_$index',
                                                  groupValue: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue = value;
                                                    });
                                                  },
                                                  title: Text(titles[index]));
                                            }),
                                        const SizedBox(height: spacingLarge),
                                        Text(
                                            StringConstants
                                                .kEmailNewsAndUpdates,
                                            style: Theme.of(context)
                                                .textTheme
                                                .formSectionHeadingTextStyle),
                                        const SizedBox(height: spacingSmall),
                                        Text(
                                            StringConstants
                                                .kEmailNewsAndUpdatesDescription,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subDetailTextStyle),
                                        const SizedBox(height: spacingSmall),
                                        CustomCheckboxListTile(
                                            onChanged: (List<dynamic> value) {},
                                            items:
                                                List<CustomDropDownItem>.from(
                                                    checkboxTitle.map((e) =>
                                                        CustomDropDownItem(
                                                            label: e,
                                                            value: e))),
                                            selectedValues: const []),
                                        const SizedBox(height: spacingLarge),
                                        Text(
                                            StringConstants
                                                .kSignInNotifications,
                                            style: Theme.of(context)
                                                .textTheme
                                                .formSectionHeadingTextStyle),
                                        const SizedBox(height: spacingSmall),
                                        Text(
                                            StringConstants
                                                .kSignInNotificationsDescription,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subDetailTextStyle),
                                        const SizedBox(height: spacingSmall),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: text.length,
                                            itemBuilder: (context, index) {
                                              return CustomRadioListTile(
                                                  dense: true,
                                                  value: 'value_$index',
                                                  groupValue: checkedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkedValue = value;
                                                    });
                                                  },
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  title: Text(text[index]),
                                                  subtitle:
                                                      subText[index] != null
                                                          ? Text(subText[index])
                                                          : null);
                                            }),
                                        const SizedBox(height: spacingLarge),
                                        Text(
                                            StringConstants
                                                .kNotificationsDescription,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subDetailTextStyle),
                                        const SizedBox(height: spacingLarge),
                                        Text(StringConstants.kUseThisEmail,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subDetailTextStyle),
                                        const SizedBox(height: spacingLarge),
                                      ])))))),
                      Padding(
                          padding: const EdgeInsets.only(
                              right: spacingLarge, bottom: spacingLarge),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SecondaryButton(
                                        side: const BorderSide(
                                            color: AppColors.grey),
                                        buttonWidth: kGeneralActionButtonWidth,
                                        onPressed: () {},
                                        buttonTitle: "Discard"),
                                    const SizedBox(width: 20),
                                    PrimaryButton(
                                        buttonWidth: kGeneralActionButtonWidth,
                                        onPressed: () {},
                                        buttonTitle: 'Save Changes')
                                  ])))
                    ])));
  }
}
