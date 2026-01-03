import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/connections/connections_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionsCard extends StatelessWidget {
  const ConnectionsCard({
    super.key,
    this.onTap,
    this.name,
    this.image,
    this.location,
    this.age,
    this.chatButton,
    this.onCancelConnection,
    this.onReportUser,
    this.onBlockUser,
  });

  final VoidCallback? onTap;
  final String? name;
  final String? image;
  final String? location;
  final String? age;
  final VoidCallback? chatButton;
  final void Function()? onCancelConnection;
  final void Function()? onReportUser;
  final void Function()? onBlockUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CustomNetworkImage(
            imageUrl: ImageHandler.imagesHandle(image),
            height: 330,
            width: MediaQuery.sizeOf(context).width / 2.1,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          left: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.close, color: AppColors.white),
                  SizedBox(),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      //  borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.circle,
                    ),

                    child: Center(
                      child: UserActionPopupMenu(
                        onCancelConnection: onCancelConnection,
                        onReportUser: onReportUser,
                        onBlockUser: onBlockUser,
                      ),
                    ),

                    // Icon(Icons.more_horiz, color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 6,
          right: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110.w,
                          child: CustomText(
                            text: name ?? "N/A",
                            fontSize: 20.w,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            right: 10,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        CustomText(
                          text: age ?? "00",
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.white,
                          size: 16,
                        ),
                        SizedBox(
                          width: 110.w,
                          child: CustomText(
                            left: 5,
                            text: location ?? "N/A",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: chatButton,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  maxRadius: 15.r,
                  child: CustomImage(imageSrc: AppIcons.chat),

                  //  Icon(
                  //   Icons.chat_bubble_outline,
                  //   color: AppColors.white,
                  //   size: 19.w,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
