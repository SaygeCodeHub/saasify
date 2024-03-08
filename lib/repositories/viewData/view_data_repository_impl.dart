import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/repositories/viewData/view_data_repository.dart';

class ViewDataRepositoryImpl implements ViewDataRepository {
  // final Cache _cache = getIt<Cache>();

  @override
  Future<ViewDataModel> fetchData(String endpoint, Map data) async {
    try {
      // final companyId = await _cache.getCompanyId();
      // final branchId = await _cache.getBranchId();
      // final userId = await _cache.getUserId();
      //
      // final response = await ClientServices().post(
      //     "${ApiConstants.baseUrl3_0}$companyId/$branchId/$userId$endpoint",
      //     data);

      final response = data["isMobile"]
          ? {
              "status": 200,
              "message": "Data fetched successfully",
              "data": {
                "table_name": "Employees",
                "tile_data": {
                  "title_key": "name",
                  "subtitle_key": "email",
                  "avatar_key": "",
                  "status_key": "status",
                },
                "data": [
                  {
                    "id": 1,
                    "name": "John Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 2,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 3,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 4,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 5,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                ],
                "utility_buttons": [
                  {
                    "button_icon": "delete",
                    "button_action": "api_call",
                    "end_point": "/delete",
                    "api_method_type": "delete"
                  }
                ],
              }
            }
          : {
              "status": 200,
              "message": "Data fetched successfully",
              "data": {
                "table_name": "Employees",
                "columns": [
                  {
                    "column_title": "",
                    "data_key": "",
                    "column_width": 150,
                    "data_type": "avatar"
                  },
                  {
                    "column_title": "Name",
                    "data_key": "name",
                    "column_width": null,
                    "data_type": "text"
                  },
                  {
                    "column_title": "Email",
                    "data_key": "email",
                    "column_width": null,
                    "data_type": "text"
                  },
                  {
                    "column_title": "Phone",
                    "data_key": "phone",
                    "column_width": null,
                    "data_type": "text"
                  },
                  {
                    "column_title": "Status",
                    "data_key": "status",
                    "column_width": null,
                    "data_type": "status"
                  }
                ],
                "data": [
                  {
                    "id": 1,
                    "name": "John Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 2,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 3,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 4,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                  {
                    "id": 5,
                    "name": "Jane Doe",
                    "email": "john.doe@gmail.com",
                    "phone": "1234567890",
                    "status": "active",
                    "status_color": "12A5A5"
                  },
                ],
                "utility_buttons": [
                  {
                    "button_icon": "delete",
                    "button_action": "api_call",
                    "end_point": "/delete",
                    "api_method_type": "delete"
                  }
                ],
              }
            };

      return ViewDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
