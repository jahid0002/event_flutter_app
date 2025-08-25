import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/view/screens/register/wifi_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WifiSettingsController extends GetxController
    with WidgetsBindingObserver {
  bool _hasOpenedSettings = false; // track if user tapped Wi-Fi button
  final Connectivity _connectivity = Connectivity();

  var wifiStatus = "Not connected".obs; // optional: show status in UI

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  /// User taps button to open Wi-Fi settings
  void openWifiSettings() {
    _hasOpenedSettings = true;
    wifiStatus.value = "Waiting for connection...";
    SettingsHelper.openWifiSettings();
  }

  /// Called when app resumes from background
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && _hasOpenedSettings) {
      _hasOpenedSettings = false; // reset flag

      // wait a short moment for Wi-Fi to connect
      await Future.delayed(const Duration(seconds: 1));

      // check actual Wi-Fi connection
      var result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.wifi) {
        _goNext();
      } else {
        wifiStatus.value = "Wi-Fi not connected, please select a network.";
      }
    }
  }

  void _goNext() {
    wifiStatus.value = "Connected ✅";
    // Use toNamed to allow going back to Wi-Fi screen if needed
    Get.toNamed(AppRoutes.calenderLoginOnboarding);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}

// import 'package:event_app/view/screens/register/wifi_screen.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:event_app/core/routes/app_routes.dart';

// class WifiSettingsController extends GetxController
//     with WidgetsBindingObserver {
//   bool _hasOpenedSettings = false; // track if user opened Wi-Fi settings

//   @override
//   void onInit() {
//     super.onInit();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   /// Called when app resumes from background
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed && _hasOpenedSettings) {
//       _goNext();
//     }
//   }

//   /// User taps button to open Wi-Fi settings
//   void openWifiSettings() {
//     _hasOpenedSettings = true; // mark that user opened settings
//     SettingsHelper.openWifiSettings(); // opens device Wi-Fi settings
//   }

//   void _goNext() {
//     _hasOpenedSettings = false; // reset flag
//     Get.toNamed(AppRoutes.calenderLoginOnboarding);
//   }

//   @override
//   void onClose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.onClose();
//   }
// }
