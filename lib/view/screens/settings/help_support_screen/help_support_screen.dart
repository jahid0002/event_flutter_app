import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/screens/profile/controller/profile_controller.dart';
import 'package:event_app/view/screens/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';

class HelpSupportScreen extends StatelessWidget {
  HelpSupportScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  final SettingsController controller = Get.find<SettingsController>();

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
              text: AppStrings.helpSupportTitle.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${profileController.profileModel.value.name ?? ''}!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              const Text(
                "What can I help you for today?",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Search Field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "You can search some keywords from your problem for faster solution you might have.",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 24),
              const Text(
                "Frequently Asked",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              _faqItem(
                question: "How do I sign up on Innvite?",
                answer:
                    "You can sign up for Innvite using your hotel’s Wi-Fi or by entering the unique access code provided by the hotel. Simply follow the registration steps after logging into the Wi-Fi or entering the code.",
              ),
              const SizedBox(height: 12),
              _faqItem(
                question: "How do I update my profile?",
                answer:
                    "To update your profile, go to the “Profile” section in the app. You can change your nickname, upload a new photo, update your interests, and adjust other personal details like your stay dates and preferred activities.",
              ),
              const SizedBox(height: 12),
              _faqItem(
                question:
                    "Can I connect with guests who aren’t staying at my hotel?",
                answer:
                    "No, you can only connect with guests who are staying at the same hotel as you. This ensures privacy and security for all guests.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _faqItem({required String question, required String answer}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
