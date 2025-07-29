import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ConnectionsShimmerGrid extends StatelessWidget {
  const ConnectionsShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 20.h),
      itemCount: 6, // shimmer card count
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.w,
        crossAxisSpacing: 8.w,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 310.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                // Top right and left icons
                Positioned(
                  top: 10,
                  right: 10,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.white,
                        ),
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom name, age, location, chat
                Positioned(
                  bottom: 10,
                  left: 6.w,
                  right: 6.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 70.w,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  height: 15.h,
                                  width: 30.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 5.w),
                                Container(
                                  height: 14.h,
                                  width: 60.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(radius: 15.r, backgroundColor: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
