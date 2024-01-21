import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ClientServices {
  final Dio dio =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 45), headers: {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true"
  }));

  Future<dynamic> get(String requestUrl) async {
    try {
      final response = await dio.get(requestUrl);
      dynamic jsonResponse = response.data;
      return jsonResponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw Exception('Response Error: ${e.response!.statusCode}');
        } else {
          throw Exception('Request Error: ${e.message}');
        }
      } else {
        throw Exception('Unexpected Error: $e');
      }
    }
  }

  Future<Map<String, dynamic>> post(String requestUrl, Map body) async {
    try {
      final response = await dio.post(requestUrl, data: body);
      dynamic jsonResponse = response.data;
      return jsonResponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw Exception('Response Error: ${e.response!.statusCode}');
        } else {
          throw Exception('Request Error: ${e.message}');
        }
      } else {
        throw Exception('Unexpected Error: $e');
      }
    }
  }

  Future<Map<String, dynamic>> put(String requestUrl, Map body) async {
    try {
      final response = await dio.put(requestUrl, data: body);
      dynamic jsonResponse = response.data;
      return jsonResponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw Exception('Response Error: ${e.response!.statusCode}');
        } else {
          throw Exception('Request Error: ${e.message}');
        }
      } else {
        throw Exception('Unexpected Error: $e');
      }
    }
  }

  Future<Map<String, dynamic>> delete(String requestUrl, Map body) async {
    try {
      final response = await dio.delete(requestUrl, data: body);
      dynamic jsonResponse = response.data;
      return jsonResponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw Exception('Response Error: ${e.response!.statusCode}');
        } else {
          throw Exception('Request Error: ${e.message}');
        }
      } else {
        throw Exception('Unexpected Error: $e');
      }
    }
  }

  Future<dynamic> multiPart(String requestUrl, List<XFile> imageFiles) async {
    dynamic jsonResponse;
    try {
      var formData = FormData();

      for (var imageFile in imageFiles) {
        formData.files.add(MapEntry(
            'upload_files',
            MultipartFile.fromBytes(await imageFile.readAsBytes(),
                filename: imageFile.name)));
      }

      final response = await dio.post(requestUrl, data: formData);
      jsonResponse = response.data;
      return jsonResponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw Exception('Response Error: ${e.response!.statusCode}');
        } else {
          throw Exception('Request Error: ${e.message}');
        }
      } else {
        throw Exception('Unexpected Error: $e');
      }
    }
  }
}
