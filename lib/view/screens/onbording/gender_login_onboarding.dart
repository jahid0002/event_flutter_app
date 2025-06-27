import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class GenderLoginOnboarding extends StatefulWidget {
  const GenderLoginOnboarding({super.key});

  @override
  State<GenderLoginOnboarding> createState() => _GenderLoginOnboardingState();
}

class _GenderLoginOnboardingState extends State<GenderLoginOnboarding> {
  String selectedLanguage = 'Man';
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
                text: "Be true to yourself 🌟",
                fontSize: 24.w,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                top: 40,
                text:
                    "Choose the gender that best represents you. Authenticity is key to meaningful connections.",
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: AppColors.softWhite,
                maxLines: 4,
                bottom: 50,
              ),
              _languageTile('Man'),
              const SizedBox(height: 12),
              _languageTile('Woman'),
              const SizedBox(height: 12),
              //  _languageTile('Other'),
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
                      Get.toNamed(AppRoutes.queLoginOnboarding);
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
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
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
