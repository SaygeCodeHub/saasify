import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/customer_model.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import 'package:saasify/data/models/billing/settle_order_model.dart';
import '../../di/app_module.dart';
import '../../repositories/billing/billing_repository.dart';
import '../../data/database/database_util.dart';
import 'billing_event.dart';
import 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvents, BillingStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final BillingRepository _billingRepository = getIt<BillingRepository>();
  int selectedCategoryIndex = 0;
  bool billExpanded = false;
  String orderId = '';
  Customer customer = Customer(
      customerName: '',
      customerContact: '',
      billDetails: BillModel(
          itemTotal: 0,
          total: 0,
          discount: 0,
          discountPercent: 0,
          gst: 0,
          gstPercent: 0),
      productList: []);

  BillingBloc() : super(BillingInitial()) {
    on<LoadAllOrders>(_loadAllOrders);
    on<BillingInitialEvent>(_billingInitialEvent);
    on<FetchProductsByCategory>(_fetchProductsByCategory);
    on<SelectCategory>(_selectCategory);
    on<SelectProduct>(_selectProduct);
    on<RemoveProduct>(_removeProduct);
    on<RemoveAllProduct>(_removeAllProduct);
    on<CalculateBill>(_calculateBill);
    on<ExpandBilling>(_expandBilling);
    on<AddOrderToPayLater>(_addOrderToPayLater);
    on<SettleOrder>(_settleOrder);
    on<AddDiscount>(_addDiscount);
    on<RemovePendingOrder>(_removePendingOrder);
  }

  FutureOr<void> _loadAllOrders(
      LoadAllOrders event, Emitter<BillingStates> emit) async {
    customer = Customer(
        customerName: '',
        customerContact: '',
        billDetails: BillModel(
            itemTotal: 0,
            total: 0,
            discount: 0,
            discountPercent: 0,
            gst: 0,
            gstPercent: 0),
        productList: []);
    Map<String, Customer> customerData = {};

    List<String> customerIdList = [];

    customerIdList = DatabaseUtil.ordersBox.keys.toList().cast<String>();

    for (var id in customerIdList) {
      customerData[id] = DatabaseUtil.ordersBox.get(id);
    }

    if (DatabaseUtil.ordersBox.isEmpty) {
      add(BillingInitialEvent(
          orderIndex: DateTime.now().millisecondsSinceEpoch.toString()));
    } else {
      emit(LoadDataBaseOrders(
          customerIdList: customerIdList, customerData: customerData));
    }
  }

  FutureOr<void> _billingInitialEvent(
      BillingInitialEvent event, Emitter<BillingStates> emit) async {
    if (DatabaseUtil.ordersBox.isNotEmpty && event.orderIndex != '-1') {
      orderId = event.orderIndex;
      customer.productList = DatabaseUtil.ordersBox
          .get(event.orderIndex)
          .productList
          .cast<SelectedProductModel>();
      customer.billDetails =
          DatabaseUtil.ordersBox.get(event.orderIndex).billDetails;
      customer.customerContact =
          DatabaseUtil.ordersBox.get(event.orderIndex).customerContact;
      customer.customerName =
          DatabaseUtil.ordersBox.get(event.orderIndex).customerName;
    } else {
      orderId = DateTime.now().millisecondsSinceEpoch.toString();
      selectedCategoryIndex = 0;
      customer.productList = [];
      customer.billDetails = BillModel(
          itemTotal: 0,
          total: 0,
          discount: 0,
          discountPercent: 0,
          gst: 0,
          gstPercent: 0);
    }

    add(FetchProductsByCategory());
  }

  FutureOr<void> _fetchProductsByCategory(
      FetchProductsByCategory event, Emitter<BillingStates> emit) async {
    emit(FetchingProductsByCategory());
    try {
      List<CategoryWithProductsDatum> data = [];
      FetchProductsByCategoryModel fetchProductsByCategoryModel;
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();
      if (DatabaseUtil.products.isEmpty) {
        fetchProductsByCategoryModel = await _billingRepository
            .fetchProductsByCategory(userId, companyId, branchId);
        if (fetchProductsByCategoryModel.status == 200) {
          data = fetchProductsByCategoryModel.data;
          DatabaseUtil.products
              .put('products', fetchProductsByCategoryModel.data);
        } else {
          emit(ErrorFetchingProductsByCategory(
              message: fetchProductsByCategoryModel.message));
        }
      } else {
        data = DatabaseUtil.products
            .get('products')
            .cast<CategoryWithProductsDatum>();
      }

      emit(ProductsLoaded(
          productsByCategories: data,
          selectedCategoryIndex: selectedCategoryIndex,
          selectedProducts: customer.productList,
          billDetails: customer.billDetails));
    } catch (e) {
      emit(ErrorFetchingProductsByCategory(message: e.toString()));
    }
  }

  FutureOr<void> _selectCategory(
      SelectCategory event, Emitter<BillingStates> emit) async {
    emit(ProductsLoaded(
        selectedCategoryIndex: selectedCategoryIndex,
        productsByCategories: event.productsByCategories,
        selectedProducts: customer.productList,
        billDetails: customer.billDetails));
  }

  FutureOr<void> _selectProduct(
      SelectProduct event, Emitter<BillingStates> emit) async {
    if (customer.productList.isNotEmpty) {
      if (customer.productList
          .map((e) => e.product.variants[0].variantId)
          .contains(event.product.variants[event.variantIndex].variantId)) {
        customer.productList
            .firstWhere((element) =>
                element.product.variants[0].variantId ==
                event.product.variants[event.variantIndex].variantId)
            .count++;
      } else {
        customer.productList.add(SelectedProductModel(
            count: 1,
            product: Product(
                productId: event.product.productId,
                productName: event.product.productName,
                variants: [event.product.variants[event.variantIndex]],
                brandName: event.product.brandName,
                productDescription: event.product.productDescription,
                brandId: event.product.brandId)));
      }
    } else {
      customer.productList.add(SelectedProductModel(
          count: 1,
          product: Product(
              productId: event.product.productId,
              productName: event.product.productName,
              variants: [event.product.variants[event.variantIndex]],
              brandName: event.product.brandName,
              productDescription: event.product.productDescription,
              brandId: event.product.brandId)));
    }
    add(CalculateBill(
        selectedProducts: customer.productList,
        productsByCategories: event.productsByCategories));
  }

  FutureOr<void> _removeProduct(
      RemoveProduct event, Emitter<BillingStates> emit) async {
    if (customer.productList
            .firstWhere((element) =>
                element.product.variants[0].variantId ==
                event.product.variants[0].variantId)
            .count >
        1) {
      customer.productList
          .firstWhere(
              (element) => element.product.productId == event.product.productId)
          .count--;
    } else if (customer.productList
            .firstWhere((element) =>
                element.product.productId == event.product.productId)
            .count ==
        1) {
      customer.productList.remove(customer.productList.firstWhere(
          (element) => element.product.productId == event.product.productId));
    }

    add(CalculateBill(
        selectedProducts: customer.productList,
        productsByCategories: event.productsByCategories));
  }

  FutureOr<void> _calculateBill(
      CalculateBill event, Emitter<BillingStates> emit) async {
    customer.billDetails.itemTotal = 0;
    customer.billDetails.discount = 0;
    customer.billDetails.total = 0;

    for (var i = 0; i < customer.productList.length; i++) {
      customer.billDetails.itemTotal +=
          customer.productList[i].product.variants[0].cost *
              customer.productList[i].count;
    }

    customer.billDetails.discount = customer.billDetails.itemTotal *
        (customer.billDetails.discountPercent / 100);

    customer.billDetails.gst = customer.billDetails.itemTotal *
        (customer.billDetails.gstPercent / 100);

    customer.billDetails.total = (customer.billDetails.itemTotal -
        customer.billDetails.discount +
        customer.billDetails.gst);

    DatabaseUtil.ordersBox.put(orderId, customer);

    emit(ProductsLoaded(
        selectedCategoryIndex: selectedCategoryIndex,
        productsByCategories: event.productsByCategories,
        selectedProducts: customer.productList,
        billDetails: customer.billDetails));
  }

  FutureOr<void> _expandBilling(
      ExpandBilling event, Emitter<BillingStates> emit) async {
    billExpanded = !billExpanded;

    emit(ProductsLoaded(
        selectedCategoryIndex: selectedCategoryIndex,
        productsByCategories: event.productsByCategories,
        selectedProducts: customer.productList,
        billDetails: customer.billDetails));
  }

  FutureOr<void> _addOrderToPayLater(
      AddOrderToPayLater event, Emitter<BillingStates> emit) async {
    DatabaseUtil.ordersBox.put(orderId, customer);
    customer = Customer(
        customerName: '',
        customerContact: '',
        billDetails: BillModel(
            itemTotal: 0,
            total: 0,
            discount: 0,
            discountPercent: 0,
            gst: 0,
            gstPercent: 0),
        productList: []);
    add(LoadAllOrders());
  }

  FutureOr<void> _settleOrder(
      SettleOrder event, Emitter<BillingStates> emit) async {
    emit(SettlingOrder());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      List<Map<String, int>> productList = [];

      for (SelectedProductModel selectProduct in customer.productList) {
        productList.add({
          "variant_id": selectProduct.product.variants[0].variantId,
          "count": selectProduct.count
        });
      }

      Map<String, dynamic> orderMap = {
        "items_ordered": productList,
        "customer_contact": int.parse(customer.customerContact),
        "payment_status": "paid",
        "payment_type": event.paymentMethod,
        "customer_name": customer.customerName,
        "discount_total": customer.billDetails.discount,
        "total_amount": customer.billDetails.total.round(),
        "subtotal": customer.billDetails.itemTotal
      };

      SettleOrderModel settleOrderModel = await _billingRepository.settleOrder(
          userId, companyId, branchId, orderMap);

      if (settleOrderModel.status == 200) {
        DatabaseUtil.ordersBox.delete(orderId);
        emit(OrderSettled(message: settleOrderModel.message));
      } else {
        emit(ErrorSettlingOrder(message: settleOrderModel.message));
      }
    } catch (e) {
      emit(ErrorSettlingOrder(message: e.toString()));
    }
  }

  FutureOr<void> _removePendingOrder(
      RemovePendingOrder event, Emitter<BillingStates> emit) async {
    DatabaseUtil.ordersBox.delete(event.orderID);
    add(LoadAllOrders());
  }

  FutureOr<void> _removeAllProduct(
      RemoveAllProduct event, Emitter<BillingStates> emit) async {
    customer.productList.clear();
    add(CalculateBill(
        selectedProducts: customer.productList,
        productsByCategories: event.productsByCategories));
  }

  _addDiscount(AddDiscount event, Emitter<BillingStates> emit) {
    add(CalculateBill(
        selectedProducts: customer.productList,
        productsByCategories: event.productsByCategories));
  }
}
