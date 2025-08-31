import 'dart:convert';

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/register/wifi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  checkOurWifi({required VoidCallback onSuccess}) async {
    await PopupLoader.showLoading(Get.context!);
    var body = {};

    var response = await ApiClient.postData(ApiUrl.checkWifi, jsonEncode(body));

    PopupLoader.hideLoading();

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body['data']['isWifiRangeMatched'] == true) {
        Get.snackbar("Success", 'You are sucssfully connected to our wifi');
        onSuccess();
      } else {
        Get.snackbar(
          "Error",
          'You are connected to wrong wifi network',
          borderColor: AppColors.red,
          colorText: AppColors.red,
        );
      }
    } else {
      ApiChecker.checkApi(response);
    }
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

class PopupLoader {
  // ignore: library_private_types_in_public_api
  static GlobalKey<_PopupLoaderState> loaderKey =
      GlobalKey<_PopupLoaderState>();

  // Function to show the loader
  static Future<void> showLoading(BuildContext context) async {
    // Show the loader dialog
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (context) {
        return PopupLoaderWidget(key: loaderKey);
      },
    );
  }

  // Function to hide the loader (can be called from outside)
  static void hideLoading() {
    loaderKey.currentState?.close();
  }
}

class PopupLoaderWidget extends StatefulWidget {
  const PopupLoaderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PopupLoaderState createState() => _PopupLoaderState();
}

class _PopupLoaderState extends State<PopupLoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomLoader(),
          CustomText(
            text: "Wi-Fi Checking...",
            fontSize: 16.w,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  // Close the popup loader
  void close() {
    Navigator.of(context).pop();
  }
}
