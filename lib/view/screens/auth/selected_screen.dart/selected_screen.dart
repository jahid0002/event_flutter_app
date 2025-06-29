// ignore_for_file: deprecated_member_use

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectedScreen extends StatelessWidget {
  SelectedScreen({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Center(child: CustomImage(imageSrc: AppIcons.logo2)),
            CustomText(
              top: 50.h,
              text: 'Let’s dive in into your account!',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              bottom: 200.h,
            ),
            SocialButton(
              text: 'Continue with Google'.toUpperCase(),
              icon: AppIcons.google,
              onPressed: () {
                // Get.to(() => const OnbordingScreen());
                controller.signInWithGoogle();
              },
            ),
            SocialButton(
              text: 'Continue with Facebook'.toUpperCase(),
              icon: AppIcons.facbook,
              onPressed: () {
                Get.toNamed(AppRoutes.onbordingScreen);
                // Get.to(() => const OnbordingScreen());
              },
            ),
            SocialButton(
              text: 'Continue with Apple'.toUpperCase(),
              icon: AppIcons.apple,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback? onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          width: 300,

          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(.2), // stronger shadow
                blurRadius: 8,
                offset: Offset(0, 4),
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImage(imageSrc: icon),
              const SizedBox(width: 12),
              CustomText(text: text, fontSize: 14.w, color: AppColors.black),
            ],
          ),
        ),
      ),
    );
  }
}
