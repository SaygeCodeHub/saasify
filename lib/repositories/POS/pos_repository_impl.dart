import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/POS/checkout_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/POS/pos_repository.dart';

class POSRepositoryImpl implements POSRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<ProductsWithCategoriesModel> getAllProductsWithCategories() async {
    try {
      // var companyId = await cache.getCompanyId();
      // var branchId = await cache.getBranchId();
      // var userId = await cache.getUserId();

      Map<String, dynamic> response = {
        "status": 200,
        "message": "",
        "data": [
          {
            "category_id": 1,
            "category_name": "Electronics",
            "category_icon/image": "https://picsum.photos/200",
            "products": [
              {
                "product_id": 1,
                "product_name": "Smartphone",
                "variants": [
                  {
                    "variant_id": 1,
                    "quantity": 10,
                    "unit": "nos",
                    "cost": 500.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 2,
                    "quantity": 15,
                    "unit": "nos",
                    "cost": 600.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  },
                  {
                    "variant_id": 3,
                    "quantity": 20,
                    "unit": "nos",
                    "cost": 700.00,
                    "image": "https://picsum.photos/200",
                    "discount": 20.00
                  }
                ]
              },
              {
                "product_id": 2,
                "product_name": "Laptop",
                "variants": [
                  {
                    "variant_id": 4,
                    "quantity": 8,
                    "unit": "nos",
                    "cost": 1000.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 5,
                    "quantity": 12,
                    "unit": "nos",
                    "cost": 1200.00,
                    "image": "https://picsum.photos/200",
                    "discount": 8.00
                  },
                  {
                    "variant_id": 6,
                    "quantity": 18,
                    "unit": "nos",
                    "cost": 1500.00,
                    "image": "https://picsum.photos/200",
                    "discount": 12.00
                  }
                ]
              }
            ]
          },
          {
            "category_id": 2,
            "category_name": "Clothing",
            "category_icon/image": "https://picsum.photos/200",
            "products": [
              {
                "product_id": 7,
                "product_name": "T-shirt",
                "variants": [
                  {
                    "variant_id": 7,
                    "quantity": 25,
                    "unit": "nos",
                    "cost": 20.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 8,
                    "quantity": 30,
                    "unit": "nos",
                    "cost": 25.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 9,
                    "quantity": 35,
                    "unit": "nos",
                    "cost": 30.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              },
              {
                "product_id": 8,
                "product_name": "Jeans",
                "variants": [
                  {
                    "variant_id": 10,
                    "quantity": 20,
                    "unit": "nos",
                    "cost": 40.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 11,
                    "quantity": 25,
                    "unit": "nos",
                    "cost": 45.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  },
                  {
                    "variant_id": 12,
                    "quantity": 30,
                    "unit": "nos",
                    "cost": 50.00,
                    "image": "https://picsum.photos/200",
                    "discount": 20.00
                  }
                ]
              },
              {
                "product_id": 9,
                "product_name": "Shirt",
                "variants": [
                  {
                    "variant_id": 13,
                    "quantity": 15,
                    "unit": "nos",
                    "cost": 30.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 14,
                    "quantity": 20,
                    "unit": "nos",
                    "cost": 35.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 15,
                    "quantity": 25,
                    "unit": "nos",
                    "cost": 40.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              }
            ]
          },
          {
            "category_id": 3,
            "category_name": "Footwear",
            "category_icon/image": "https://picsum.photos/200",
            "products": [
              {
                "product_id": 10,
                "product_name": "Shoes",
                "variants": [
                  {
                    "variant_id": 16,
                    "quantity": 10,
                    "unit": "nos",
                    "cost": 50.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 17,
                    "quantity": 15,
                    "unit": "nos",
                    "cost": 60.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 18,
                    "quantity": 20,
                    "unit": "nos",
                    "cost": 70.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              },
              {
                "product_id": 11,
                "product_name": "Slippers",
                "variants": [
                  {
                    "variant_id": 19,
                    "quantity": 20,
                    "unit": "nos",
                    "cost": 20.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 20,
                    "quantity": 25,
                    "unit": "nos",
                    "cost": 25.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 21,
                    "quantity": 30,
                    "unit": "nos",
                    "cost": 30.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              }
            ]
          },
          {
            "category_id": 4,
            "category_name": "Accessories",
            "category_icon/image": "https://picsum.photos/200",
            "products": [
              {
                "product_id": 12,
                "product_name": "Watch",
                "variants": [
                  {
                    "variant_id": 22,
                    "quantity": 15,
                    "unit": "nos",
                    "cost": 100.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 23,
                    "quantity": 20,
                    "unit": "nos",
                    "cost": 120.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 24,
                    "quantity": 25,
                    "unit": "nos",
                    "cost": 150.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              },
              {
                "product_id": 13,
                "product_name": "Sunglasses",
                "variants": [
                  {
                    "variant_id": 25,
                    "quantity": 10,
                    "unit": "nos",
                    "cost": 50.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 26,
                    "quantity": 15,
                    "unit": "nos",
                    "cost": 60.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 27,
                    "quantity": 20,
                    "unit": "nos",
                    "cost": 70.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              }
            ]
          },
          {
            "category_id": 5,
            "category_name": "Furniture",
            "category_icon/image": "https://picsum.photos/200",
            "products": [
              {
                "product_id": 14,
                "product_name": "Sofa",
                "variants": [
                  {
                    "variant_id": 28,
                    "quantity": 5,
                    "unit": "nos",
                    "cost": 200.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 29,
                    "quantity": 8,
                    "unit": "nos",
                    "cost": 250.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 30,
                    "quantity": 10,
                    "unit": "nos",
                    "cost": 300.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              },
              {
                "product_id": 15,
                "product_name": "Bed",
                "variants": [
                  {
                    "variant_id": 31,
                    "quantity": 3,
                    "unit": "nos",
                    "cost": 300.00,
                    "image": "https://picsum.photos/200",
                    "discount": 5.00
                  },
                  {
                    "variant_id": 32,
                    "quantity": 5,
                    "unit": "nos",
                    "cost": 350.00,
                    "image": "https://picsum.photos/200",
                    "discount": 10.00
                  },
                  {
                    "variant_id": 33,
                    "quantity": 7,
                    "unit": "nos",
                    "cost": 400.00,
                    "image": "https://picsum.photos/200",
                    "discount": 15.00
                  }
                ]
              }
            ]
          }
        ]
      };

      // final response =  await ClientServices().get("${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.getAllProductsWithCategories}");
      return ProductsWithCategoriesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CheckOutModel> checkout(Map orderDetails) async {
    try {
      // var companyId = await cache.getCompanyId();
      // var branchId = await cache.getBranchId();
      // var userId = await cache.getUserId();

      Map<String, dynamic> response = {
        "status": 200,
        "message": "Order placed successfully",
        "data": {
          "order_id": 1,
          "order_date": "2021-09-01",
          "order_time": "10:00:00",
          "order_amount": 1000.00,
          "order_status": "Placed"
        }
      };

      // final response =  await ClientServices().post("${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.checkout}", orderDetails);
      return CheckOutModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
