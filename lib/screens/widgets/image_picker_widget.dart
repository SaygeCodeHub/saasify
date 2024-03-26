import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../../utils/image_handling.dart';

class ImagePickerWidget extends StatefulWidget {
  final String label;
  final Uint8List? initialImage;
  final ValueChanged<Uint8List> onImagePicked;

  const ImagePickerWidget({
    super.key,
    this.initialImage,
    required this.onImagePicked,
    required this.label,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _imageBytes = widget.initialImage;
  }

  Future<void> _pickAndSetImage() async {
    final XFile? pickedImageFile = await ImageUtil.pickImage();
    if (pickedImageFile != null) {
      final Uint8List imageBytes = await pickedImageFile.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
      });
      widget.onImagePicked(imageBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.label,
            style: Theme.of(context).textTheme.fieldLabelTextStyle),
        const SizedBox(height: spacingSmall),
        InkWell(
          onTap: _pickAndSetImage,
          child: _imageBytes != null
              ? Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.memory(_imageBytes!, fit: BoxFit.cover),
                )
              : Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    border: Border.all(color: AppColors.darkBlue, width: 0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.upload, color: AppColors.darkGrey),
                ),
        ),
      ],
    );
  }
}
