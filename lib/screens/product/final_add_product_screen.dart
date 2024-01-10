import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import '../../widgets/sidebar.dart';
import 'add_product_screen_mobile.dart';
import 'add_product_screen_web.dart';

class AddProductScreen extends StatelessWidget {
  static const String routeName = 'AddProductScreen';

  final bool isEdit;
  final bool isVariant;
  final Map dataMap;
  final bool isProductDetail;

  AddProductScreen(
      {super.key,
      required this.isEdit,
      required this.isVariant,
      required this.dataMap,
      required this.isProductDetail});

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<UploadBloc>().pickedImageList.clear();
    context.read<UploadBloc>().displayImageList.clear();
    if (isEdit) {
      context.read<UploadBloc>().displayImageList.addAll(dataMap['images']);
    }
    context.read<ProductBloc>().add(FetchAllCategories());
    context.read<UploadBloc>().add(LoadImage());
    return Scaffold(
        drawer: const SideBar(selectedIndex: 3),
        key: _scaffoldKey,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.maxWidth < 600)
              ? AddProductScreenMobile(
                  isEdit: isEdit,
                  isVariant: isVariant,
                  dataMap: dataMap,
                  isProductDetail: isProductDetail,
                  formKey: _formKey,
                  scaffoldKey: _scaffoldKey)
              : AddProductScreenWeb(
                  isEdit: isEdit,
                  isVariant: isVariant,
                  dataMap: dataMap,
                  isProductDetail: isProductDetail,
                  scaffoldKey: _scaffoldKey,
                  formKey: _formKey);
        }));
  }
}
