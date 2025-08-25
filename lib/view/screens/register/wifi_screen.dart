import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/register/controller/onboarding_controller.dart';
import 'package:event_app/view/screens/register/controller/wifi_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dart:io' show Platform;
import 'package:app_settings/app_settings.dart';

class WifiScreen extends StatefulWidget {
  const WifiScreen({super.key});

  @override
  State<WifiScreen> createState() => _WifiScreenState();
}

class _WifiScreenState extends State<WifiScreen> {
  final OnboardingController controller = Get.find<OnboardingController>();
  final WifiSettingsController wifiSettingsController =
      Get.find<WifiSettingsController>();

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();

    controller.initField();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          top: 80,
          bottom: 30,
        ),
        child: Column(
          children: [
            Center(child: CustomImage(imageSrc: AppIcons.mapIcon)),
            CustomText(
              top: 20.h,
              text: "You're not connected to\nthe hotel WiFi",
              fontSize: 24.w,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              top: 20.h,
              text: "To use the app, connect to the hotel WiFi.",
              fontSize: 16.w,
              fontWeight: FontWeight.w400,
              color: Color(0xffC6C5C7),
              bottom: 20,
            ),
            CustomImage(imageSrc: AppIcons.umberalla),
            CustomText(
              top: 20.h,
              text:
                  "To continue your registration, please connect to the hotel’s Wi-Fi. ",
              fontSize: 16.w,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              maxLines: 2,
              bottom: 20,
            ),
            CustomText(
              text:
                  "This experience is only available for guests staying at the hotel.",
              fontSize: 16.w,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              maxLines: 2,
            ),
            Spacer(),
            CustomButton(
              onTap: () async {
                wifiSettingsController.openWifiSettings();

                // Get.toNamed(AppRoutes.calenderLoginOnboarding);
              },
              title: "Go to my WIFI configuration",
            ),
            SizedBox(height: 20.h),
            CustomButton(
              borderWidth: 2,
              isBorder: true,
              fillColor: AppColors.white,
              textColor: AppColors.primary,
              width: 150.w,
              height: 44.h,
              onTap: () async {
                final connectivity = Connectivity();
                var result = await connectivity.checkConnectivity();

                if (result.contains(ConnectivityResult.wifi)) {
                  // Wi-Fi is connected → navigate
                  Get.toNamed(AppRoutes.calenderLoginOnboarding);
                } else {
                  // Wi-Fi not connected → show a message
                  Get.snackbar(
                    "No Wi-Fi",
                    "Please connect to a Wi-Fi network first.",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              title: "Next",
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsHelper {
  static void openWifiSettings() {
    if (Platform.isAndroid) {
      // Android → directly open WiFi settings
      AppSettings.openAppSettingsPanel(AppSettingsPanelType.wifi); //();
    } else if (Platform.isIOS) {
      // iOS → can’t go to WiFi directly, open App Settings instead
      AppSettings.openAppSettings();
    } else {
      // Other platforms (Web, Desktop) → do nothing or show message
      debugPrint("WiFi settings not available on this platform");
    }
  }
}
