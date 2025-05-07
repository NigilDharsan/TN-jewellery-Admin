import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tn_jewellery_admin/utils/app_constants.dart';
import 'package:tn_jewellery_admin/utils/data/provider/client_api.dart';

class TagRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  TagRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> orderUpdateStatus(dynamic body) async {
    return await apiClient.postData(
      AppConstants.getOrderUpdatenUrl,
      body,
    );
  }

  Future<Response?> tagSearch(dynamic body) async {
    return await apiClient.postData(
      AppConstants.getTagSearchUrl,
      body,
    );
  }

  Future<Response?> tagImageUpload(dynamic body) async {
    return await apiClient.postData(
      AppConstants.getTagImageUpdateUrl,
      body,
    );
  }
}
