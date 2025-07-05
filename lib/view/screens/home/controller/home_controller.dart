// import 'dart:async';

import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/home/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> imageUrls = [
    AppConstants.profileImage2,
    AppConstants.profileImage,
    AppConstants.girlsPhoto,
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
      homeStatus(Status.completed);
    } else {
      homeStatus.value = Status.error;
      ApiChecker.checkApi(response);
    }
  }
}
