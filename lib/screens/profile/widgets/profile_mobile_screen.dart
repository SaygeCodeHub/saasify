import 'package:flutter/material.dart';
import 'package:saasify/screens/profile/widgets/profile_form.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/profile/fetch_profile_details_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({super.key, required this.profileData});

  final ProfileData profileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kCircularRadius),
              boxShadow: const [
                BoxShadow(color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
              ],
              color: AppColor.saasifyWhite),
          child: PrimaryButton(
              onPressed: () {},
              buttonTitle: StringConstants.kUpdate,
              buttonWidth: spacingXXXXHuge)),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: kDashContainerHeight,
              width: kImageContainerWidth,
              decoration: BoxDecoration(
                  color: AppColor.saasifyLightWhiteGrey,
                  borderRadius: BorderRadius.circular(kCircularRadius)),
              child: Padding(
                  padding: const EdgeInsets.all(spacingStandard),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: spacingSmall),
                        (profileData.storeLogo.toString().isNotEmpty)
                            ? Image.network(
                                profileData.storeLogo.toString(),
                                height: spacingXLarge,
                                width: spacingXLarge,
                                color: AppColor.saasifyPaleBlack,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(
                                      StringConstants.kImageIsNotAvailable);
                                },
                              )
                            : Image.asset("assets/error_image.png",
                                height: kButtonHeight),
                      ])),
            ),
            const SizedBox(height: spacingStandard),
            Padding(
                padding: const EdgeInsets.only(right: spacingXXLarge),
                child: ProfileScreenForm(profileData: profileData))
          ]),
    );
  }
}
