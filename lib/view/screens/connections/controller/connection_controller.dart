import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/connections/model/connection_model.dart';
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

  @override
  void onInit() {
    // TO DO: implement onInit
    getMyConnection();
    super.onInit();
  }
}
