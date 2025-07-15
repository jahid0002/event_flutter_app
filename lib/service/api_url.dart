class ApiUrl {
  static const String baseUrl = "http://10.0.60.137:5020";
  // static const String baseUrl = "https://sta-map-point-2.onrender.com/api/v1";
  static const String imageUrl = "http://10.0.60.137:5020/";
  static String socketUrl = "http://10.0.60.137:5020";

  // server url : http://3.232.3.72:5000
  // local url : http://10.0.60.137:3000

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

  //================================ Profile ============================

  static const String getOwnProfile = '/user/get-my-profile';
  static const String updateProfile = '/normal-user/update-profile';

  //================================ Privacy and trms and condition =========================
}
