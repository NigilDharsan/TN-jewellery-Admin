class AppConstants {
  static const String appName = 'TN Jewellery Admin';

  static const String configUrl = 'configs';
  static const String onBoards = 'on-boards';
  static const String socialLoginUrl = 'social-login';

  static const String getEmpLoginUrl = 'employee/emp_login/';
  static const String employeeTokenRefresh =
      'customersettings/employee_token_refresh/';

  static const String getDashboardUrl = 'dashboard/admin_app_dashboard/';
  static const String getCustomerUrl = 'customersettings/customer_approval/';

  static const String getNewOrderListUrl = 'orders/open_orders/list/';
  static const String getOrderStatusListByIdUrl =
      'orders/in_progress_orders/?status=';
  static const String getOrderAssignUrl = 'orders/job_order/create/';
  static const String getOrderUpdatenUrl = 'orders/order/job_orders/update/';

  static const String getSupplierUrl = 'retailmaster/supplier/?active';

  static const String getTagSearchUrl = 'inventory/tag/admin_app/search/';
  static const String getTagAddUrl = 'inventory/tag/tag_set/list/';
  static const String getTagWithoutImageUrl = 'inventory/tag/without_images/';
  static const String getRemoveTagUrl = 'inventory/tag/remove_tag_set/';

  static const String getTagImageUpdateUrl =
      'inventory/tag/admin_app/image_update/';

  static const String isSupplier = 'is_supplier';
  static const String notificationChannel = 'channel_type';
  static const String theme = 'lms_theme';
  static const String token = 'lms_token';
  static const String refreshToken = 'refresh_token';
  static const String countryCode = 'lms_country_code';
  static const String languageCode = 'lms_language_code';
  static const String languagename = 'lms_language_name';
  static const String userPassword = 'lms_user_password';
  static const String userNumber = 'lms_user_number';
  static const String userEmail = 'lms_user_email';
  static const String userCountryCode = 'lms_user_country_code';
  static const String notification = 'lms_notification';
  static const String isOnBoardScreen = 'lms_on_board_seen';
  static const String isTapNotification = 'tap_on_notification';
  static const String topic = 'customer';
  static const String localizationKey = 'X-localization';
  static const String subscriptionUrl = '/api/v1/customer/config/pages';
}
