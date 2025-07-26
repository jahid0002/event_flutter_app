import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Your AppColors file

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.softGray,
      highlightColor: AppColors.white_50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Container(
          height: 570.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.softGray,
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Age placeholders
                  Row(
                    children: [
                      Container(
                        width: 120.w,
                        height: 30.h,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 40.w,
                        height: 20.h,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // Address placeholder
                  Container(width: 200.w, height: 14.h, color: AppColors.white),
                  SizedBox(height: 25.h),

                  // Buttons placeholder
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 47.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          height: 47.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
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
      ),
    );
  }
}
