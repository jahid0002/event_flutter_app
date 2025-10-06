import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/settings/model/help_suport_model.dart';
import 'package:event_app/view/screens/settings/model/terms_condition_model.dart';
import 'package:flutter/material.dart';
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

  //=============================== Help And Support ===============================.

  final TextEditingController searchController = TextEditingController();

  Rx<Status> faqStatus = Status.loading.obs;
  RxList<HelpSuportModel> faqList = <HelpSuportModel>[].obs;
  RxList<HelpSuportModel> filteredFaqList = <HelpSuportModel>[].obs;

  void faqApi() async {
    faqStatus(Status.loading);
    var response = await ApiClient.getData(ApiUrl.getFaq);
    if (response.statusCode == 200 || response.statusCode == 201) {
      faqList.assignAll(
        List<HelpSuportModel>.from(
          response.body['data'].map((x) => HelpSuportModel.fromMap(x)),
        ),
      );

      // ✅ এখানে filtered list assign করো (copy হিসেবে)
      filteredFaqList.assignAll(faqList);
      faqStatus(Status.completed);
    } else {
      faqStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    // TO DO: implement onInit
    super.onInit();
    // Listen for search changes
    searchController.addListener(() {
      final query = searchController.text.trim().toLowerCase();
      if (query.isEmpty) {
        filteredFaqList.assignAll(faqList);
      } else {
        filteredFaqList.assignAll(
          faqList.where(
            (faq) =>
                (faq.question ?? '').toLowerCase().contains(query) ||
                (faq.answer ?? '').toLowerCase().contains(query),
          ),
        );
      }
    });
  }
}
