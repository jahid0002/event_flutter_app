import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 10.w, top: 70.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomImage(imageSrc: AppIcons.logo),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.notifications_outlined,
            //     color: AppColors.gray,
            //     size: 30.w,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
