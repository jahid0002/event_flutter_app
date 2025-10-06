// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, unused_local_variable

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/home/controller/home_controller.dart';
import 'package:event_app/view/screens/home/model/user_model.dart';
import 'package:event_app/view/screens/home/widget/home_appbar.dart';
import 'package:event_app/view/screens/home/widget/home_shimmer.dart';
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
                return const Center(child: HomeShimmer());
              } else if (controller.homeStatus.value == Status.error) {
                return GeneralErrorScreen(onTap: () {});
              } else if (controller.homeStatus.value == Status.completed) {
                return controller.users.isEmpty
                    ? Center(
                      child: CustomText(
                        text: AppStrings.noUserFound.tr,
                        top: 200.h,
                      ),
                    )
                    : SizedBox(
                      height: 570.h,
                      child: SwipableStack(
                        controller: _swipableStackController,
                        onSwipeCompleted: (index, direction) {
                          final loopedIndex = index % controller.users.length;
                          controller.currentIndex.value = loopedIndex;

                          switch (direction) {
                            case SwipeDirection.left:
                              debugPrint("Swiped Left to index: $loopedIndex");
                              controller.addOrRemoveConnection(
                                userId: controller.users[loopedIndex].id ?? '',
                              );
                              break;
                            case SwipeDirection.right:
                              debugPrint("Swiped Right to index: $loopedIndex");

                              break;
                            case SwipeDirection.up:
                              debugPrint("Swiped Up!");
                              Get.toNamed(
                                AppRoutes.otherUserDetailsScreen,
                                arguments:
                                    controller.users[loopedIndex].id ?? '',
                              );
                              break;
                            case SwipeDirection.down:
                              debugPrint("Swiped Down!");
                              break;
                          }
                        },
                        onWillMoveNext: (index, direction) {
                          final loopedIndex = index % controller.users.length;
                          if (direction == SwipeDirection.up) {
                            Get.toNamed(
                              AppRoutes.otherUserDetailsScreen,
                              arguments: controller.users[loopedIndex].id ?? '',
                            );
                            return false; // do not advance to next card
                          }
                          return true; // allow left, right, down
                        },
                        itemCount: null,
                        builder: (BuildContext context, itemProperties) {
                          final index =
                              itemProperties.index % controller.users.length;
                          // final imageUrl = controller.imageUrls[index];
                          final data = controller.users[index];
                          final image = ImageHandler.imagesHandle(
                            // controller.imageUrls[index],
                            data.profileImage,
                          );
                          return CustomNetworkImage(
                            height: 570.h,
                            width: double.infinity,
                            imageUrl: image,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width:
                                                ((data.name?.length ?? 0) > 6)
                                                    ? 250.w
                                                    : 140.w,
                                            child: CustomText(
                                              text: data.name ?? ' ',
                                              fontSize: 39.w,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white,
                                              textAlign: TextAlign.start,
                                            ),
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
                                          if (data.interests != null &&
                                              data.interests!.isNotEmpty) ...[
                                            CustomButton(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.w,
                                              onTap: () {},
                                              title: data.interests![0],
                                              width: 88.w,
                                              height: 30.h,
                                              fillColor: Colors.transparent,
                                              textColor: AppColors.primary,
                                              isBorder: true,
                                              borderWidth: 1,
                                            ),
                                            SizedBox(width: 10.w),
                                            data.interests!.length > 1
                                                ? CustomButton(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14.w,
                                                  onTap: () {},
                                                  title:
                                                      data.interests!.length > 1
                                                          ? data.interests![1]
                                                          : '',
                                                  width: 88.w,
                                                  height: 30.h,
                                                  fillColor: Colors.transparent,
                                                  textColor: AppColors.primary,
                                                  isBorder: true,
                                                  borderWidth: 1,
                                                )
                                                : SizedBox(),
                                          ],
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
                                              onTap: () {
                                                _swipableStackController.next(
                                                  swipeDirection:
                                                      SwipeDirection.right,
                                                );
                                              },
                                              title: AppStrings.noInterest.tr,
                                              height: 47.h,
                                              fillColor: Colors.grey
                                                  .withOpacity(.8),
                                              textColor: AppColors.white,
                                              isBorder: true,
                                              borderWidth: 0,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: Obx(() {
                                              getText(data.connection);
                                              return controller
                                                      .inviteStatus
                                                      .value
                                                  ? CustomLoader()
                                                  : CustomButton(
                                                    borderRadius: 50.r,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.w,
                                                    onTap: () async {
                                                      final updatedConnection =
                                                          await controller
                                                              .addOrRemoveConnection(
                                                                userId:
                                                                    data.id ??
                                                                    '',
                                                              );

                                                      // if (updatedConnection !=
                                                      //     null) {
                                                      //   setState(() {
                                                      //     data.connection =
                                                      //         updatedConnection;
                                                      //   });
                                                      // }
                                                    },
                                                    title:
                                                        data.connection == null
                                                            ? AppStrings
                                                                .invite
                                                                .tr
                                                            : getText(
                                                              data.connection,
                                                            ),
                                                    height: 47.h,
                                                    fillColor:
                                                        AppColors.primary,
                                                    textColor: AppColors.white,
                                                    isBorder: true,
                                                    borderWidth: 0,
                                                  );
                                            }),
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
              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }

  String getText(Connection? connection) {
    if (connection == null) {
      return 'Invite';
    }

    switch (connection.status) {
      case 'PENDING':
        return AppStrings.pending.tr;
      case 'ACCEPTED':
        return AppStrings.accepted.tr;
      case 'REJECTED':
        return AppStrings.rejected.tr;
      default:
        return AppStrings.invite.tr;
    }
  }
}
