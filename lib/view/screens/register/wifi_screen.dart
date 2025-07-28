import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class WifiScreen extends StatelessWidget {
  const WifiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          top: 80,
          bottom: 30,
        ),
        child: Column(
          children: [
            Center(child: CustomImage(imageSrc: AppIcons.mapIcon)),
            CustomText(
              top: 20.h,
              text: "You're not connected to\nthe hotel WiFi",
              fontSize: 24.w,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              top: 20.h,
              text: "To use the app, connect to the hotel WiFi.",
              fontSize: 16.w,
              fontWeight: FontWeight.w400,
              color: Color(0xffC6C5C7),
              bottom: 20,
            ),
            CustomImage(imageSrc: AppIcons.umberalla),
            CustomText(
              top: 20.h,
              text:
                  "To continue your registration, please connect to the hotel’s Wi-Fi. ",
              fontSize: 16.w,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              maxLines: 2,
              bottom: 20,
            ),
            CustomText(
              text:
                  "This experience is only available for guests staying at the hotel.",
              fontSize: 16.w,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              maxLines: 2,
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.calenderLoginOnboarding);
              },
              title: "Go to my WIFI configuration",
            ),
          ],
        ),
      ),
    );
  }
}
