import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tn_jewellery_admin/utils/app_constants.dart';
import 'package:tn_jewellery_admin/utils/data/provider/client_api.dart';

class OrderRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrderRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> orderList() async {
    return await apiClient.postData(
      AppConstants.getNewOrderListUrl,
      {},
    );
  }

  Future<Response?> getSupplierRepo() async {
    return await apiClient.getData(AppConstants.getSupplierUrl);
  }

  Future<Response?> orderStatusList(String orderStatus, dynamic body) async {
    return await apiClient.postData(
      AppConstants.getOrderStatusListByIdUrl + orderStatus,
      body,
    );
  }

  Future<Response?> orderCreate(dynamic body) async {
    return await apiClient.postData(
      AppConstants.getOrderAssignUrl,
      body,
    );
  }

  Future<Response?> orderUpdateStatus(dynamic body) async {
    return await apiClient.postData(
      AppConstants.getOrderUpdatenUrl,
      body,
    );
  }
}
