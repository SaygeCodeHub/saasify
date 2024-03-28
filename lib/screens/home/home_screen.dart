import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/home/widgets/feature_card_widget.dart';
import '../../utils/feature_list.dart';
import 'avtar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Ashish,',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1234.00',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircularAvatarWidget(
                    labelText: 'Add New',
                    iconData: Icons.add,
                  ),
                  SizedBox(width: 8),
                  CircularAvatarWidget(
                    labelText: 'Jane Doe',
                    iconData: Icons.person,
                  ),
                  SizedBox(width: 8),
                  CircularAvatarWidget(
                    labelText: 'Alice Smith',
                    iconData: Icons.person,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0), // Add padding
              child: Text(
                'Here are some things that you can do', // New text
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(spacingSmall),
                itemCount: features.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return FeatureCardWidget(
                    icon: features[index].icon,
                    label: features[index].label,
                    screen: features[index].screen,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
