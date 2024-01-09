import 'package:flutter/material.dart';

import '../../../utils/constants/string_constants.dart';
import 'add_coupon_pop_up.dart';

class ThreeDotsPopup extends StatelessWidget {
  const ThreeDotsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => const AddCouponPopUp(editCoupon: true));
                },
                child: const Text(StringConstants.kEdit)),
          ];
        },
        child: const Icon(Icons.more_vert));
  }
}
