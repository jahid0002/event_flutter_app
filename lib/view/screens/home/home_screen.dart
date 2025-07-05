// ignore_for_file: deprecated_member_use

import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/home/controller/home_controller.dart';
import 'package:event_app/view/screens/home/widget/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.find<HomeController>();
  late SwipableStackController _swipableStackController;
  @override
  void initState() {
    //  controller.startSlider();
    super.initState();
    _swipableStackController = SwipableStackController();
    controller.getAllUser();
  }

  @override
  void dispose() {
    _swipableStackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppbar(),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              if (controller.homeStatus.value == Status.loading) {
                return const Center(child: CustomLoader());
              } else if (controller.homeStatus.value == Status.error) {
                return GeneralErrorScreen(onTap: () {});
              } else {
                return SizedBox(
                  height: 570.h,
                  child: SwipableStack(
                    controller: _swipableStackController,
                    onSwipeCompleted: (index, direction) {
                      final loopedIndex = index % controller.users.length;
                      controller.currentIndex.value = loopedIndex;

                      switch (direction) {
                        case SwipeDirection.left:
                          debugPrint("Swiped Left to index: $loopedIndex");
                          break;
                        case SwipeDirection.right:
                          debugPrint("Swiped Right to index: $loopedIndex");
                          break;
                        case SwipeDirection.up:
                          debugPrint("Swiped Up!");
                          break;
                        case SwipeDirection.down:
                          debugPrint("Swiped Down!");
                          break;
                      }
                    },
                    itemCount: null,
                    builder: (BuildContext context, itemProperties) {
                      final index =
                          itemProperties.index % controller.users.length;
                      // final imageUrl = controller.imageUrls[index];
                      final data = controller.users[index];
                      return CustomNetworkImage(
                        height: 570.h,
                        width: double.infinity,
                        imageUrl: ImageHandler.imagesHandle(data.profileImage),
                        borderRadius: BorderRadius.circular(20.r),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            children: [
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: data.name ?? ' ',
                                        fontSize: 39.w,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                      ),
                                      CustomText(
                                        left: 10.w,
                                        text: data.age?.toString() ?? '',
                                        fontSize: 24.w,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text: data.address ?? '',
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
                                  SizedBox(height: 20.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          borderRadius: 50.r,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.w,
                                          onTap: () {},
                                          title: 'No Interest',
                                          height: 47.h,
                                          fillColor: Colors.grey.withOpacity(
                                            .8,
                                          ),
                                          textColor: AppColors.white,
                                          isBorder: true,
                                          borderWidth: 0,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                        child: CustomButton(
                                          borderRadius: 50.r,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.w,
                                          onTap: () {},
                                          title: 'Innvite',
                                          height: 47.h,
                                          fillColor: AppColors.primary,
                                          textColor: AppColors.white,
                                          isBorder: true,
                                          borderWidth: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
