class PosOfflineModel {
  bool isOfflineMode;
  Map<String, dynamic> getProductWithCategoryMap;
  Map<String, dynamic> addProduct;
  Map<String, dynamic> addVariant;

  PosOfflineModel(
      {this.getProductWithCategoryMap = const {},
      this.isOfflineMode = false,
      this.addProduct = const {},
      this.addVariant = const {}});
}
