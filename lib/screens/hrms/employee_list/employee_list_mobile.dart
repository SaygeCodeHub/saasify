import 'package:flutter/material.dart';
import 'package:saasify/widgets/list_tile_widget.dart';

class EmployeeListMobile extends StatelessWidget {
  const EmployeeListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemCount: 150,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return const ListTileWidget(
                    title: 'Deep Doshi',
                    subtitle: 'AAJK1OW1923',
                    avatarUrl: 'assets/user.png');
              }),
        ),
      ],
    );
  }
}
