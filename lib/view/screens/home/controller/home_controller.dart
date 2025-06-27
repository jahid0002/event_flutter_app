// import 'dart:async';

import 'package:event_app/utils/app_const/app_const.dart';
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
}
