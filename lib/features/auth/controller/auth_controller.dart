import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tn_jewellery_admin/features/auth/repository/auth_repo.dart';
import 'package:tn_jewellery_admin/utils/Loader/loader_utils.dart';

import '../../../Utils/core/helper/route_helper.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  final formKey = GlobalKey<FormState>();

  bool obscurePassword = true;

  String? _verificationId;
  bool _isOtpSent = false;
  int? _resendToken; // Used for resending OTP
  bool _isLoading = false;
  bool? _acceptTerms = false;
  bool hasMoreItems = true;
  bool cameFromApp = false;

  // bool get isLoading => _isLoading;

  bool? get acceptTerms => _acceptTerms;

  RxBool isEditLocation = false.obs;

  var mobileNumber = ''.obs;
  var otp = ''.obs;
  var isLoading = false.obs;

  void toggleEditLocation(bool isEdit) {
    isEditLocation.value = isEdit;
  }

  ///TextEditingController for signUp screen
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var genderController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var address = TextEditingController();
  var preferLocation = TextEditingController();
  var countryDialCodeController = TextEditingController();
  var countryNameController = TextEditingController();
  var operationArea = TextEditingController();

  var establishNameController = TextEditingController();
  var establishCountryController = TextEditingController();
  var restaurantIdController = TextEditingController();
  var gstinNumberController = TextEditingController();
  var establishTypeController = TextEditingController();
  var establishDialCodeController = TextEditingController();
  var establishContactController = TextEditingController();
  var establishEmailController = TextEditingController();

  var supplierDocTypeController = TextEditingController();

  bool isEstablishment = false;

  dynamic countryDialCodeForSignup;

  ///textEditingController for signIn screen
  var signInEmailController = TextEditingController();
  var signInPasswordController = TextEditingController();
  dynamic countryDialCodeForSignIn;

  ///TextEditingController for forgot password
  var contactNumberController = TextEditingController();
  final String _mobileNumber = '';

  // String get mobileNumber => _mobileNumber;

  late String _emailAddress = '';

  String get emailAddress => _emailAddress;

  ///TextEditingController for new pass screen
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();

  ///TextEditingController for change pass screen
  final currentPasswordControllerForChangePasswordScreen =
      TextEditingController();
  final newPasswordControllerForChangePasswordScreen = TextEditingController();
  final confirmPasswordControllerForChangePasswordScreen =
      TextEditingController();

  ///TextEditingController for Mark location screen
  var addressName = TextEditingController();
  var buildingNumber = TextEditingController();
  var street = TextEditingController();
  var pinCode = TextEditingController();
  var city = TextEditingController();
  var country = TextEditingController();
  var landMark = TextEditingController();
  var latitudeTextController = TextEditingController();
  var longitudeTextController = TextEditingController();
  double? Maplattitude;
  double? MapLongittude;
  String? placeName;

  ///Driver Address details field
  var driverbuildingNo = TextEditingController();
  var driverStreet = TextEditingController();
  var driverCity = TextEditingController();
  var driverState = TextEditingController();
  var driverPincode = TextEditingController();
  var drivercountry = TextEditingController();
  var driverlandMark = TextEditingController();
  bool isNextItineray = true;

  ///Vechile Details
  var make = TextEditingController();
  var model = TextEditingController();
  var trim = TextEditingController();
  var registrationNumber = TextEditingController();
  var ownerName = TextEditingController();
  var ownerAddress = TextEditingController();
  var ownerPhone = TextEditingController();
  var storageCapacity = TextEditingController();
  var dimension = TextEditingController();

  ///ADD Account
  var accountNumber = TextEditingController();
  var accountHolderName = TextEditingController();
  var reaccountNumber = TextEditingController();
  var ifscCode = TextEditingController();
  var branch = TextEditingController();

  ///form validation key

  String? selectedEstablishmentName;
  String? selectedOptionalAreaName;
  String? selectedEstablishmentId;
  String? selectedOptionalAreaId;

  String? contryCodeVal;
  String? contryCodeValId;
  String? fundAccountId;
  String? bankName;

  int? selectedLocationIndex;

  final TextEditingController searchController = TextEditingController();
  List suggestions = [];
  double latitude = 0.0;
  double longitude = 0.0;
  String? sessionToken;
  bool isLocationSelected = false;
  int pickupBeforeDays = 0;
  String htmlPageContent = '';
  int notificationCount = 0;
  String selectedLanguage = 'English';

  var expandedIndex = (-1).obs;

  void toggleExpanded(int index) {
    expandedIndex.value = expandedIndex.value == index ? -1 : index;
  }

  bool isExpanded(int index) => expandedIndex.value == index;

  @override
  void onInit() {
    super.onInit();
    firstNameController.text = '';
    lastNameController.text = '';
    emailController.text = '';
    genderController.text = '';
    mobileNumberController.text = '';
    emailController.text = '';
    contactNumberController.text = '';
    newPasswordController.text = '';
    confirmNewPasswordController.text = '';
    contactNumberController.text = '';
    signInEmailController.text = '';
    signInPasswordController.text = '';

    newPasswordControllerForChangePasswordScreen.text = '';
    confirmPasswordControllerForChangePasswordScreen.text = '';

    // getUCOGetInfo();
    // getUserProfile(false);
    // getAddressList(1);
    update();
  }

  _hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  bool _isValidAccount() {
    return accountNumber.value.text == reaccountNumber.value.text;
  }

  bool _isValidPassword() {
    return mobileNumberController.value.text ==
        confirmPasswordController.value.text;
  }

  bool _isValidResetPassword() {
    return newPasswordControllerForChangePasswordScreen.value.text ==
        confirmPasswordControllerForChangePasswordScreen.value.text;
  }

  Future<bool> validateUser(String username) async {
    _hideKeyboard();
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    Response? response = await authRepo.validateUser(username);
    if (response != null && response.statusCode == 200) {
      _emailAddress = response.body['email'];
      _isLoading = false;
      loaderController.showLoaderAfterBuild(_isLoading);

      update();

      return true;
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    return false;
  }

  Future<void> login() async {
    _hideKeyboard();
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
    Response? response = await authRepo.login(
      mobileNumber:
          mobileNumberController.text, // Fixed: Correct way to get text
    );
    if (response != null && response.statusCode == 200) {
      mobileNumberController.clear();
      // Get.toNamed(RouteHelper.getDashBoardRoute());
      Get.toNamed(RouteHelper.getOtpVerifyRoute());
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  String _verificationCode = '';
  String _otp = '';

  // String get otp => _otp;

  String get verificationCode => _verificationCode;

  void updateVerificationCode(String query) {
    _verificationCode = query;
    if (_verificationCode.isNotEmpty) {
      _otp = _verificationCode;
    }
    update();
  }

  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;
  int selectedLangIndex = 0;

  void toggleTerms() {
    _acceptTerms = !_acceptTerms!;
    update();
  }

  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool isSupplier() {
    return authRepo.isSupplier();
  }

  Future<bool> clearSharedData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    return authRepo.clearSharedData();
  }

  void saveUserNumberAndEmail(String number, String email) {
    authRepo.saveUserNumberAndEmail(number, email);
  }

  String getUserNumber() {
    return authRepo.getUserNumber();
  }

  String getUserEmail() {
    return authRepo.getUserEmail();
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }

  String getRefreshToken() {
    return authRepo.getRefreshToken();
  }

  bool isValidPassword(String password) {
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  Timer? _refreshTokenTimer;

  void startRefreshTokenTimer() {
    // Cancel any existing timer before starting a new one
    _refreshTokenTimer?.cancel();

    // Start a new timer that triggers every 5 minutes
    _refreshTokenTimer = Timer.periodic(Duration(minutes: 10), (timer) {});
  }

  void stopRefreshTokenTimer() {
    _refreshTokenTimer?.cancel();
  }

  String? _refreshToken;
  bool _isRefreshing = false;
}
