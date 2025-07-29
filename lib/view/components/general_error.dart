import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class GeneralErrorScreen extends StatelessWidget {
//   const GeneralErrorScreen({super.key, required this.onTap});
//   final Function() onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff364153),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // const CustomImage(imageSrc: AppImages.noInternetImage),
//             SizedBox(
//               height: 20.h,
//             ),
//             Text(
//               "Something wrong",
//               style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 24.sp,
//                   color: Colors.white),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             ElevatedButton(
//               onPressed: onTap,
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.red,
//                   minimumSize: Size(Get.width / 1.6, 40.h),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(32.r),
//                     bottomLeft: Radius.circular(32.r),
//                   ))),
//               child: const Text(
//                 "Try Again",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:get/get.dart';

class GeneralErrorScreen extends StatelessWidget {
  const GeneralErrorScreen({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            // Circle with emoji-style icon
            Container(
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7FA), // light blue
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.wifi_off_rounded,
                  color: Color(0xFF0097A7),
                  size: 50,
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              "Oops! Something went wrong",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 12.h),

            Text(
              "Please check your connection\nor try again later.",
              style: TextStyle(fontSize: 16.sp, color: const Color(0xFF7F8C8D)),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 32.h),

            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27AE60), // Calm green
                padding: EdgeInsets.symmetric(vertical: 12.h),
                minimumSize: Size(Get.width / 1.6, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                elevation: 2,
              ),
              child: Text(
                "Try Again",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
