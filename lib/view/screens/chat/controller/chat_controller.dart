import 'dart:convert';

import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/chat/chat_screen.dart';
import 'package:event_app/view/screens/chat/model/notification_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxInt currentIndex = 0.obs;

  Rx<ChatType> chatType = ChatType.chat.obs;

  //=================================== Notification ===============================

  Rx<Status> notificationStatus = Status.loading.obs;

  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  Future<void> getAllNotification() async {
    var response = await ApiClient.getData(ApiUrl.getAllNotification);

    if (response.statusCode == 200 || response.statusCode == 201) {
      notificationList.value = List<NotificationModel>.from(
        response.body['data']['result'].map(
          (x) => NotificationModel.fromMap(x),
        ),
      );
      notificationStatus(Status.completed);
    } else {
      notificationStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //====================== Accept Connection Request ================================
  RxBool isAccepted = false.obs;
  RxInt loadingIndex = 0.obs;

  Future<void> acceptConnectionRequest({
    required String userID,
    required int index,
  }) async {
    loadingIndex(index);
    isAccepted(true);

    var body = {};

    var response = await ApiClient.postData(
      ApiUrl.acceptConnection(userID),
      jsonEncode(body),
    );

    isAccepted(false);
    loadingIndex(0);

    if (response.statusCode == 200 || response.statusCode == 201) {
      getAllNotification();
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
