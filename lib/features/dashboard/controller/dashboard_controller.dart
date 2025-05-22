import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/customers/model/CustomerModel.dart';
import 'package:tn_jewellery_admin/features/dashboard/model/DashboardModel.dart';
import 'package:tn_jewellery_admin/features/dashboard/repository/dashboard_repo.dart';
import 'package:tn_jewellery_admin/utils/Loader/loader_utils.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_snackbar.dart';

class DashboardController extends GetxController implements GetxService {
  final DashboardRepo dashboardRepo;

  DashboardController({required this.dashboardRepo});

  bool _isLoading = false;
  bool hasMoreItems = true;
  bool get isLoading => _isLoading;

  DashboardModel? dashboardModel;

  CustomerModel? customerModel;
  final Map<int, bool> selectedCustomers = {};

  Future<void> getDashboardData() async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    Response? response = await dashboardRepo.getDashboardRepo();
    if (response != null && response.statusCode == 200) {
      dashboardModel = DashboardModel.fromJson(response.body);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> getCustomerList(String type) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    Response? response = await dashboardRepo.getCustomerRepo(type);
    if (response != null && response.statusCode == 200) {
      customerModel = CustomerModel.fromJson(response.body);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> postCustomerStatus(Map<String, dynamic> body) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    Response? response = await dashboardRepo.postCustomerStatusRepo(body);
    if (response != null && response.statusCode == 200) {
      selectedCustomers.clear();
      customSnackBar(response.body['message'], isError: false);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }






}
