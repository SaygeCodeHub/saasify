import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/bloc/upload/upload_states.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';

import '../product_screen.dart';

class FormImageSection extends StatelessWidget {
  const FormImageSection({
    super.key,
    required this.isEdit,
    required this.dataMap,
    required this.isProductDetail,
  });

  final bool isEdit;
  final bool isProductDetail;
  final Map dataMap;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(StringConstants.kUploadImages,
                style: Theme.of(context)
                    .textTheme
                    .xxTiniest
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(width: spacingXSmall),
            (isProductDetail == true)
                ? const SizedBox()
                : Text(StringConstants.kMinimumOneImage,
                    style: Theme.of(context).textTheme.xTiniest)
          ]),
          const SizedBox(height: spacingLarge),
          (isProductDetail == true)
              ? GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 1,
                      crossAxisSpacing: spacingStandard),
                  itemBuilder: (context, index) {
                    if (index < dataMap['images'].length) {
                      return Container(
                        padding: const EdgeInsets.all(kCircularRadius),
                        decoration: BoxDecoration(
                            color: AppColor.saasifyLighterWhite,
                            border: Border.all(color: AppColor.saasifyGrey)),
                        child: Container(
                            height: kContainerHeight,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(dataMap['images'][index])),
                                borderRadius:
                                    BorderRadius.circular(kCircularRadius))),
                      );
                    }
                    return Container(
                        decoration: BoxDecoration(
                            color: AppColor.saasifyWhite,
                            borderRadius:
                                BorderRadius.circular(kCircularRadius)));
                  })
              : BlocConsumer<UploadBloc, UploadStates>(
                  listener: (context, state) {
                    if (state is UploadImageLoading) {
                      ProgressBar.show(context);
                    } else if (state is UploadImageLoaded) {
                      ProgressBar.dismiss(context);
                      if (isEdit) {
                        dataMap['images'].addAll(state.uploadImageModel.data);
                        context
                            .read<ProductBloc>()
                            .add(EditProduct(productDetailsMap: dataMap));
                      } else {
                        dataMap['images'] = state.uploadImageModel.data;
                        context
                            .read<ProductBloc>()
                            .add(SaveProduct(productDetailsMap: dataMap));
                      }
                    } else if (state is UploadImageError) {
                      ProgressBar.dismiss(context);
                      showDialog(
                          context: context,
                          builder: (context) => Expanded(
                              child: AlertDialogueBox(
                                  title: StringConstants.kSomethingWentWrong,
                                  message: state.message,
                                  primaryButtonTitle: StringConstants.kOk,
                                  checkMarkVisible: false,
                                  primaryOnPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, ProductScreen.routeName);
                                  })));
                    }
                  },
                  buildWhen: (prev, curr) {
                    return curr is ImagePicked ||
                        curr is NoImage ||
                        curr is ImageCouldNotPick;
                  },
                  builder: (context, state) {
                    if (state is ImagePicked) {
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: spacingStandard),
                          itemBuilder: (context, index) {
                            if (index <
                                context
                                    .read<UploadBloc>()
                                    .displayImageList
                                    .length) {
                              return Stack(
                                children: [
                                  (context
                                          .read<UploadBloc>()
                                          .displayImageList[index] is String)
                                      ? Padding(
                                          padding: const EdgeInsets.all(
                                              spacingLarge),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(context
                                                              .read<UploadBloc>()
                                                              .displayImageList[
                                                          index])),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          spacingSmall))),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(
                                              spacingLarge),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: MemoryImage(context
                                                              .read<UploadBloc>()
                                                              .displayImageList[
                                                          index])),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          spacingSmall))),
                                        ),
                                  Positioned(
                                    right: 0,
                                    child: InkWell(
                                        onTap: () {
                                          (context
                                                      .read<UploadBloc>()
                                                      .displayImageList[index]
                                                  is! String)
                                              ? context
                                                  .read<UploadBloc>()
                                                  .pickedImageList
                                                  .remove(context
                                                      .read<UploadBloc>()
                                                      .displayImageList[index])
                                              : dataMap['images'].remove(context
                                                  .read<UploadBloc>()
                                                  .displayImageList[index]);
                                          context
                                              .read<UploadBloc>()
                                              .displayImageList
                                              .removeAt(index);
                                          context
                                              .read<UploadBloc>()
                                              .add(LoadImage());
                                        },
                                        child: Image.asset('assets/close.png',
                                            height: kCloseIconSize,
                                            width: kCloseIconSize)),
                                  )
                                ],
                              );
                            }
                            return InkWell(
                                onTap: () {
                                  context.read<UploadBloc>().add(PickImage());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.saasifyLighterWhite,
                                      border: Border.all(
                                          color: AppColor.saasifyGrey),
                                      borderRadius: BorderRadius.circular(
                                          kCircularRadius)),
                                  child: Center(
                                      child: Image.asset('assets/upload.png',
                                          height: 25,
                                          width: 25,
                                          color: AppColor.saasifyPaleBlack)),
                                ));
                          });
                    }
                    if (state is NoImage || state is ImageCouldNotPick) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(spacingSmall),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.saasifyRed),
                                borderRadius: BorderRadius.circular(12)),
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: 6,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 6,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: spacingStandard),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        context
                                            .read<UploadBloc>()
                                            .add(PickImage());
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                AppColor.saasifyLightWhiteGrey,
                                            borderRadius: BorderRadius.circular(
                                                kCircularRadius)),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/upload.png',
                                                height: 50,
                                                width: 50)),
                                      ));
                                }),
                          ),
                          const SizedBox(height: spacingSmall),
                          Text('Please upload at least one image',
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(color: AppColor.saasifyRed))
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
        ]);
  }
}
