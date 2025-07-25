import 'package:flutter/material.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_text/custom_text.dart';

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
              text: "Notifications",
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
          child: Column(
            children: [
              _buildToggleTile(
                title: "General Notifications",
                subtitle:
                    "Enable notifications for app updates, system alerts, and other important notifications.",
                value: generalNotifications,
                onChanged: (val) => setState(() => generalNotifications = val),
              ),
              const Divider(),
              _buildToggleTile(
                title: "Match Notifications",
                subtitle:
                    "Get notified when someone matches with you based on your profile preferences.",
                value: matchNotifications,
                onChanged: (val) => setState(() => matchNotifications = val),
              ),
              const Divider(),
              _buildToggleTile(
                title: "Message Notifications",
                subtitle:
                    "Get notified when you receive new messages in the chat.",
                value: messageNotifications,
                onChanged: (val) => setState(() => messageNotifications = val),
              ),
            ],
          ),
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
