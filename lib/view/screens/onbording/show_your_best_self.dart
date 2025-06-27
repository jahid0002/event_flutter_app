import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/profile/update/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowYourBestSelf extends StatelessWidget {
  const ShowYourBestSelf({super.key});

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
                text: "Show your best self 📸",
                fontSize: 24.w,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                top: 10,
                text:
                    "Upload up to six of your best photos to make a fantastic first impression. Let your personality shine.",
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: AppColors.softWhite,
                maxLines: 4,
                bottom: 20.h,
              ),
              CustomText(
                top: 0,
                text:
                    "Add at least one, and feel free to include more so people can really get to know you!",
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: AppColors.softWhite,
                maxLines: 4,
                bottom: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImagecard(imagePath: AppConstants.boyPhoto),
                  CustomImagecard(),
                  CustomImagecard(),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImagecard(),
                  CustomImagecard(),
                  CustomImagecard(),
                ],
              ),
              //========= Font-end Design Flutter Image Picker Code ===========//
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
                      // Get.toNamed(AppRoutes.showYourBestSelf);
                      Get.toNamed(AppRoutes.justOneThingLoginOnboarding);
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
}
