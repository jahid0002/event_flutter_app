import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/service/socket_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  RxInt notificationCount = 0.obs;

  getPendingNotificationCount() {
    debugPrint(
      "===================getPendingNotificationCount Callllll ==================",
    );

    SocketApi.onEvent('notificationCount', (value) {
      debugPrint("Notification Count Value: $value");
      if (value != null) {
        //  Map map = value as Map<String, dynamic>;
        notificationCount.value = value as int;
        debugPrint("Updated Notification Count: ${notificationCount.value}");
      }
    });
  }

  getPendingNotificationCountInApi() async {
    var response = await ApiClient.getData(ApiUrl.getPendingNotificationCount);

    if (response.statusCode == 200 || response.statusCode == 201) {
      notificationCount.value = response.body['data'] as int;
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
