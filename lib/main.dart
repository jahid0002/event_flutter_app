// ignore_for_file: deprecated_member_use, unused_element

import 'package:event_app/core/dependency/dependency_injection.dart';
import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/firebase_options.dart';
import 'package:event_app/service/socket_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'utils/app_colors/app_colors.dart';
import 'view/components/device_utils/device_utils.dart';
// Localization generated files
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Lock Orientation
  DeviceUtils.lockDevicePortrait();

  /// Dependency Injection
  DependencyInjection di = DependencyInjection();
  di.dependencies();

  /// Socket API Init
  SocketApi.init();

  /// Firebase Init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// iOS Push Notification Permission
  requestIOSPermissions();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Default English

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Multi Language App",
          theme: CustomTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 200),
          navigatorKey: Get.key,
          initialRoute: AppRoutes.splashScreen,
          getPages: AppRoutes.routes,

          locale: _locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DeviceUtils.lockDevicePortrait();
//   DependencyInjection di = DependencyInjection();
//   di.dependencies();
//   SocketApi.init();
//   // ...

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   requestIOSPermissions();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       designSize: const Size(393, 852),
//       child: GetMaterialApp(
//         theme: CustomTheme.lightTheme,
//         debugShowCheckedModeBanner: false,
//         defaultTransition: Transition.fadeIn,
//         transitionDuration: const Duration(milliseconds: 200),
//         initialRoute: AppRoutes.splashScreen,
//         navigatorKey: Get.key,
//         getPages: AppRoutes.routes,
//       ),
//     );
//   }
// }

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor.withOpacity(.99),
      appBarTheme: AppBarTheme(
        toolbarHeight: 65,
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor.withOpacity(.99),
        iconTheme: const IconThemeData(
          color: Colors.black, // assuming you want dark icons
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.backgroundColor,
          statusBarIconBrightness: Brightness.dark, // Android
          statusBarBrightness: Brightness.light, // iOS
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      // Customize your dark theme here
    );
  }
}

Future<void> requestIOSPermissions() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(alert: true, badge: true, sound: true);

  debugPrint("Permission status: ${settings.authorizationStatus}");
}
