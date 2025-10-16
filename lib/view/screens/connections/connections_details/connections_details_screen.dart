// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:event_app/view/screens/connections/controller/connection_controller.dart';
import 'package:event_app/view/screens/connections/model/connection_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConnectionsDetailsScreen extends StatefulWidget {
  const ConnectionsDetailsScreen({super.key});

  @override
  State<ConnectionsDetailsScreen> createState() =>
      _ConnectionsDetailsScreenState();
}

class _ConnectionsDetailsScreenState extends State<ConnectionsDetailsScreen> {
  final ConnectionModel connection = Get.arguments;
  final ConnectionController conntroller = Get.find<ConnectionController>();

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();
    conntroller.getConnectionDetails(userId: connection.otherUser?.id ?? '');
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
                CustomNetworkImage(
                  imageUrl: ImageHandler.imagesHandle(
                    connection.otherUser?.profileImage,
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
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: CustomText(
                    top: 50.h,
                    left: 35.w,
                    text: AppStrings.aboutMe.tr,
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
                  switch (conntroller.userDetailsStatus.value) {
                    case Status.loading:
                      return CustomLoader();
                    case Status.error:
                      return GeneralErrorScreen(
                        onTap:
                            () => conntroller.getConnectionDetails(
                              userId: connection.otherUser?.id ?? '',
                            ),
                      );
                    case Status.internetError:
                      return GeneralErrorScreen(
                        onTap:
                            () => conntroller.getConnectionDetails(
                              userId: connection.otherUser?.id ?? '',
                            ),
                      );
                    case Status.completed:
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250.w,
                                      child: CustomText(
                                        top: 10.h,
                                        left: 0.w,
                                        text:
                                            conntroller
                                                .connectionDetails
                                                .value
                                                .name ??
                                            AppStrings.na.tr,
                                        fontSize: 24.w,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        // color: AppColors.primary,
                                      ),
                                    ),
                                    CustomText(
                                      top: 10.h,
                                      left: 10.w,
                                      text:
                                          '${connection.otherUser?.age ?? AppStrings.na.tr}',
                                      fontSize: 18.w,
                                      fontWeight: FontWeight.w400,
                                      // color: AppColors.primary,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      ReceiverInformation
                                      information = ReceiverInformation(
                                        receiverId: connection.otherUser?.id,
                                        receiverName:
                                            connection.otherUser?.name,
                                        receiverImage:
                                            connection.otherUser?.profileImage,
                                      );
                                      Get.toNamed(
                                        AppRoutes.messageScreen,
                                        arguments: information,
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.primary,
                                      maxRadius: 20.r,
                                      child: Icon(
                                        Icons.chat_bubble,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            CustomText(
                              text: AppStrings.aboutMeTitle.tr,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 15.h,
                            ),
                            CustomText(
                              text:
                                  conntroller.connectionDetails.value.bio ??
                                  AppStrings.na.tr,
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
                                  text: AppStrings.gender.tr,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                ModifyButton(
                                  color: AppColors.gray,
                                  title:
                                      conntroller
                                          .connectionDetails
                                          .value
                                          .gender,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: AppStrings.from.tr,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                ModifyButton(
                                  color: AppColors.gray,
                                  title:
                                      conntroller
                                          .connectionDetails
                                          .value
                                          .address ??
                                      AppStrings.na.tr,
                                ),
                              ],
                            ),
                            CustomText(
                              top: 20.h,
                              text: AppStrings.myInterests.tr,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 10.h,
                            ),
                            Row(
                              children: List.generate(
                                conntroller
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
                                        conntroller
                                            .connectionDetails
                                            .value
                                            .interests?[index] ??
                                        AppStrings.na.tr,
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
                              text: AppStrings.languages.tr,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 10.h,
                            ),
                            Row(
                              children: List.generate(
                                conntroller
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
                                        conntroller
                                            .connectionDetails
                                            .value
                                            .language?[index] ??
                                        AppStrings.na.tr,
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
                          ],
                        ),
                      );
                  }
                }),
              ],
            ),
            Positioned(
              top: 570.h,
              left: 100.w,
              child: Row(
                children: [
                  ConnectionsDetailsButton(
                    imageSrc: Icons.close,
                    color: AppColors.red,
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    height: 84.h,
                    width: 84.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.1,
                          ), // Adjust opacity as needed
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(
                            0,
                            4,
                          ), // horizontal, vertical shadow offset
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: CustomImage(
                        imageSrc: AppIcons.connection,
                        imageColor: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConnectionsDetailsButton extends StatelessWidget {
  const ConnectionsDetailsButton({super.key, this.imageSrc, this.color});

  final IconData? imageSrc;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      width: 84.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Adjust opacity as needed
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4), // horizontal, vertical shadow offset
          ),
        ],
      ),
      child: Icon(
        imageSrc ?? Icons.link,
        color: color ?? AppColors.primary,
        size: 40.w,
      ),
    );
  }
}

class ModifyButton extends StatelessWidget {
  const ModifyButton({super.key, this.title, this.color, this.width});

  final String? title;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          height: 30.h,
          width: width ?? 100.w,
          onTap: () {},
          title: title ?? AppStrings.na.tr,
          fontSize: 14.w,
          fontWeight: FontWeight.w700,
          fillColor: AppColors.white,
          isBorder: true,
          borderRadius: 100.r,

          textColor: color ?? AppColors.primary,
          borderWidth: 1,
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
