import 'package:event_app/view/screens/auth/controller/auth_controller.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:event_app/view/screens/connections/controller/connection_controller.dart';
import 'package:event_app/view/screens/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../view/screens/onbording/controller/onboarding_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================Default Custom Controller ==================
    Get.lazyPut(() => ChatController(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true);

    Get.lazyPut(() => OnboardingController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => ConnectionController(), fenix: true);
  }
}
