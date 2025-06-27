// ignore_for_file: deprecated_member_use

import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/home/controller/home_controller.dart';
import 'package:event_app/view/screens/home/widget/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    //  controller.startSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            HomeAppbar(),

            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomNetworkImage(
                    imageUrl:
                        controller.imageUrls[controller.currentIndex.value],
                    height: 570.h,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20.r),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: List.generate(
                          //     controller.imageUrls.length,
                          //     (index) => SlidBar(
                          //       color:
                          //           index == controller.currentIndex.value
                          //               ? AppColors.white
                          //               : AppColors.gray,
                          //     ),
                          //   ),

                          //   // [
                          //   //   SlidBar(),
                          //   //   SlidBar(color: AppColors.gray),
                          //   //   SlidBar(color: AppColors.gray),
                          //   //   SlidBar(color: AppColors.gray),
                          //   // ],
                          // ),
                          SizedBox(height: 320.h),
                          Row(
                            children: [
                              CustomText(
                                text: 'Paulo',
                                fontSize: 39.w,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                              CustomText(
                                left: 10.w,
                                text: '29',
                                fontSize: 24.w,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                          CustomText(
                            text: '@London',
                            fontSize: 16.w,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                            bottom: 5.h,
                          ),
                          Row(
                            children: [
                              CustomButton(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.w,
                                onTap: () {},
                                title: 'Workout',
                                width: 88.w,
                                height: 30.h,
                                fillColor: Colors.transparent,
                                textColor: AppColors.primary,
                                isBorder: true,
                                borderWidth: 1,
                              ),
                              SizedBox(width: 10.w),
                              CustomButton(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.w,
                                onTap: () {},
                                title: 'Casual',
                                width: 88.w,
                                height: 30.h,
                                fillColor: Colors.transparent,
                                textColor: AppColors.primary,
                                isBorder: true,
                                borderWidth: 1,
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                borderRadius: 50.r,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.w,
                                onTap: () {},
                                title: 'No Interest',
                                width: 158.w,
                                height: 47.h,
                                fillColor: Colors.grey.withOpacity(.8),
                                textColor: AppColors.white,
                                isBorder: true,
                                borderWidth: 0,
                              ),
                              CustomButton(
                                borderRadius: 50.r,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.w,
                                onTap: () {},
                                title: 'Innvite',
                                width: 158.w,
                                height: 47.h,
                                fillColor: AppColors.primary,
                                textColor: AppColors.white,
                                isBorder: true,
                                borderWidth: 0,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),

      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}

class SlidBar extends StatelessWidget {
  const SlidBar({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 80.w, height: 2.h, color: color ?? AppColors.white);
  }
}
