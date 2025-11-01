// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, unused_local_variable

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
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
    controller.loadUserId();
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
                    ? Image.asset(
                      AppIcons.emptyUser,
                      height: 570.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
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

                              break;
                            case SwipeDirection.right:
                              if (getText(
                                    controller.users[loopedIndex].connection,
                                  ) ==
                                  AppStrings.pending.tr) {
                                return;
                              }
                              controller.addOrRemoveConnection(
                                userId: controller.users[loopedIndex].id ?? '',
                              );
                              debugPrint("Swiped Right to index: $loopedIndex");

                              break;
                            case SwipeDirection.up:
                              debugPrint("Swiped Up!");
                              Get.toNamed(
                                AppRoutes.otherUserDetailsScreen,
                                arguments: [
                                  controller.users[loopedIndex].id ?? '',
                                  true,
                                ],
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
                              arguments: [
                                controller.users[loopedIndex].id ?? '',
                                true,
                              ],
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
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.otherUserDetailsScreen,
                                arguments: [
                                  controller.users[index].id ?? '',
                                  true,
                                ],
                              );
                            },
                            child: CustomNetworkImage(
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

                                        if (data.interests != null &&
                                            data.interests!.isNotEmpty)
                                          Wrap(
                                            spacing:
                                                10.w, // horizontal space between items
                                            runSpacing:
                                                10.h, // vertical space between lines
                                            children: List.generate(
                                              data.interests!.length,
                                              (index) {
                                                return Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w,
                                                    vertical: 8.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                      color: AppColors.primary,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          100.r,
                                                        ),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    minHeight: 30.h,
                                                    maxWidth:
                                                        250.w, // optional: keep very long text from stretching
                                                  ),
                                                  child: Text(
                                                    data.interests![index],
                                                    style: TextStyle(
                                                      fontSize: 14.w,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.primary,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        else
                                          const SizedBox(),

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
                                                        SwipeDirection.left,
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.w,
                                                      onTap: () async {
                                                        if (data.connection ==
                                                            null) {
                                                          final updatedConnection =
                                                              await controller
                                                                  .addOrRemoveConnection(
                                                                    userId:
                                                                        data.id ??
                                                                        '',
                                                                  );
                                                        } else {
                                                          if (data
                                                                  .connection
                                                                  ?.sender ==
                                                              controller
                                                                  .userID
                                                                  .value) {
                                                            final updatedConnection =
                                                                await controller
                                                                    .addOrRemoveConnection(
                                                                      userId:
                                                                          data.id ??
                                                                          '',
                                                                    );
                                                          } else {
                                                            await controller
                                                                .acceptConnectionRequest(
                                                                  userID:
                                                                      data
                                                                          .connection
                                                                          ?.id ??
                                                                      '',
                                                                );
                                                          }
                                                        }
                                                      },
                                                      title:
                                                          data.connection ==
                                                                  null
                                                              ? AppStrings
                                                                  .invite
                                                                  .tr
                                                              : controller
                                                                      .userID
                                                                      .value ==
                                                                  data
                                                                      .connection
                                                                      ?.sender
                                                              ? getText(
                                                                data.connection,
                                                              )
                                                              : 'Accept'.tr,
                                                      height: 47.h,
                                                      fillColor:
                                                          AppColors.primary,
                                                      textColor:
                                                          AppColors.white,
                                                      isBorder: true,
                                                      borderWidth: 0,
                                                    );
                                              }),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(height: 20.h),
                                      ],
                                    ),
                                  ],
                                ),
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
