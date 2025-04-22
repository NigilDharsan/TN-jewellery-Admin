import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/repository/order_repo.dart';
import 'package:tn_jewellery_admin/utils/Loader/loader_utils.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;

  bool _isLoading = false;
  bool hasMoreItems = true;
  bool get isLoading => _isLoading;

  bool isNewOrdersSelected = true;

  OrderController({required this.orderRepo});

  Future<void> getNewOrderList() async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
    Response? response = await orderRepo.orderList();
    if (response != null && response.statusCode == 200) {
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> getOrderStatusList(String orderStatus) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
    Response? response = await orderRepo.orderStatusList(orderStatus);
    if (response != null && response.statusCode == 200) {
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> orderAssign() async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    Map<String, dynamic> body = {
      "assigned_to": 1, //constant
      "employee": null, //constant
      "added_through": 2, //constant
      "supplier": 1,
      "order_detail_ids": [
        {"detail_id": "73", "karigar_due_date": "2025-04-30", "remarks": "Hai"}
      ]
    };

    Response? response = await orderRepo.orderCreate(body);
    if (response != null && response.statusCode == 200) {
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> OrderCancelStatus() async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    Map<String, dynamic> body = {
      "cancel_reason": "Any",
      "detail_id": "78",
      "id_job_order_detail": "54",
      "status": 6
    };

    Response? response = await orderRepo.orderUpdateStatus([body]);
    if (response != null && response.statusCode == 200) {
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> OrderCompleteStatus() async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    Map<String, dynamic> body = {
      "detail_id": "73",
      "added_through": 2,
      "id_job_order_detail": "19",
      "status": 4 // 4 = Complete, 5 = Delivered
    };

    Response? response = await orderRepo.orderUpdateStatus([body]);
    if (response != null && response.statusCode == 200) {
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }
}
