import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/profile/model/profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<Status> profileStatus = Status.loading.obs;

  Rx<ProfileModel> profileModel = ProfileModel().obs;

  Future<void> getOwnProfile() async {
    var response = await ApiClient.getData(ApiUrl.getOwnProfile);
    if (response.statusCode == 200 || response.statusCode == 201) {
      profileModel.value = ProfileModel.fromMap(response.body['data']);
      profileStatus(Status.completed);
    } else {
      profileStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    // TO DO: implement onInit
    super.onInit();
    getOwnProfile();
  }
}
