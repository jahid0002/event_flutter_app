// ignore_for_file: deprecated_member_use

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Chat"),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  ChatButton(
                    title: "Chats",
                    isSelected: controller.chatType.value == ChatType.chat,
                    onTap: () {
                      controller.chatType.value = ChatType.chat;
                    },
                  ),
                  const Spacer(),
                  ChatButton(
                    title: "Notifications",
                    isSelected:
                        controller.chatType.value == ChatType.notification,
                    onTap: () {
                      controller.chatType.value = ChatType.notification;
                    },
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              if (controller.chatType.value == ChatType.chat) ...[
                CustomTextField(
                  isDens: true,
                  cursorColor: AppColors.black,
                  fillColor: AppColors.white,
                  hintText: 'Search Here...',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,

                    color: AppColors.gray.withOpacity(.8),
                  ),
                ),
                SizedBox(height: 20.h),
                ChatCard(),
                ChatCard(),
                ChatCard(),
              ],

              if (controller.chatType.value == ChatType.notification) ...[
                SizedBox(height: 20.h),
                // ChatCard(),
                // ChatCard(),
                // ChatCard(),
                NotificationsCard(),
                NotificationsCard(),
                NotificationsCard(),
              ],
            ],
          ),
        );
      }),

      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}

class ChatButton extends StatelessWidget {
  const ChatButton({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.title,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      fillColor:
          isSelected ? AppColors.primary : AppColors.gray.withOpacity(.5),
      onTap: onTap,
      height: 40.h,
      width: 174.w,
      title: title ?? '',
      borderRadius: 10.r,
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.messageScreen);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomNetworkImage(
                    imageUrl: AppConstants.girlsPhoto,
                    height: 52.h,
                    width: 52.w,
                    boxShape: BoxShape.circle,
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Gloria",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(text: "How are you?", fontSize: 12.sp),
                    ],
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: "12:00 PM",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "1",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomNetworkImage(
                  imageUrl: AppConstants.girlsPhoto,
                  height: 52.h,
                  width: 52.w,
                  boxShape: BoxShape.circle,
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Marta Lopez",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(text: "Pending Connection", fontSize: 12.sp),
                  ],
                ),
              ],
            ),

            CustomButton(
              onTap: () {},
              height: 40.h,
              width: 100.w,
              title: "Accept",
              borderRadius: 100.r,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Divider(),
        SizedBox(height: 10.h),
      ],
    );
  }
}

enum ChatType { chat, notification }
