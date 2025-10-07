import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/chat/model/conversation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    this.onTap,
    this.name,
    this.imageUrl,
    this.time,
    this.lastMessage,
    this.unseenMessageCount = 0,
    this.isNew = false,
  });

  final VoidCallback? onTap;
  final String? name;
  final String? imageUrl;
  final String? time;
  final String? lastMessage;
  final int unseenMessageCount;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            color: AppColors.white,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile + Message Column
                  Row(
                    children: [
                      CustomNetworkImage(
                        imageUrl: ImageHandler.imagesHandle(imageUrl),
                        height: 52.h,
                        width: 52.w,
                        boxShape: BoxShape.circle,
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: name ?? "N/A",
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              if (isNew) ...[
                                SizedBox(width: 6.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: CustomText(
                                    text: "new!",
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          CustomText(
                            text: lastMessage ?? "",
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Time + Unseen messages
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: time ?? "",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      if (unseenMessageCount > 0)
                        Container(
                          margin: EdgeInsets.only(top: 4.h),
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: CustomText(
                            text: unseenMessageCount.toString(),
                            fontSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}

extension ConversationModelX on ConversationModel {
  bool isNew(String currentUserId) {
    // যদি unseenMsg > 0 হয়, মানে unread message আছে
    if ((unseenMsg ?? 0) > 0) return true;

    // যদি শেষ মেসেজটা দেখা না হয় এবং অন্য কেউ পাঠায়
    final msg = lastMessage;
    if (msg != null && (msg.seen == false || msg.seen == null)) {
      if (msg.msgByUserId != currentUserId) {
        return true;
      }
    }

    return false;
  }
}

// import 'package:event_app/helper/imges_handler/image_handler.dart';
// import 'package:event_app/utils/app_colors/app_colors.dart';
// import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
// import 'package:event_app/view/components/custom_text/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ChatCard extends StatelessWidget {
//   const ChatCard({
//     super.key,
//     this.onTap,
//     this.name,
//     this.imageUrl,
//     this.time,
//     this.lustMessage,
//     this.unseenMessageCount,
//   });

//   final VoidCallback? onTap;
//   final String? name;
//   final String? imageUrl;
//   final String? time;
//   final String? lustMessage;
//   final String? unseenMessageCount;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTap!();
//       },
//       child: Column(
//         children: [
//           Card(
//             color: AppColors.white,
//             elevation: 0,

//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CustomNetworkImage(
//                         imageUrl: ImageHandler.imagesHandle(imageUrl),
//                         height: 52.h,
//                         width: 52.w,
//                         boxShape: BoxShape.circle,
//                       ),
//                       SizedBox(width: 15.w),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomText(
//                             text: name ?? "N/A",
//                             fontSize: 17.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           CustomText(text: lustMessage ?? "", fontSize: 12.sp),
//                         ],
//                       ),
//                     ],
//                   ),

//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       CustomText(
//                         text: time ?? "",
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       CustomText(
//                         text: unseenMessageCount ?? "0",
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.primary,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 5.h),
//         ],
//       ),
//     );
//   }
// }
