// ignore_for_file: unnecessary_type_check

//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

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

import 'dart:io' show InternetAddress, Platform;
import 'package:app_settings/app_settings.dart';
import 'package:network_info_plus/network_info_plus.dart';

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
    checkConnection();
  }

  checkConnection() async {
    if (await isWifiConnected()) {
      wifiSettingsController.checkOurWifi(
        onSuccess: () {
          Get.toNamed(AppRoutes.calenderLoginOnboarding);
        },
      );
    }
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
                //  wifiSettingsController.openWifiSettings();

                SettingsHelper.openWifiSettings(
                  onSettingsPanelClosed: () async {
                    if (await isWifiConnected()) {
                      wifiSettingsController.checkOurWifi(
                        onSuccess: () {
                          Get.toNamed(AppRoutes.calenderLoginOnboarding);
                        },
                      );
                      debugPrint(
                        "+=++++++++++============== >> Wifi connected",
                      );
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          message: "Wifi not connected",
                          duration: Duration(seconds: 3),
                        ),
                      );
                      debugPrint(
                        "+=++++++++++============== >> Wifi not connected",
                      );
                    }
                  },
                );

                // Get.toNamed(AppRoutes.calenderLoginOnboarding);
              },
              title: "Go to my WIFI configuration",
            ),
            // SizedBox(height: 20.h),
            // CustomButton(
            //   borderWidth: 2,
            //   isBorder: true,
            //   fillColor: AppColors.white,
            //   textColor: AppColors.primary,
            //   width: 150.w,
            //   height: 44.h,
            //   onTap: () async {
            // if (await isWifiConnected()) {
            //   Get.toNamed(AppRoutes.calenderLoginOnboarding);
            // } else {
            //   Get.snackbar(
            //     "No Wi-Fi",
            //     "Please connect to a Wi-Fi network first.",
            //     snackPosition: SnackPosition.BOTTOM,
            //   );
            // }

            //  Get.toNamed(AppRoutes.calenderLoginOnboarding);

            // SettingsHelper.openWifiSettings(
            //   onSettingsPanelClosed: () async {
            //     if (await isWifiConnected()) {
            //       debugPrint(
            //         "+=++++++++++============== >> Wifi connected",
            //       );
            //     } else {
            //       debugPrint(
            //         "+=++++++++++============== >> Wifi not connected",
            //       );
            //     }
            //   },
            // );
            // final connectivity = Connectivity();
            // var result = await connectivity.checkConnectivity();

            // if (result.contains(ConnectivityResult.wifi)) {
            //   // Wi-Fi is connected → navigate
            //   Get.toNamed(AppRoutes.calenderLoginOnboarding);
            // } else {
            //   // Wi-Fi not connected → show a message
            //   Get.snackbar(
            //     "No Wi-Fi",
            //     "Please connect to a Wi-Fi network first.",
            //     snackPosition: SnackPosition.BOTTOM,
            //   );
            // }

            // final connectivity = Connectivity();
            // var result = await connectivity.checkConnectivity();

            // if (result is List<ConnectivityResult>) {
            //   // Desktop/Web
            //   if (result.contains(ConnectivityResult.wifi)) {
            //     Get.toNamed(AppRoutes.calenderLoginOnboarding);
            //   } else {
            //     Get.snackbar(
            //       "No Wi-Fi",
            //       "Please connect to a Wi-Fi network first.",
            //     );
            //   }
            // } else if (result is ConnectivityResult) {
            //   // Mobile
            //   if (result == ConnectivityResult.wifi) {
            //     Get.toNamed(AppRoutes.calenderLoginOnboarding);
            //   } else {
            //     Get.snackbar(
            //       "No Wi-Fi",
            //       "Please connect to a Wi-Fi network first.",
            //     );
            //   }
            // }
            //   },
            //   title: "Next",
            // ),
          ],
        ),
      ),
    );
  }

  // Future<bool> isWifiConnected() async {
  //   final connectivity = Connectivity();
  //   final result = await connectivity.checkConnectivity();

  //   if (result.contains(ConnectivityResult.wifi)) {
  //     try {
  //       // Try a real internet lookup
  //       final lookup = await InternetAddress.lookup('google.com');
  //       if (lookup.isNotEmpty && lookup.first.rawAddress.isNotEmpty) {
  //         return true; // Wi-Fi + Internet available
  //       }
  //     } catch (_) {
  //       return false; // Wi-Fi but no internet
  //     }
  //   }

  //   return false; // Not Wi-Fi
  // }.

  Future<bool> isWifiConnected() async {
    if (Platform.isAndroid) {
      return await _isWifiConnectedAndroid();
    } else if (Platform.isIOS) {
      return await _isWifiConnectedIOS();
    }
    return false; // অন্য প্ল্যাটফর্মের জন্য (Web, Windows, etc.)
  }

  ///  Android WiFi + Internet Check
  Future<bool> _isWifiConnectedAndroid() async {
    final connectivity = Connectivity();
    final result = await connectivity.checkConnectivity();

    if (result.contains(ConnectivityResult.wifi)) {
      return await _hasInternet();
    }
    return false;
  }

  ///  iOS WiFi (SSID) + Internet Check
  Future<bool> _isWifiConnectedIOS() async {
    final info = NetworkInfo();

    // WiFi SSID চেক
    final wifiName = await info.getWifiName();
    if (wifiName == null) {
      return false; // WiFi-তে যুক্ত নেই
    }

    // Internet Reachability চেক
    return await _hasInternet();
  }

  ///  Common Internet Test
  Future<bool> _hasInternet() async {
    try {
      final lookup = await InternetAddress.lookup('google.com');
      return lookup.isNotEmpty && lookup.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}

// Make sure you have the app_settings package installed

// Make sure to import this package

class SettingsHelper with WidgetsBindingObserver {
  static void openWifiSettings({VoidCallback? onSettingsPanelClosed}) {
    if (Platform.isAndroid) {
      // Android → open WiFi settings
      AppSettings.openAppSettingsPanel(AppSettingsPanelType.wifi).then((_) {
        // Monitor app lifecycle to detect when it comes back to the foreground
        _startAppLifecycleListener(onSettingsPanelClosed);
      });
    } else if (Platform.isIOS) {
      // iOS → can't go directly to WiFi, so open App Settings
      AppSettings.openAppSettings().then((_) {
        // Monitor app lifecycle to detect when it comes back to the foreground
        _startAppLifecycleListener(onSettingsPanelClosed);
      });
    } else {
      // Other platforms
      debugPrint("WiFi settings not available on this platform");
      if (onSettingsPanelClosed != null) {
        onSettingsPanelClosed();
      }
    }
  }

  static void _startAppLifecycleListener(VoidCallback? onSettingsPanelClosed) {
    // Register as observer to listen for app lifecycle changes
    WidgetsBinding.instance.addObserver(SettingsHelper());
    // Save the callback to be triggered when app comes back to foreground
    if (onSettingsPanelClosed != null) {
      _onSettingsPanelClosed = onSettingsPanelClosed;
    }
  }

  static VoidCallback? _onSettingsPanelClosed;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Trigger callback when app comes back to the foreground
    if (state == AppLifecycleState.resumed) {
      // If the settings panel was opened and the app is resumed, call the callback
      if (_onSettingsPanelClosed != null) {
        _onSettingsPanelClosed!();
        // Unregister from the lifecycle observer once done
        WidgetsBinding.instance.removeObserver(this);
      }
    }
  }
}
