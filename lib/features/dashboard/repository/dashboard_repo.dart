import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tn_jewellery_admin/utils/app_constants.dart';
import 'package:tn_jewellery_admin/utils/data/provider/client_api.dart';

class DashboardRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  DashboardRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> getDashboardRepo() async {
    return await apiClient.getData(AppConstants.getDashboardUrl);
  }

  Future<Response?> getCustomerRepo() async {
    return await apiClient
        .getData(AppConstants.getCustomerUrl + "?type=1&&added_through=2");
  }

    Future<Response?> postCustomerStatusRepo(Map<String,dynamic> body) async {
    return await apiClient
        .postData(AppConstants.getCustomerUrl,body);
  }
  
}
