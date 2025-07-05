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
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            HomeAppbar(),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 570.h,
                child: SwipableStack(
                  controller: _swipableStackController,
                  onSwipeCompleted: (index, direction) {
                    final loopedIndex = index % controller.imageUrls.length;
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

                  // Instead of itemCount: controller.imageUrls.length + 1,
                  // just keep it "infinite"
                  itemCount:
                      null, // ✅ If SwipableStack allows null for infinite

                  builder: (BuildContext context, itemProperties) {
                    final index =
                        itemProperties.index % controller.imageUrls.length;
                    final imageUrl = controller.imageUrls[index];
                    return CustomNetworkImage(
                      height: 570.h,
                      width: double.infinity,
                      imageUrl: imageUrl,
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
                                        fillColor: Colors.grey.withOpacity(.8),
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
              ),
            ),
          ],
        ),
      ),
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
