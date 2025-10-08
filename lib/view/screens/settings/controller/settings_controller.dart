import 'dart:convert';

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/shared_prefe/shared_prefe.dart';
import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/ToastMsg/toast_message.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/settings/model/help_suport_model.dart';
import 'package:event_app/view/screens/settings/model/notification_settings_model.dart';
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

      filteredFaqList.assignAll(faqList);
      faqStatus(Status.completed);
    } else {
      faqStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //=================================== Notification Settings ===============================.

  Rx<NotificationSettingsModel> notificationSettings =
      NotificationSettingsModel().obs;

  Rx<Status> notificationSettingsStatus = Status.loading.obs;

  void getNotificationSettings() async {
    // notificationSettingsStatus(Status.loading);
    var response = await ApiClient.getData(ApiUrl.getNotificationSettings);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body['data'] != null) {
        notificationSettings.value = NotificationSettingsModel.fromMap(
          response.body['data'],
        );
      }
      initNotification(notificationSettings.value);
      notificationSettingsStatus(Status.completed);
    } else {
      notificationSettingsStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  RxBool generalNotifications = false.obs;
  RxBool matchNotifications = false.obs;
  RxBool messageNotifications = false.obs;

  initNotification(NotificationSettingsModel response) {
    generalNotifications.value = response.generalNotification ?? false;
    matchNotifications.value = response.matchNotification ?? false;
    messageNotifications.value = response.messageNotification ?? false;
  }

  updateNotification() async {
    var body = {
      "generalNotification": generalNotifications.value,
      "matchNotification": matchNotifications.value,
      "messageNotification": messageNotifications.value,
    };
    var response = await ApiClient.patchData(
      ApiUrl.updateNotificationSettings,
      jsonEncode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(response.body['message'], isError: false);
      getNotificationSettings();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  //===================================== Delete Account ============================.

  void deleteAccountApi() async {
    var response = await ApiClient.deleteData(ApiUrl.deleteAccount);
    if (response.statusCode == 200 || response.statusCode == 201) {
      SharePrefsHelper.remove(AppConstants.bearerToken);
      SharePrefsHelper.remove(AppConstants.userId);
      showCustomSnackBar(response.body['message'], isError: false);
      Get.offAllNamed(AppRoutes.selectedScreen);
      // Perform any additional actions after account deletion, e.g., logout
    } else {
      ApiChecker.checkApi(response);
    }
  }

  //===========================>> On Init <<=============================

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
