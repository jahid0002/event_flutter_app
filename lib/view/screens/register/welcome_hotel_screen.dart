import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeHotelScreen extends StatefulWidget {
  const WelcomeHotelScreen({super.key});

  @override
  State<WelcomeHotelScreen> createState() => _WelcomeHotelScreenState();
}

class _WelcomeHotelScreenState extends State<WelcomeHotelScreen> {
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(
        AppRoutes.homeScreen,
      ); // Replace with your next screen route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            CustomImage(imageSrc: AppIcons.welcomeText),

            Positioned(
              top: 470.h,
              left: 0,
              right: 0,
              child: CustomText(
                text:
                    'Welcome to ${profileController.profileModel.value.hotel?.name ?? ''}',
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
