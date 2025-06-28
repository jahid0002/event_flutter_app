import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class TalkToMeLoginOnboarding extends StatefulWidget {
  const TalkToMeLoginOnboarding({super.key});

  @override
  State<TalkToMeLoginOnboarding> createState() =>
      _TalkToMeLoginOnboardingState();
}

class _TalkToMeLoginOnboardingState extends State<TalkToMeLoginOnboarding> {
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Back Button
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  CustomText(
                    text: "Back",
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    left: 8,
                  ),
                ],
              ),
              CustomText(
                top: 40,
                text: "What languages do you speak? 🌍",
                fontSize: 24.w,
                fontWeight: FontWeight.w700,
                maxLines: 2,
              ),
              CustomText(
                top: 40,
                text:
                    "Choose your language to start connecting your way. Select at least 1, and as many as you want.\n\nSelect at least 1, and as many as you want.",
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: AppColors.softWhite,
                maxLines: 4,
                bottom: 50,
              ),
              _languageTile('English'),
              const SizedBox(height: 12),
              _languageTile('Spanish'),
              const SizedBox(height: 12),
              //  _languageTile('German'),
              const SizedBox(height: 12),
              // _languageTile('French'),
              SizedBox(height: 20),
              TextField(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: CustomText(
                      text:
                          "Type the language and tap 'add' to save it to your profile.",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      color: Color(0xff828693),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      onTap: () {},
                      title: "add",
                      height: 30,
                      width: 60,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: "Next",
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    right: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signatureLookOnboarding);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      maxRadius: 20,
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _languageTile(String language) {
    final bool isSelected = selectedLanguage == language;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
          ),
        ),
        child: RadioListTile<String>(
          value: language,
          groupValue: selectedLanguage,
          onChanged: (val) {
            setState(() {
              selectedLanguage = val!;
            });
          },
          contentPadding: EdgeInsets.zero,
          title: Text(
            language,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          activeColor: Colors.black,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    );
  }
}
