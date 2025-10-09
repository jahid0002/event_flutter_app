// ignore_for_file: deprecated_member_use, unused_local_variable, unnecessary_null_comparison

import 'package:event_app/core/dependency/dependency_injection.dart';
import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/firebase_options.dart';
import 'package:event_app/service/socket_service.dart';
import 'package:event_app/utils/app_langues/app_langues.dart';
import 'package:event_app/view/components/custom_nav_bar/controller/nav_controller.dart';
import 'package:event_app/view/screens/chat/chat_screen.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:event_app/view/screens/settings/controller/langues_controller.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'utils/app_colors/app_colors.dart';
import 'view/components/device_utils/device_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DeviceUtils.lockDevicePortrait();

  DependencyInjection di = DependencyInjection();
  di.dependencies();

  final languageController = Get.put(LanguageController());
  await languageController.initializeLocale();

  await SocketApi.init(
    onSocketConnect: () {
      final navController = Get.find<NavController>();
      navController.getPendingNotificationCount();
    },
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await requestIOSPermissions();

  await initOneSignal();

  runApp(MyApp(languageController: languageController));
}

class MyApp extends StatelessWidget {
  final LanguageController? languageController;

  const MyApp({super.key, this.languageController});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(() {
          return GetMaterialApp(
            title: "InviteeMe",
            theme: CustomTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 200),
            navigatorKey: Get.key,
            initialRoute: AppRoutes.splashScreen,
            getPages: AppRoutes.routes,
            translations: AppTranslations(),
            locale: languageController?.currentLocale.value,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
            fallbackLocale: const Locale('en', 'US'),
          );
        });
      },
    );
  }
}

//========================= >>  OneSignal Initialization ======================== >>
/// Initialize OneSignal with your app ID
Future<void> initOneSignal() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("39e47de2-9435-4c22-b63c-b9ca67961e87");

  OneSignal.Notifications.requestPermission(true);

  OneSignal.Notifications.addClickListener((event) {
    debugPrint(
      "Notification clicked: ${event.notification.jsonRepresentation()}",
    );

    var data = event.notification.additionalData;

    String? conversationId = data?['conversationId'];
    String? connectionId = data?['connectionId'];

    if (conversationId != null) {
      debugPrint(
        "Navigating to Message Screen with conversationId: $conversationId",
      );
      Get.toNamed(AppRoutes.chatScreen);
    } else if (connectionId != null) {
      final ChatController chatController = Get.find<ChatController>();

      debugPrint(
        "Navigating to Connection Request Screen with connectionId: $connectionId",
      );

      chatController.chatType.value = ChatType.notification;

      Get.offAllNamed(AppRoutes.chatScreen);
    } else {
      debugPrint("No valid conversationId or connectionId found in payload.");
    }
  });

  debugPrint("OneSignal initialized successfully");
}

// Future<void> initOneSignal() async {
//   // Optional: for debugging in dev mode
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

//   // Initialize OneSignal with your app ID
//   OneSignal.initialize("39e47de2-9435-4c22-b63c-b9ca67961e87");

//   // Request permission (iOS only)
//   OneSignal.Notifications.requestPermission(true);

//   // (Optional) Handle notification click
//   OneSignal.Notifications.addClickListener((event) {
//     debugPrint(
//       "Notification clicked: ${event.notification.jsonRepresentation()}",
//     );
//   });

//   debugPrint("OneSignal initialized successfully");
// }

/// 📨 Firebase + iOS Notification permission request
Future<void> requestIOSPermissions() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(alert: true, badge: true, sound: true);
  debugPrint("Firebase permission status: ${settings.authorizationStatus}");
}

/// 🎨 Theme configuration
class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor.withOpacity(.99),
      appBarTheme: AppBarTheme(
        toolbarHeight: 65,
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor.withOpacity(.99),
        iconTheme: const IconThemeData(color: Colors.black),
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

  static ThemeData get darkTheme => ThemeData.dark();
}

// // ignore_for_file: deprecated_member_use, unused_element, unused_local_variable

// import 'package:event_app/core/dependency/dependency_injection.dart';
// import 'package:event_app/core/routes/app_routes.dart';
// import 'package:event_app/firebase_options.dart';
// import 'package:event_app/service/socket_service.dart';
// import 'package:event_app/utils/app_langues/app_langues.dart';
// import 'package:event_app/view/screens/settings/controller/langues_controller.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'utils/app_colors/app_colors.dart';
// import 'view/components/device_utils/device_utils.dart';
// import 'package:flutter_localizations/flutter_localizations.dart'; // Add this import

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   DeviceUtils.lockDevicePortrait();

// //   DependencyInjection di = DependencyInjection();
// //   di.dependencies();
// //   final LanguageController languageController = Get.find<LanguageController>();

// //   SocketApi.init();

// //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// //   requestIOSPermissions();

// //   runApp(const MyApp());
// // }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   DeviceUtils.lockDevicePortrait();

//   DependencyInjection di = DependencyInjection();
//   di.dependencies();

//   // Initialize LanguageController and set initial locale
//   final languageController = Get.put(LanguageController());
//   await languageController.initializeLocale();

//   SocketApi.init();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   requestIOSPermissions();

//   runApp(MyApp(languageController: languageController));
// }

// class MyApp extends StatelessWidget {
//   final LanguageController? languageController;

//   const MyApp({super.key, this.languageController});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(393, 852),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return Obx(() {
//           return GetMaterialApp(
//             title: "InviteeMe",
//             theme: CustomTheme.lightTheme,
//             debugShowCheckedModeBanner: false,
//             defaultTransition: Transition.fadeIn,
//             transitionDuration: const Duration(milliseconds: 200),
//             navigatorKey: Get.key,
//             initialRoute: AppRoutes.splashScreen,
//             getPages: AppRoutes.routes,

//             translations: AppTranslations(),
//             locale: languageController?.currentLocale.value,

//             localizationsDelegates: const [
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],

//             supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],

//             fallbackLocale: const Locale('en', 'US'),
//           );
//         });
//       },
//     );
//   }
// }

// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   Locale _locale = const Locale('en'); // Default English

// //   void changeLanguage(Locale locale) {
// //     setState(() {
// //       _locale = locale;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ScreenUtilInit(
// //       designSize: const Size(393, 852),
// //       minTextAdapt: true,
// //       splitScreenMode: true,
// //       builder: (context, child) {
// //         return GetMaterialApp(
// //           title: "InviteeMe",
// //           theme: CustomTheme.lightTheme,
// //           debugShowCheckedModeBanner: false,
// //           defaultTransition: Transition.fadeIn,
// //           transitionDuration: const Duration(milliseconds: 200),
// //           navigatorKey: Get.key,
// //           initialRoute: AppRoutes.splashScreen,
// //           getPages: AppRoutes.routes,

// //           locale: _locale,
// //           localizationsDelegates: AppLocalizations.localizationsDelegates,
// //           supportedLocales: AppLocalizations.supportedLocales,
// //         );
// //       },
// //     );
// //   }
// // }
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   DeviceUtils.lockDevicePortrait();
// //   DependencyInjection di = DependencyInjection();
// //   di.dependencies();
// //   SocketApi.init();
// //   // ...

// //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// //   requestIOSPermissions();

// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return ScreenUtilInit(
// //       minTextAdapt: true,
// //       splitScreenMode: true,
// //       designSize: const Size(393, 852),
// //       child: GetMaterialApp(
// //         theme: CustomTheme.lightTheme,
// //         debugShowCheckedModeBanner: false,
// //         defaultTransition: Transition.fadeIn,
// //         transitionDuration: const Duration(milliseconds: 200),
// //         initialRoute: AppRoutes.splashScreen,
// //         navigatorKey: Get.key,
// //         getPages: AppRoutes.routes,
// //       ),
// //     );
// //   }
// // }

// class CustomTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       scaffoldBackgroundColor: AppColors.backgroundColor.withOpacity(.99),
//       appBarTheme: AppBarTheme(
//         toolbarHeight: 65,
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: AppColors.backgroundColor.withOpacity(.99),
//         iconTheme: const IconThemeData(
//           color: Colors.black, // assuming you want dark icons
//         ),
//         titleTextStyle: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: AppColors.backgroundColor,
//           statusBarIconBrightness: Brightness.dark, // Android
//           statusBarBrightness: Brightness.light, // iOS
//         ),
//       ),
//     );
//   }

//   static ThemeData get darkTheme {
//     return ThemeData.dark().copyWith(
//       // Customize your dark theme here
//     );
//   }
// }

// Future<void> requestIOSPermissions() async {
//   NotificationSettings settings = await FirebaseMessaging.instance
//       .requestPermission(alert: true, badge: true, sound: true);

//   debugPrint("Permission status: ${settings.authorizationStatus}");
// }
