import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/profile/settings/model/terms_condition_model.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  //================================ Get Terms And Condition ================================

  Rx<TermsConditionModel> termsCondition = TermsConditionModel().obs;
  Rx<Status> termsConditionStatus = Status.loading.obs;
  void termsAndCondition() async {
    var response = await ApiClient.getData(ApiUrl.getTermsAndCondition);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body['data'] != null) {
        termsCondition.value = TermsConditionModel.fromMap(
          response.body['data'],
        );
      }

      termsConditionStatus(Status.completed);
    } else {
      termsConditionStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //===================================== Get Privacy Policy ================================

  Rx<TermsConditionModel> privacyPolicy = TermsConditionModel().obs;
  Rx<Status> privacyPolicyStatus = Status.loading.obs;
  void privacyPolicyApi() async {
    var response = await ApiClient.getData(ApiUrl.getPrivacyPolicy);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body['data'] != null) {
        privacyPolicy.value = TermsConditionModel.fromMap(
          response.body['data'],
        );
      }

      privacyPolicyStatus(Status.completed);
    } else {
      privacyPolicyStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }
}
