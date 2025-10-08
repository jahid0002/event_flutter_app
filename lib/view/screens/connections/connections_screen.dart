import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:event_app/view/screens/connections/controller/connection_controller.dart';
import 'package:event_app/view/screens/connections/widget/connection_shimmer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_text/custom_text.dart';

class ConnectionsScreen extends StatelessWidget {
  ConnectionsScreen({super.key});

  final ConnectionController controller = Get.find<ConnectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
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
              text: AppStrings.connections.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),

      body: CustomRefreshIndicator(
        onRefresh: () async {
          await controller.getMyConnection();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Obx(() {
            switch (controller.connectionsStatus.value) {
              case Status.loading:
                return const ConnectionsShimmerGrid();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () => controller.getMyConnection(),
                );
              case Status.internetError:
                return GeneralErrorScreen(
                  onTap: () => controller.getMyConnection(),
                );
              case Status.completed:
                return controller.connections.isEmpty
                    ? Center(
                      child: CustomText(text: AppStrings.noConnectionYet.tr),
                    )
                    : GridView.builder(
                      padding: EdgeInsets.only(top: 20.h),
                      itemCount: controller.connections.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.w,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        final connection = controller.connections[index];
                        return ConnectionsCard(
                          chatButton: () {
                            ReceiverInformation information =
                                ReceiverInformation(
                                  receiverId: connection.otherUser?.id,
                                  receiverName: connection.otherUser?.name,
                                  receiverImage:
                                      connection.otherUser?.profileImage,
                                );
                            Get.toNamed(
                              AppRoutes.messageScreen,
                              arguments: information,
                            );
                          },
                          name: connection.otherUser?.name,
                          image: connection.otherUser?.profileImage,
                          location: connection.otherUser?.address,
                          age: connection.otherUser?.age?.toString(),
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.connectionsDetailsScreen,
                              arguments: connection,
                            );
                          },
                          onCancelConnection: () {
                            controller.removeConnection(
                              userId: connection.otherUser?.id ?? '',
                            );
                          },
                          onBlockUser: () {
                            controller.blockUser(
                              userID: connection.otherUser?.id ?? '',
                            );
                          },
                          onReportUser: () {
                            Get.toNamed(
                              AppRoutes.reportScreen,
                              arguments: connection.otherUser?.id,
                            );
                          },
                        );
                      },
                    );
            }
          }),
        ),
      ),

      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}

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
  final Color? color;

  const UserActionPopupMenu({
    super.key,
    this.onCancelConnection,
    this.onReportUser,
    this.onBlockUser,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuOptions>(
      color: AppColors.white,
      menuPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      icon: Icon(Icons.more_horiz, color: color ?? Colors.white),
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
                text: AppStrings.cancelConnection.tr,
              ),
            ),
            PopupMenuItem(
              value: _MenuOptions.reportUser,
              child: _MenuItem(
                icon: Icons.report_outlined,
                iconColor: Colors.orange,
                text: AppStrings.reportUser.tr,
              ),
            ),
            PopupMenuItem(
              value: _MenuOptions.blockUser,
              child: _MenuItem(
                icon: Icons.lock_outline,
                iconColor: Colors.green,
                text: AppStrings.blockUser.tr,
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
    required this.icon,
    required this.iconColor,
    required this.text,
  });

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
