import 'package:event_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:event_app/view/screens/onbording/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class YourEmailLoginOnboarding extends StatelessWidget {
  YourEmailLoginOnboarding({super.key});

  final OnboardingController controller = Get.find<OnboardingController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  text: "Your Email 📧",
                  fontSize: 24.w,
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  top: 10,
                  text:
                      "Please confirm your email address. This will be used for communication and account access, so make sure it’s correct and up to date, as you won’t be able to change it later.",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                  color: AppColors.softWhite,
                  maxLines: 4,
                  bottom: 180,
                ),
                CustomTextField(
                  fillColor: Color(0xffF9FAFB),
                  hintText: "Your email ",
                  textEditingController: controller.emailController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
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
                          debugPrint(controller.emailController.value.text);
                          debugPrint(controller.nameController.value.text);
                          debugPrint(controller.leavingDate?.value.toString());
                          Get.toNamed(AppRoutes.ageLoginOnboarding);
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
