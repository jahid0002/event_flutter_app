// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:io';

import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomRoyelAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String? rightIcon;
  //final void Function()? leftOnTap;
  final void Function()? rightOnTap;
  final bool? leftIcon;
  final Color? iconColor;

  const CustomRoyelAppbar({
    super.key,
    this.titleName,
    // this.leftOnTap,
    this.rightIcon,
    this.rightOnTap,
    this.leftIcon = false,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 80,
      elevation: 0,
      foregroundColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            rightOnTap!();
          },
          icon:
              rightIcon == null
                  ? SizedBox()
                  : iconColor == null
                  ? CustomImage(
                    imageSrc: rightIcon!,
                    height: 25,
                    width: 25,
                    // imageColor: AppColors.white,
                  )
                  : CustomImage(
                    imageSrc: rightIcon!,
                    height: 25,
                    width: 25,
                    imageColor: iconColor,
                  ),
        ),
      ],
      backgroundColor: Colors.transparent,
      leading:
          leftIcon == true
              ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  height: 28.h,
                  width: 28.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      color: AppColors.primary,
                      size: 18,
                    ),
                  ),
                ),
              )
              : null,
      title: CustomText(
        text: titleName ?? "",
        fontSize: 20.w,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
    );
  }

  @override
  // TO DO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
