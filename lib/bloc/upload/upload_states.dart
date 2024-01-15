import 'package:saasify/data/models/upload/upload_image_model.dart';

abstract class UploadStates {}

class UploadImageInitial extends UploadStates {}

class UploadImageLoading extends UploadStates {}

class UploadImageLoaded extends UploadStates {
  final UploadImageModel uploadImageModel;

  UploadImageLoaded({required this.uploadImageModel});
}

class UploadImageError extends UploadStates {
  final String message;

  UploadImageError({required this.message});
}

class ImagePicked extends UploadStates {}

class NoImage extends UploadStates {}

class RemovedImage extends UploadStates {}

class ImageCouldNotPick extends UploadStates {}
