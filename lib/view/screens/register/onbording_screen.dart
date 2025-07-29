import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Skip Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: "Skip",
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    right: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.wifiScreen);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      maxRadius: 20,
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Illustration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomImage(imageSrc: AppIcons.onbordingOne),
            ),

            Spacer(),

            // Welcome Text
            CustomText(
              text: "Welcome to Innviteme",
              fontSize: 24.w,
              fontWeight: FontWeight.w700,
              color: AppColors.black_04,
              maxLines: 3,
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomText(
                text:
                    "Connect with like-minded people staying at your hotel and make your stay unforgettable.",
                fontSize: 16.w,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                maxLines: 3,
              ),
            ),

            Spacer(),

            // Sign In Button
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            //   child: Column(
            //     children: [
            //       CustomText(
            //         text: "Already have an account?",
            //         fontSize: 14.w,
            //         fontWeight: FontWeight.w400,
            //         color: AppColors.softGray,
            //         bottom: 20,
            //       ),
            //       CustomButton(onTap: () {}, title: "Sign In"),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
