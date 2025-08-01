// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/connections/connections_details/connections_details_screen.dart';
import 'package:event_app/view/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtherUserDetailsScreen extends StatefulWidget {
  const OtherUserDetailsScreen({super.key});

  @override
  State<OtherUserDetailsScreen> createState() => _OtherUserDetailsScreenState();
}

class _OtherUserDetailsScreenState extends State<OtherUserDetailsScreen> {
  final String otherUserId = Get.arguments;
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();
    controller.getConnectionDetails(userId: otherUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return CustomNetworkImage(
                    imageUrl: ImageHandler.imagesHandle(
                      controller.connectionDetails.value.profileImage,
                    ),
                    height: 612.h,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20.r),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Platform.isIOS
                                      ? Icons.arrow_back_ios
                                      : Icons.arrow_back,
                                  color: AppColors.white,
                                ),
                              ),
                              // CircleAvatar(
                              //   backgroundColor: AppColors.primary,
                              //   maxRadius: 15.r,
                              //   child: Icon(
                              //     Icons.more_horiz,
                              //     color: AppColors.white,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: CustomText(
                    top: 50.h,
                    left: 35.w,
                    text: 'About me',
                    fontSize: 16.w,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    bottom: 5.h,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.primary, thickness: 3),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.gray, thickness: 3),
                    ),
                  ],
                ),

                Obx(() {
                  switch (controller.userDetailsStatus.value) {
                    case Status.loading:
                      return CustomLoader();
                    case Status.error:
                      return GeneralErrorScreen(
                        onTap:
                            () => controller.getConnectionDetails(
                              userId: otherUserId,
                            ),
                      );
                    case Status.internetError:
                      return GeneralErrorScreen(
                        onTap:
                            () => controller.getConnectionDetails(
                              userId: otherUserId,
                            ),
                      );
                    case Status.completed:
                      final user = controller.connectionDetails.value;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          (user.name?.length ?? 0) < 6
                                              ? 120.w
                                              : 270.w,
                                      child: CustomText(
                                        top: 10.h,
                                        left: 0.w,
                                        text: user.name ?? 'N/A',
                                        fontSize: 38.w,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.start,
                                        // color: AppColors.primary,
                                      ),
                                    ),
                                    CustomText(
                                      top: 10.h,
                                      left: 10.w,
                                      text:
                                          '${controller.connectionDetails.value.age ?? 'N/A'}',
                                      fontSize: 24.w,
                                      fontWeight: FontWeight.w400,
                                      // color: AppColors.primary,
                                    ),
                                  ],
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     ReceiverInformation
                                //     information = ReceiverInformation(
                                //       receiverId: connection.otherUser?.id,
                                //       receiverName: connection.otherUser?.name,
                                //       receiverImage:
                                //           connection.otherUser?.profileImage,
                                //     );
                                //     Get.toNamed(
                                //       AppRoutes.messageScreen,
                                //       arguments: information,
                                //     );
                                //   },
                                //   child: CircleAvatar(
                                //     backgroundColor: AppColors.primary,
                                //     maxRadius: 20.r,
                                //     child: Icon(
                                //       Icons.chat_bubble,
                                //       color: AppColors.white,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            CustomText(
                              text: 'About Me',
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 15.h,
                            ),
                            CustomText(
                              text:
                                  controller.connectionDetails.value.bio ??
                                  'N/A',
                              fontSize: 12.w,
                              fontWeight: FontWeight.w400,
                              maxLines: 5,
                              textAlign: TextAlign.start,
                              bottom: 10.h,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Gender',
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                ModifyButton(
                                  color: AppColors.gray,
                                  title:
                                      controller.connectionDetails.value.gender,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'From',
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                ModifyButton(
                                  color: AppColors.gray,
                                  title:
                                      controller
                                          .connectionDetails
                                          .value
                                          .address ??
                                      'N/A',
                                ),
                              ],
                            ),
                            CustomText(
                              top: 20.h,
                              text: 'My intereses',
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 10.h,
                            ),
                            Row(
                              children: List.generate(
                                controller
                                        .connectionDetails
                                        .value
                                        .interests
                                        ?.length ??
                                    0,
                                (index) {
                                  return ModifyButton(
                                    // width: 200.w,
                                    color: AppColors.gray,
                                    title:
                                        controller
                                            .connectionDetails
                                            .value
                                            .interests?[index] ??
                                        'N/A',
                                  );
                                },
                              ),

                              // [
                              //   ModifyButton(
                              //     color: AppColors.primary,
                              //     title: '‍Workout 🏃',
                              //     width: 120.w,
                              //   ),
                              //   SizedBox(width: 10.w),
                              //   ModifyButton(
                              //     title: 'Casual 😄',
                              //     color: AppColors.primary,
                              //     width: 120.w,
                              //   ),
                              // ],
                            ),
                            CustomText(
                              top: 20.h,
                              text: 'Languages',
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 10.h,
                            ),
                            Row(
                              children: List.generate(
                                controller
                                        .connectionDetails
                                        .value
                                        .language
                                        ?.length ??
                                    0,
                                (index) {
                                  return ModifyButton(
                                    // width: 200.w,
                                    color: AppColors.gray,
                                    title:
                                        controller
                                            .connectionDetails
                                            .value
                                            .language?[index] ??
                                        'N/A',
                                  );
                                },
                              ),

                              // [
                              //   ModifyButton(
                              //     color: AppColors.gray,
                              //     title: 'Spanish',
                              //     width: 120.w,
                              //   ),
                              //   SizedBox(width: 10.w),
                              //   ModifyButton(
                              //     title: 'Italian',
                              //     color: AppColors.gray,
                              //     width: 120.w,
                              //   ),
                              // ],
                            ),
                            SizedBox(height: 40.h),
                            CustomText(
                              top: 20.h,
                              text: 'My Album',
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 10.h,
                            ),
                            (user.pictures?.isEmpty ?? true)
                                ? SizedBox()
                                : GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: user.pictures?.length ?? 0,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10.w,
                                        crossAxisSpacing: 10.w,
                                        childAspectRatio: 0.7,
                                      ),
                                  itemBuilder: (context, index) {
                                    return CustomNetworkImage(
                                      imageUrl: user.pictures?[index] ?? '',
                                      height: 200.h,
                                      width: 130.w,
                                      borderRadius: BorderRadius.circular(10.r),
                                    );
                                  },
                                ),
                          ],
                        ),
                      );
                  }
                }),
              ],
            ),
            // Positioned(
            //   top: 570.h,
            //   left: 100.w,
            //   child: Row(
            //     children: [
            //       ConnectionsDetailsButton(
            //         imageSrc: Icons.close,
            //         color: AppColors.red,
            //       ),
            //       SizedBox(width: 20.w),
            //       Container(
            //         height: 84.h,
            //         width: 84.w,
            //         decoration: BoxDecoration(
            //           color: AppColors.white,
            //           shape: BoxShape.circle,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withOpacity(
            //                 0.1,
            //               ), // Adjust opacity as needed
            //               spreadRadius: 2,
            //               blurRadius: 10,
            //               offset: Offset(
            //                 0,
            //                 4,
            //               ), // horizontal, vertical shadow offset
            //             ),
            //           ],
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(25.0),
            //           child: CustomImage(
            //             imageSrc: AppIcons.connection,
            //             imageColor: AppColors.primary,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
