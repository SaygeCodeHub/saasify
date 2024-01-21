import 'package:image_picker/image_picker.dart';
import 'package:saasify/data/models/upload/upload_image_model.dart';

abstract class UploadRepository {
  Future<UploadImageModel> uploadImage(List<XFile> multiplePartFileList);
}
