import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationsScreen> {
  bool generalNotifications = true;
  bool matchNotifications = true;
  bool messageNotifications = false;

  final SettingsController controller = Get.find<SettingsController>();

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();

    controller.getNotificationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FA),
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
              text: AppStrings.notifications.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Obx(() {
            if (controller.notificationSettingsStatus.value == Status.loading) {
              return Center(child: CustomLoader());
            }

            if (controller.notificationSettingsStatus.value == Status.error) {
              return GeneralErrorScreen(
                onTap: () => controller.getNotificationSettings(),
              );
            }

            return Column(
              children: [
                _buildToggleTile(
                  title: AppStrings.generalNotificationsTitle.tr,
                  subtitle: AppStrings.generalNotificationsSubtitle.tr,
                  value: controller.generalNotifications.value,
                  onChanged: (val) {
                    controller.generalNotifications.value = val;
                    controller.updateNotification();
                  },
                ),
                const Divider(),
                _buildToggleTile(
                  title: AppStrings.matchNotificationsTitle.tr,
                  subtitle: AppStrings.matchNotificationsSubtitle.tr,
                  // "Get notified when someone matches with you based on your profile preferences.",
                  value: controller.matchNotifications.value,
                  onChanged: (val) {
                    controller.matchNotifications.value = val;
                    controller.updateNotification();
                  },
                ),
                const Divider(),
                _buildToggleTile(
                  title: AppStrings.messageNotificationsTitle.tr,
                  subtitle: AppStrings.messageNotificationsSubtitle.tr,
                  value: controller.messageNotifications.value,
                  onChanged: (val) {
                    controller.messageNotifications.value = val;
                    controller.updateNotification();
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF00C29E),
    );
  }
}
