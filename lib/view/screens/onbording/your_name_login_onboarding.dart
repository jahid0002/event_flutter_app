import 'package:event_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:event_app/view/screens/onbording/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class YourNameLoginOnboarding extends StatelessWidget {
  YourNameLoginOnboarding({super.key});

  final OnboardingController controller = Get.find<OnboardingController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // <--- >

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
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
                  text: "Your name 😎",
                  fontSize: 24.w,
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  top: 10,
                  text:
                      "Confirm your name or create a unique nickname that represents you. It's how others will know and remember you.",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                  color: AppColors.softWhite,
                  maxLines: 3,
                  bottom: 180,
                ),
                CustomTextField(
                  cursorColor: AppColors.black,
                  fillColor: Color(0xffF9FAFB),
                  hintText: "Your name ",
                  textEditingController: controller.nameController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
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
                        if (_formKey.currentState!.validate()) {
                          debugPrint(controller.nameController.value.text);
                          debugPrint(controller.leavingDate?.value?.toString());
                          Get.toNamed(AppRoutes.yourEmailLoginOnboarding);
                        }
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
      ),
    );
  }
}
