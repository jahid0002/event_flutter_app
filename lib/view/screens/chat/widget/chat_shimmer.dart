// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/app_colors/app_colors.dart';

class ChatShimmer extends StatelessWidget {
  const ChatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Shimmer.fromColors(
            baseColor: AppColors.softGray.withOpacity(0.3),
            highlightColor: AppColors.white,
            child: Row(
              children: [
                // Profile Image
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 12.w),

                // Name and message column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 12.h,
                        width: 100.w,
                        color: Colors.white,
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        height: 10.h,
                        width: 150.w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 12.w),

                // Time and badge
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(height: 10.h, width: 40.w, color: Colors.white),
                    SizedBox(height: 6.h),
                    Container(
                      height: 16.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
