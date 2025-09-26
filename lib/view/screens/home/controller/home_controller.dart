// import 'dart:async';

import 'dart:convert';

import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/connections/model/connection_details_model.dart';
import 'package:event_app/view/screens/home/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> imageUrls = [
    AppConstants.profileImage2,
    AppConstants.profileImage,
    AppConstants.girlsPhoto,
    AppConstants.girlsPhoto2,
    AppConstants.girlsPhoto2,
  ];

  RxInt currentIndex = 0.obs;

  // startSlider() {
  //   Timer.periodic(const Duration(seconds: 3), (value) {
  //     currentIndex.value++;
  //     if (currentIndex.value == imageUrls.length) {
  //       currentIndex.value = 0;
  //     }
  //   });
  // }

  //====================== Get All User ==================

  RxList<UserModel> users = <UserModel>[].obs;

  Rx<Status> homeStatus = Status.loading.obs;

  getAllUser() async {
    var response = await ApiClient.getData(ApiUrl.getAllUser);

    if (response.statusCode == 200 || response.statusCode == 201) {
      users.value = List<UserModel>.from(
        response.body['data']['result'].map((x) => UserModel.fromMap(x)),
      );
      users.refresh();
      homeStatus(Status.completed);
    } else {
      homeStatus.value = Status.error;
      ApiChecker.checkApi(response);
    }
  }

  //==================================== User invite or reject =========================

  RxBool inviteStatus = false.obs;

  Future<void> addOrRemoveConnection({required String userId}) async {
    inviteStatus(false);
    var body = {};
    var response = await ApiClient.postData(
      ApiUrl.addOrRemoveConnection(userId),
      jsonEncode(body),
    );

    inviteStatus(false);

    if (response.statusCode == 200 || response.statusCode == 201) {
      getAllUser();
      users.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Rx<Status> userDetailsStatus = Status.loading.obs;
  Rx<ConnectionDetailsModel> connectionDetails = ConnectionDetailsModel().obs;

  getConnectionDetails({required String userId}) async {
    var response = await ApiClient.getData(ApiUrl.getUserDetails(userId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      connectionDetails.value = ConnectionDetailsModel.fromMap(
        response.body['data'],
      );
      userDetailsStatus(Status.completed);
    } else {
      userDetailsStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //============= >>
  // String getText(Connection? connection, String userId) {

  //   for(user)
  //   if (connection == null) {
  //     return 'Invite';
  //   }

  //   switch (connection.status) {
  //     case 'PENDING':
  //       return 'Pending';
  //     case 'ACCEPTED':
  //       return 'Accepted';
  //     case 'REJECTED':
  //       return 'Rejected';
  //     default:
  //       return 'Invite';
  //   }
  // }
}
