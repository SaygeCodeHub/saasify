import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/POS/pos_screen.dart';
import 'package:saasify/screens/form/form_screen.dart';
import 'package:saasify/screens/viewData/view_data_screen.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/drawer/drawer_list_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final List<Map<String, dynamic>> posOfflineData = [
    {'name': 'Add Category', 'endpoint': '/buildCategoryForm'},
    {'name': 'View Categories', 'endpoint': '/buildCategories'},
    {'name': 'Add Product', 'endpoint': '/buildProductForm'},
    {'name': 'View Products', 'endpoint': '/buildProducts'},
    {'name': 'Inventory', 'endpoint': '/buildInventory'},
  ];

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
              (isOnline == true)
                  ? ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final module = snapshot.data![index].toJson();
                        return DrawerListTileWidget(module: module);
                      },
                    )
                  : Column(
                      children: [
                        ListTile(
                          minLeadingWidth: spacingStandard,
                          leading: const Icon(Icons.desktop_mac_outlined,
                              color: AppColors.black),
                          title: Text('POS',
                              style: Theme.of(context)
                                  .textTheme
                                  .drawerModuleTextStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: spacingHuge),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: posOfflineData.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                    posOfflineData[index]['name'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .drawerFeatureTextStyle,
                                  ),
                                  onTap: () {
                                    switch (posOfflineData[index]['endpoint']) {
                                      case '/buildCategoryForm':
                                        Navigator.pushNamed(
                                            context, FormScreen.routeName,
                                            arguments: posOfflineData[index]
                                                    ['endpoint'] ??
                                                '');
                                      case '/buildProductForm':
                                        Navigator.pushNamed(
                                            context, FormScreen.routeName,
                                            arguments: posOfflineData[index]
                                                    ['endpoint'] ??
                                                '');
                                      case '/buildCategories':
                                        Navigator.pushNamed(
                                            context, ViewListScreen.routeName,
                                            arguments: posOfflineData[index]
                                                    ['endpoint'] ??
                                                '');
                                      case '/buildProducts':
                                        Navigator.pushNamed(
                                            context, ViewListScreen.routeName,
                                            arguments: posOfflineData[index]
                                                    ['endpoint'] ??
                                                '');
                                    }
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
              ListTile(
                  minLeadingWidth: spacingStandard,
                  leading: const Icon(Icons.point_of_sale_outlined,
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
