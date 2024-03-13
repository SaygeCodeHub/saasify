import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/POS/pos_screen.dart';
import 'package:saasify/widgets/drawer/drawer_list_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<List<ModulesModel>>(
        future: getIt<Cache>().getAccessibleModules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Placeholder while loading
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView(shrinkWrap: true, children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.035,
                  height: MediaQuery.sizeOf(context).width * 0.035),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final module = snapshot.data![index].toJson();
                  return DrawerListTileWidget(module: module);
                },
              ),
              ListTile(
                  minLeadingWidth: spacingStandard,
                  leading: Icon(Icons.point_of_sale_outlined,
                      color: AppColors.orange, size: spacingStandard),
                  onTap: () {
                    Navigator.pushNamed(context, POSScreen.routeName);
                  },
                  title: Text("POS",
                      style: Theme.of(context).textTheme.drawerModuleTextStyle))
            ]);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
