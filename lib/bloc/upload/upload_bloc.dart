import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/bloc/upload/upload_states.dart';
import 'package:saasify/data/models/upload/upload_image_model.dart';
import 'package:saasify/repositories/upload/upload_repository.dart';
import '../../di/app_module.dart';

class UploadBloc extends Bloc<UploadEvents, UploadStates> {
  final UploadRepository _uploadRepository = getIt<UploadRepository>();
  List<XFile> pickedFiles = [];
  List<Uint8List> pickedImageList = [];
  List displayImageList = [];
  UploadStates get initialState => UploadImageInitial();

  UploadBloc() : super(UploadImageInitial()) {
    on<UploadImage>(_uploadImage);
    on<PickImage>(_pickImage);
    on<LoadImage>(_removeImage);
    on<NoImageSelected>(_noImageSelected);
  }

  Future _pickImage(PickImage event, Emitter<UploadStates> emit) async {
    try {
      if (kIsWeb) {
        final ImagePicker picker = ImagePicker();
        List<XFile> image = await picker.pickMultiImage();
        if (image.isNotEmpty) {
          pickedFiles.clear();
          pickedFiles.addAll(image);
          for (var item in image) {
            Uint8List image1 = await item.readAsBytes();
            pickedImageList.add(image1);
          }
          displayImageList.addAll(pickedImageList);
          emit(ImagePicked());
        } else if (displayImageList.isEmpty) {
          emit(ImageCouldNotPick());
        }
      }
    } catch (e) {
      emit(ImageCouldNotPick());
    }
  }

  Future<void> _uploadImage(
      UploadImage event, Emitter<UploadStates> emit) async {
    emit(UploadImageLoading());
    try {
      UploadImageModel uploadImageModel =
          await _uploadRepository.uploadImage(event.multiplePartFileList);
      if (uploadImageModel.status == 200) {
        emit(UploadImageLoaded(uploadImageModel: uploadImageModel));
      } else {
        emit(UploadImageError(message: uploadImageModel.message));
      }
    } catch (e) {
      emit(UploadImageError(message: e.toString()));
    }
  }

  FutureOr<void> _removeImage(
      LoadImage event, Emitter<UploadStates> emit) async {
    emit(ImagePicked());
  }

  FutureOr<void> _noImageSelected(
      NoImageSelected event, Emitter<UploadStates> emit) async {
    emit(NoImage());
  }
}
