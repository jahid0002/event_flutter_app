// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionsDetailsScreen extends StatelessWidget {
  const ConnectionsDetailsScreen({super.key});

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
                  imageUrl: AppConstants.profileImage2,
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
                        // SizedBox(height: 10.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Slid(),
                        //     SlidBar(color: AppColors.gray),
                        //     SlidBar(color: AppColors.gray),
                        //     SlidBar(color: AppColors.gray),
                        //   ],
                        // ),
                        SizedBox(height: 20.h),

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
                            CircleAvatar(
                              backgroundColor: AppColors.primary,
                              maxRadius: 15.r,
                              child: Icon(
                                Icons.more_horiz,
                                color: AppColors.white,
                              ),
                            ),
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

                Padding(
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
                              CustomText(
                                top: 10.h,
                                left: 0.w,
                                text: 'Paulo',
                                fontSize: 38.w,
                                fontWeight: FontWeight.w600,
                                // color: AppColors.primary,
                              ),
                              CustomText(
                                top: 10.h,
                                left: 10.w,
                                text: '29',
                                fontSize: 24.w,
                                fontWeight: FontWeight.w400,
                                // color: AppColors.primary,
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.primary,
                            maxRadius: 20.r,
                            child: Icon(
                              Icons.chat_bubble,
                              color: AppColors.white,
                            ),
                          ),
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
                            'Figma ipsum component variant main layer. Style style opacity italic asset share arrange. Arrange figjam effect polygon clip component content connection polygon. Share ',
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
                          ModifyButton(color: AppColors.gray),
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
                            title: 'New York',
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
                        children: [
                          ModifyButton(
                            color: AppColors.primary,
                            title: '‍Workout 🏃',
                            width: 120.w,
                          ),
                          SizedBox(width: 10.w),
                          ModifyButton(
                            title: 'Casual 😄',
                            color: AppColors.primary,
                            width: 120.w,
                          ),
                        ],
                      ),
                      CustomText(
                        top: 20.h,
                        text: 'Languages',
                        fontSize: 16.w,
                        fontWeight: FontWeight.w600,
                        bottom: 10.h,
                      ),
                      Row(
                        children: [
                          ModifyButton(
                            color: AppColors.gray,
                            title: 'Spanish',
                            width: 120.w,
                          ),
                          SizedBox(width: 10.w),
                          ModifyButton(
                            title: 'Italian',
                            color: AppColors.gray,
                            width: 120.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
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
    return CustomButton(
      height: 30.h,
      width: width ?? 100.w,
      onTap: () {},
      title: title ?? 'Woman',
      fontSize: 14.w,
      fontWeight: FontWeight.w700,
      fillColor: AppColors.white,
      isBorder: true,
      borderRadius: 100.r,

      textColor: color ?? AppColors.primary,
      borderWidth: 1,
    );
  }
}
