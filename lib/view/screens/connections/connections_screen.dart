import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_text/custom_text.dart';

class ConnectionsScreen extends StatelessWidget {
  const ConnectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 20),
            const Spacer(),
            CustomImage(
              imageSrc: AppIcons.connection,
              imageColor: AppColors.primary,
            ),
            const SizedBox(width: 6),
            CustomText(
              text: "Connections",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return ConnectionsCard(
              onTap: () {
                Get.toNamed(AppRoutes.connectionsDetailsScreen);
              },
            );
          },
        ),
      ),

      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}

class ConnectionsCard extends StatelessWidget {
  const ConnectionsCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CustomNetworkImage(
            imageUrl: AppConstants.girlsPhoto,
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.close, color: AppColors.white),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      //  borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.circle,
                    ),

                    child: Center(child: UserActionPopupMenu()),

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
              Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "Paula",
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        right: 10,
                      ),
                      CustomText(
                        text: "29",
                        fontSize: 14.w,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                        size: 16,
                      ),
                      CustomText(
                        left: 5,
                        text: "New York",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ],
              ),

              CircleAvatar(
                backgroundColor: AppColors.primary,
                maxRadius: 15.r,
                child: CustomImage(imageSrc: AppIcons.chat),

                //  Icon(
                //   Icons.chat_bubble_outline,
                //   color: AppColors.white,
                //   size: 19.w,
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//       body: Column(
//         children: [
//           Stack(
//             children: [
//               CustomNetworkImage(
//                 imageUrl: AppConstants.girlsPhoto,
//                 height: 230,
//                 width: MediaQuery.sizeOf(context).width / 2.1,
//                 borderRadius: BorderRadius.circular(20.r),
//               ),
//               Positioned(
//                 right: 10,
//                 left: 0,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.close, color: AppColors.white),
//                         ),
//                         CircleAvatar(
//                           backgroundColor: AppColors.primary,
//                           maxRadius: 16.r,
//                           child: Icon(Icons.more_horiz, color: AppColors.white),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 left: 6,
//                 right: 6,
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             CustomText(
//                               text: "Paula",
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.white,
//                               right: 10,
//                             ),
//                             CustomText(
//                               text: "29",
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.white,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.location_on_outlined,
//                               color: AppColors.white,
//                               size: 16,
//                             ),
//                             CustomText(
//                               text: "New York",
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.white,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),

//       bottomNavigationBar: NavBar(currentIndex: 1),

//     );
////  }
// }

class UserActionPopupMenu extends StatelessWidget {
  final void Function()? onCancelConnection;
  final void Function()? onReportUser;
  final void Function()? onBlockUser;

  const UserActionPopupMenu({
    super.key,
    this.onCancelConnection,
    this.onReportUser,
    this.onBlockUser,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuOptions>(
      color: AppColors.white,
      menuPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      icon: Icon(Icons.more_horiz, color: Colors.white),
      onSelected: (value) {
        switch (value) {
          case _MenuOptions.cancelConnection:
            if (onCancelConnection != null) onCancelConnection!();
            break;
          case _MenuOptions.reportUser:
            if (onReportUser != null) onReportUser!();
            break;
          case _MenuOptions.blockUser:
            if (onBlockUser != null) onBlockUser!();
            break;
        }
      },
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: _MenuOptions.cancelConnection,
              child: _MenuItem(
                icon: Icons.person_off_outlined,
                iconColor: Colors.green,
                text: "Cancel Connection",
              ),
            ),
            PopupMenuItem(
              value: _MenuOptions.reportUser,
              child: _MenuItem(
                icon: Icons.report_outlined,
                iconColor: Colors.orange,
                text: "Report User",
              ),
            ),
            PopupMenuItem(
              value: _MenuOptions.blockUser,
              child: _MenuItem(
                icon: Icons.lock_outline,
                iconColor: Colors.green,
                text: "Block User",
              ),
            ),
          ],
    );
  }
}

enum _MenuOptions { cancelConnection, reportUser, blockUser }

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const _MenuItem({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 10),
        Text(text, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
