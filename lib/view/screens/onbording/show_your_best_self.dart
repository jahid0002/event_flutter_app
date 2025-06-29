// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/ToastMsg/toast_message.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/onbording/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowYourBestSelf extends StatelessWidget {
  ShowYourBestSelf({super.key});

  final OnboardingController controller = Get.find<OnboardingController>();

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

              Obx(() {
                return Expanded(
                  child: GridView.builder(
                    //    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.imageFiles.length + 1,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: .7,
                    ),
                    itemBuilder: (context, index) {
                      return CustomImagecard2(
                        addbutton: () {
                          controller.pickMultipleImages();
                        },
                        removeButton: () {
                          controller.removeImage(index);
                        },
                        imagePath:
                            index == controller.imageFiles.length
                                ? null
                                : controller.imageFiles[index].path,
                      );
                    },
                  ),
                );
              }),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomImagecard2(imagePath: AppConstants.boyPhoto),
              //     CustomImagecard2(),
              //     CustomImagecard2(),
              //   ],
              // ),
              // SizedBox(height: 20.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomImagecard2(),
              //     CustomImagecard2(),
              //     CustomImagecard2(),
              //   ],
              // ),
              //========= Font-end Design Flutter Image Picker Code ===========//
              //  Spacer(),
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

                      if (controller.imageFiles.isEmpty) {
                        showCustomSnackBar("Please select at least one image");
                        return;
                      }
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

class CustomImagecard2 extends StatelessWidget {
  const CustomImagecard2({
    super.key,
    this.imagePath,
    this.addbutton,
    this.removeButton,
  });

  final String? imagePath;
  final VoidCallback? addbutton;
  final VoidCallback? removeButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 108.w,
          height: 155.h,
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              imagePath != null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(imagePath!),
                      height: 155.h,
                      width: 108.w,
                      fit: BoxFit.cover,
                    ),
                  )
                  : SizedBox(),
        ),

        Positioned(
          right: -8,
          bottom: -8,

          child: GestureDetector(
            onTap: imagePath == null ? addbutton : removeButton,
            child: Card(
              elevation: 5,
              color: Colors.transparent,
              child: Container(
                height: 31.h,
                width: 31.w,
                decoration: BoxDecoration(
                  color:
                      imagePath != null ? AppColors.white : AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  imagePath != null ? Icons.close : Icons.add,
                  color:
                      imagePath != null ? AppColors.primary : AppColors.white,
                  size: 25.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
