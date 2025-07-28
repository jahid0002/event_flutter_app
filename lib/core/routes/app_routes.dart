// ignore_for_file: prefer_const_constructors

import 'package:event_app/view/screens/auth/selected_screen.dart/selected_screen.dart';
import 'package:event_app/view/screens/chat/chat_screen.dart';
import 'package:event_app/view/screens/chat/inner_screen/message_screen.dart';
import 'package:event_app/view/screens/connections/connections_details/connections_details_screen.dart';
import 'package:event_app/view/screens/connections/connections_details/report_screen.dart';
import 'package:event_app/view/screens/connections/connections_screen.dart';
import 'package:event_app/view/screens/home/home_screen.dart';
import 'package:event_app/view/screens/home/user_details/other_user_details_screen.dart';
import 'package:event_app/view/screens/onbording/show_your_best_self.dart';
import 'package:event_app/view/screens/profile/profile_screen.dart';
import 'package:event_app/view/screens/profile/update/update_profile.dart';
import 'package:event_app/view/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/onbording/age_login_onboarding.dart';
import '../../view/screens/onbording/calender_login_onboarding.dart';
import '../../view/screens/onbording/gender_login_onboarding.dart';
import '../../view/screens/onbording/just_one_thing_login_onboarding.dart';
import '../../view/screens/onbording/onbording_screen.dart';
import '../../view/screens/onbording/phone_call_login_onboard.dart';
import '../../view/screens/onbording/que_login_onboarding.dart';
import '../../view/screens/onbording/signature_look_onboarding.dart';
import '../../view/screens/onbording/talk_to_me_login_onboarding.dart';
import '../../view/screens/onbording/wifi_screen.dart';
import '../../view/screens/onbording/your_email_login_onboarding.dart';
import '../../view/screens/onbording/your_name_login_onboarding.dart';
import '../../view/screens/profile/settings/account_security_screen/account_security_screen.dart';
import '../../view/screens/profile/settings/help_support_screen/help_support_screen.dart';
import '../../view/screens/profile/settings/language_screen/language_screen.dart';
import '../../view/screens/profile/settings/notifications_screen/notifications_screen.dart';
import '../../view/screens/profile/settings/privacy_policy_screen/privacy_policy_screen.dart';
import '../../view/screens/profile/settings/setting_screen/setting_screen.dart';
import '../../view/screens/profile/settings/terms_conditions_screen/terms_conditions_screen.dart';

///=========================App Routes=========================

class AppRoutes {
  static const String splashScreen = "/SplashScreen";
  static const String profileScreen = "/ProfileScreen";
  static const String homeScreen = "/HomeScreen";
  static const String connectionsScreen = "/ConnectionsScreen";
  static const String chatScreen = "/ChatScreen";
  static const String languageScreen = "/LanguageScreen";
  static const String settingScreen = "/SettingScreen";
  static const String accountSecurityScreen = "/AccountSecurityScreen";
  static const String notificationsScreen = "/NotificationsScreen";
  static const String helpSupportScreen = "/HelpSupportScreen";
  static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static const String termsConditionsScreen = "/TermsConditionsScreen";
  static const String connectionsDetailsScreen = "/ConnectionsDetailsScreen";
  static const String messageScreen = "/MessageScreen";
  static const String selectedScreen = "/SelectedScreen";
  static const String reportScreen = "/ReportScreen";

  static const String updateProfile = "/UpdateProfile";

  static const String onbordingScreen = "/OnbordingScreen";
  static const String wifiScreen = "/WifiScreen";
  static const String calenderLoginOnboarding = "/CalenderLoginOnboarding";
  static const String yourNameLoginOnboarding = "/YourNameLoginOnboarding";
  static const String yourEmailLoginOnboarding = "/YourEmailLoginOnboarding";
  static const String ageLoginOnboarding = "/AgeLoginOnboarding";
  static const String genderLoginOnboarding = "/GenderLoginOnboarding";
  static const String queLoginOnboarding = "/QueLoginOnboarding";
  static const String phoneCallLoginOnboard = "/PhoneCallLoginOnboard";
  static const String talkToMeLoginOnboarding = "/TalkToMeLoginOnboarding";
  static const String signatureLookOnboarding = "/SignatureLookOnboarding";
  static const String otherUserDetailsScreen = "/OtherUserDetailsScreen";
  static const String justOneThingLoginOnboarding =
      "/JustOneThingLoginOnboarding";
  static const String showYourBestSelf = "/ShowYourBestSelf";

  static List<GetPage> routes = [
    ///===========================Authentication==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: connectionsScreen, page: () => ConnectionsScreen()),
    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: languageScreen, page: () => LanguageScreen()),
    GetPage(name: settingScreen, page: () => SettingScreen()),
    GetPage(name: accountSecurityScreen, page: () => AccountSecurityScreen()),
    GetPage(name: notificationsScreen, page: () => NotificationsScreen()),
    GetPage(name: helpSupportScreen, page: () => HelpSupportScreen()),
    GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(name: termsConditionsScreen, page: () => TermsConditionsScreen()),
    GetPage(name: messageScreen, page: () => MessageScreen()),
    GetPage(name: selectedScreen, page: () => SelectedScreen()),

    GetPage(name: updateProfile, page: () => UpdateProfile()),
    GetPage(
      name: connectionsDetailsScreen,
      page: () => ConnectionsDetailsScreen(),
    ),
    GetPage(name: onbordingScreen, page: () => OnbordingScreen()),
    GetPage(name: wifiScreen, page: () => WifiScreen()),
    GetPage(
      name: calenderLoginOnboarding,
      page: () => CalenderLoginOnboarding(),
    ),
    GetPage(
      name: yourNameLoginOnboarding,
      page: () => YourNameLoginOnboarding(),
    ),
    GetPage(
      name: yourEmailLoginOnboarding,
      page: () => YourEmailLoginOnboarding(),
    ),
    GetPage(name: ageLoginOnboarding, page: () => AgeLoginOnboarding()),
    GetPage(name: genderLoginOnboarding, page: () => GenderLoginOnboarding()),
    GetPage(name: queLoginOnboarding, page: () => QueLoginOnboarding()),
    GetPage(name: phoneCallLoginOnboard, page: () => PhoneCallLoginOnboard()),
    GetPage(name: reportScreen, page: () => ReportScreen()),
    GetPage(name: otherUserDetailsScreen, page: () => OtherUserDetailsScreen()),
    GetPage(
      name: talkToMeLoginOnboarding,
      page: () => TalkToMeLoginOnboarding(),
    ),
    GetPage(
      name: signatureLookOnboarding,
      page: () => SignatureLookOnboarding(),
    ),
    GetPage(
      name: justOneThingLoginOnboarding,
      page: () => JustOneThingLoginOnboarding(),
    ),
    GetPage(name: showYourBestSelf, page: () => ShowYourBestSelf()),
  ];
}
