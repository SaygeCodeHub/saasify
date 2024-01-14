import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SaasifyLogo extends StatelessWidget {
  final double width;
  final double height;
  const SaasifyLogo({super.key, this.width = 50, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/SaaSify_Logo.svg",
        width: width, height: height);
  }
}
