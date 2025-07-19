import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_text/custom_text.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({super.key});

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
              text: "Account & Security",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Linked Accounts",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  _linkedItem(
                    icon: AppIcons.google, // Replace with your icon asset
                    label: 'Google',
                    actionLabel: 'Remove',
                    actionColor: Colors.grey,
                  ),
                  const Divider(height: 1),
                  _linkedItem(
                    icon: AppIcons.facbook,
                    label: 'Facebook',
                    actionLabel: 'Remove',
                    actionColor: Colors.grey,
                  ),
                  const Divider(height: 1),
                  _linkedItem(
                    icon: AppIcons.apple,
                    label: 'Apple',
                    actionLabel: 'Link',
                    actionColor: Color(0xFF00C29E),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Account Deletion",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const Text(
              "Once you delete your account, all your data will be permanently removed.",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const Spacer(),
            CustomButton(
              onTap: () {},
              borderRadius: 30,
              title: "Delete Account",
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _linkedItem({
    required String icon,
    required String label,
    required String actionLabel,
    required Color actionColor,
  }) {
    return ListTile(
      leading: CustomImage(imageSrc: icon, height: 30, width: 30),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Text(
        actionLabel,
        style: TextStyle(color: actionColor, fontWeight: FontWeight.w500),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () {
        // Handle tap for link/remove
      },
    );
  }
}
