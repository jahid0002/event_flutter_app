class ApiUrl {
  static const String primaryUrl = "http://52.30.254.10:5000";

  static const String baseUrl = primaryUrl;
  // static const String baseUrl = "https://sta-map-point-2.onrender.com/api/v1";
  static const String imageUrl = "$primaryUrl/";
  static String socketUrl({required String userID}) => "$primaryUrl?id=$userID";

  // server url : http://3.232.3.72:5000
  // local url : http://10.10.20.9:5020
  //socket url : http://10.0.60.137:5020?id=68297d366ac733cf1835c86d
  // https://rnj64vmh-5020.inc1.devtunnels.ms

  //========================= Authentication =========================

  static const String login = '/auth/oauth-login';
  static const String register = '/user/register-user';

  ///==================================== Home  ==================================

  static const String getAllUser = '/normal-user/get-all-user';

  static String addOrRemoveConnection(String userId) =>
      '/connection/add-remove/$userId';

  //====

  //==================================== Notification ================================

  static const String getAllNotification = '/connection/get-requests';
  static String acceptConnection(String userId) =>
      '/connection/accept-reject/$userId?status=ACCEPTED';

  //========================================= Connection ===============================

  static const String getMyConnection = '/connection/my-connections';
  static String getUserDetails(String userId) =>
      '/normal-user/single-user/$userId';

  static String reportConnection = '/report/create-report';

  static String blockUser({required String userID}) =>
      '/block/block-unblock-user/$userID';

  //================================ Profile ============================

  static const String getOwnProfile = '/user/get-my-profile';
  static const String updateProfile = '/normal-user/update-profile';

  //================================ Privacy and trms and condition =========================

  static const String getPrivacyPolicy = '/manage/get-privacy-policy';
  static const String getTermsAndCondition = '/manage/get-terms-conditions';

  //============================ Chat ================================.

  static const String getConversation = '/conversation/get-chat-list';
  static String getConversationWithSearch({required String searchTerm}) =>
      '/conversation/get-chat-list?searchTerm=$searchTerm';
  static String getMessages({
    required String otherUserID,
    required String page,
  }) => '/message/get-messages/$otherUserID?page=$page&limit=15';

  //================================= Check WiFi ===============================

  static const String checkWifi = '/auth/check-wifi-ip-range';

  //=============================== Help And Support ===============================.

  static const String getFaq = '/manage/get-faq';

  //================================ Notification Settings ===============================.

  static const String getNotificationSettings = '/notificationSetting/get';
  static const String updateNotificationSettings =
      '/notificationSetting/update';

  //=============================== Delete Account ===============================.

  static const String deleteAccount = '/user/delete-account';

  //================================= Get Pending Notification Count ===============================

  static const String getPendingNotificationCount = '/notification/count';
}
