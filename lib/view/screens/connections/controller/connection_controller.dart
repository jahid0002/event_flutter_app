import 'dart:convert';

import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/connections/model/connection_details_model.dart';
import 'package:event_app/view/screens/connections/model/connection_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  Rx<Status> connectionsStatus = Status.loading.obs;

  RxList<ConnectionModel> connections = <ConnectionModel>[].obs;

  getMyConnection() async {
    var response = await ApiClient.getData(ApiUrl.getMyConnection);
    if (response.statusCode == 200 || response.statusCode == 201) {
      connections.value = List<ConnectionModel>.from(
        response.body['data']['result'].map((x) => ConnectionModel.fromMap(x)),
      );
      connectionsStatus(Status.completed);
    } else {
      connectionsStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //====================================== Get user details ================================

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

  //============================== Cencel  connection ================================.

  Future<void> removeConnection({required String userId}) async {
    var body = {};
    var response = await ApiClient.postData(
      ApiUrl.addOrRemoveConnection(userId),
      jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      getMyConnection();
    } else {
      ApiChecker.checkApi(response);
    }
  }
  //=============================== Block Connection ============================.

  Future<void> blockUser({required String userID}) async {
    var body = {};
    var response = await ApiClient.postData(
      ApiUrl.blockUser(userID: userID),
      jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      getMyConnection();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  //=============================== Report connection ================================

  Rx<TextEditingController> reportIncedentController =
      TextEditingController().obs;
  Rx<TextEditingController> additionalInfoController =
      TextEditingController().obs;

  RxBool isReportLoading = false.obs;

  Future<void> reportConnection({required String otherUserID}) async {
    isReportLoading(true);
    var body = {
      "reportTo": otherUserID,
      "incidentType": reportIncedentController.value.text.trim(),
      "additionalNote": additionalInfoController.value.text.trim(),
    };
    var response = await ApiClient.postData(
      ApiUrl.reportConnection,
      jsonEncode(body),
    );
    isReportLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      getMyConnection();
      reportIncedentController.value.clear();
      additionalInfoController.value.clear();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    // TO DO: implement onInit
    getMyConnection();
    super.onInit();
  }
}
