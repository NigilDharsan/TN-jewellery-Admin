import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tn_jewellery_admin/utils/app_constants.dart';
import 'package:tn_jewellery_admin/utils/data/provider/client_api.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> getUserProfile() async {
    try {
      return await apiClient.getData("https://yourapi.com/get-profile");
    } catch (e) {
      print("Error fetching user profile: $e");
      return null;
    }
  }

  Future<Response?> validateUser(String email) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*'
    };

    return await apiClient.getData("${AppConstants.configUrl}$email",
        headers: headers);
  }

  Future<Response?> login(
      {required String mobileNumber, required String password}) async {
    var body = {
      "username": mobileNumber,
      "password": password,
      "id_company": "1"
    };

    return await apiClient.postLoginData(
      AppConstants.getEmpLoginUrl,
      body,
    );
  }

  Future<Response?> getProfile() async {
    return await apiClient.getData(AppConstants.getProfile);
  }

  Future<void> saveUserNumberAndEmail(String number, String email) async {
    try {
      await sharedPreferences.setString(AppConstants.userEmail, email);
      await sharedPreferences.setString(AppConstants.userNumber, number);
    } catch (e) {
      rethrow;
    }
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.userNumber) ?? "";
  }

  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.userEmail) ?? "";
  }

  bool isNotificationActive() {
    return sharedPreferences.getBool(AppConstants.notification) ?? true;
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.userPassword);
    await sharedPreferences.remove(AppConstants.userCountryCode);
    return await sharedPreferences.remove(AppConstants.userNumber);
  }

  Future<bool?> saveRefreshToken(String token) async {
    print(token);
    return await sharedPreferences.setString(AppConstants.refreshToken, token);
  }

  String getRefreshToken() {
    return sharedPreferences.getString(AppConstants.refreshToken) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  bool isSupplier() {
    return sharedPreferences.containsKey(AppConstants.isSupplier);
  }

  ///user address and language code should not be deleted
  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.token);
    sharedPreferences.clear();
    return true;
  }
}

class SingleTon {
  static final SingleTon qwerty = SingleTon._internal();

  factory SingleTon() {
    return qwerty;
  }

  SingleTon._internal();

  String ImageData = "";
  String LoginType = "";
  bool isPhoneVerified = false;
  bool isEmailVerified = false;
  bool isEstablishPhoneVerified = false;
  bool isEstablishEmailVerified = false;
  bool isRecurring = false;
}
