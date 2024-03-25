import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../configs/app_colors.dart';

class ImagePickerWidget extends StatefulWidget {
  final Uint8List? imageBytes;
  final Function(Uint8List?) onImagePicked;

  const ImagePickerWidget({
    super.key,
    this.imageBytes,
    required this.onImagePicked,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  static Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImage,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.blue, width: 0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: widget.imageBytes != null
            ? Image.memory(widget.imageBytes!, fit: BoxFit.cover)
            : const Icon(Icons.add_photo_alternate, color: AppColors.grey),
      ),
    );
  }
}
