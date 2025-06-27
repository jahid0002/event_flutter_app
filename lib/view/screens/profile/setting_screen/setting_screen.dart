import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widget/custom_settings_list_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 20),
            const Spacer(),
            CustomImage(
              imageSrc: AppIcons.connection,
              imageColor: AppColors.primary,
            ),
            const SizedBox(width: 6),
            CustomText(
              text: "Settings",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          CustomSettingsListCard(
            text: "Account & Security",
            onTap: () {
              Get.toNamed(AppRoutes.accountSecurityScreen);
            },
          ),
          CustomSettingsListCard(
            text: "Notification",
            onTap: () {
              Get.toNamed(AppRoutes.notificationsScreen);
            },
          ),
          CustomSettingsListCard(
            text: "Help & Support",
            onTap: () {
              Get.toNamed(AppRoutes.helpSupportScreen);
            },
          ),
          CustomSettingsListCard(
            text: "Privacy Policy",
            onTap: () {
              Get.toNamed(AppRoutes.privacyPolicyScreen);
            },
          ),
          CustomSettingsListCard(
            text: "Terms & Conditions",
            onTap: () {
              Get.toNamed(AppRoutes.termsConditionsScreen);
            },
          ),
          CustomSettingsListCard(
            text: "log out",
            color: AppColors.red,
            onTap: () {
              // Get.toNamed(AppRoutes.languageScreen);
            },
          ),
          CustomSettingsListCard(
            text: "Delete Account",
            color: AppColors.red,
            onTap: () {
              // Get.toNamed(AppRoutes.languageScreen);
            },
          ),
        ],
      ),
    );
  }
}
