// ignore_for_file: deprecated_member_use

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/helper/shared_prefe/shared_prefe.dart';
import 'package:event_app/helper/time_converter/date_converter.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:event_app/view/screens/chat/widget/chat_card.dart';
import 'package:event_app/view/screens/chat/widget/chat_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController controller = Get.find<ChatController>();

  String? userID;

  @override
  void initState() {
    super.initState();

    // FIX #1: Defer side-effects to after first frame so they cannot
    // trigger rebuilds during the initial build phase.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserId();
      controller.getRealTimeMessage();
      controller.getAllConversation();
      controller.getAllNotification();
    });
  }

  Future<void> _loadUserId() async {
    final id = await SharePrefsHelper.getString(AppConstants.userId);
    if (!mounted) return;
    setState(() {
      userID = id;
    });
    debugPrint('User ID: $userID');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.chat.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Tabs (Chats / Notifications)
            Obx(() {
              return Row(
                children: [
                  ChatButton(
                    unreadItem: controller.unreadMessageCount.value,
                    title: AppStrings.chats.tr,
                    isSelected: controller.chatType.value == ChatType.chat,
                    onTap: () {
                      controller.chatType.value = ChatType.chat;
                    },
                  ),
                  const Spacer(),
                  ChatButton(
                    unreadItem: controller.notificationCount.value,
                    title: AppStrings.notifications.tr,
                    isSelected:
                        controller.chatType.value == ChatType.notification,
                    onTap: () {
                      controller.chatType.value = ChatType.notification;
                      controller.getAllNotification();
                    },
                  ),
                ],
              );
            }),

            SizedBox(height: 10.h),

            // ======================================= Chat Section =======================================
            Obx(() {
              switch (controller.conversationStatus.value) {
                case Status.loading:
                  return SizedBox(height: 520.h, child: const ChatShimmer());
                case Status.error:
                case Status.internetError:
                  return GeneralErrorScreen(
                    onTap: () => controller.getAllConversation(),
                  );
                case Status.completed:
                  return CustomRefreshIndicator(
                    onRefresh: () => controller.getAllConversation(),
                    child: Column(
                      children: [
                        if (controller.chatType.value == ChatType.chat) ...[
                          CustomTextField(
                            textEditingController:
                                controller.searchController.value,
                            isDens: true,
                            cursorColor: AppColors.black,
                            fillColor: AppColors.white,
                            hintText: AppStrings.searchHere.tr,
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.gray.withOpacity(.8),
                            ),
                            onChanged: (value) {
                              // This triggers data fetch, which is fine (user event).
                              controller.getAllConversation();
                            },
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 520.h,

                            // FIX #2: Do NOT mutate reactive lists inside Obx.
                            // Make a copy first, then sort the copy.
                            child: Obx(() {
                              if (controller.conversationList.isEmpty) {
                                return CustomText(
                                  text: AppStrings.noConversation.tr,
                                  top: 200.h,
                                );
                              }

                              // Safe: copy before sorting to avoid modifying RxList in-place
                              final sortedList = List.of(
                                controller.conversationList,
                              )..sort((a, b) {
                                final aTime =
                                    DateTime.tryParse(
                                      a.lastMessage?.createdAt ?? '',
                                    ) ??
                                    DateTime.fromMillisecondsSinceEpoch(0);
                                final bTime =
                                    DateTime.tryParse(
                                      b.lastMessage?.createdAt ?? '',
                                    ) ??
                                    DateTime.fromMillisecondsSinceEpoch(0);
                                return bTime.compareTo(aTime);
                              });

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: sortedList.length,
                                itemBuilder: (context, index) {
                                  final item = sortedList[index];
                                  return ChatCard(
                                    isNew: item.isNew(userID ?? ''),
                                    name: item.userData?.name,
                                    imageUrl: item.userData?.profileImage,
                                    lastMessage: item.lastMessage?.text,
                                    time: DateConverter.formatTimeAgo(
                                      item.lastMessage?.createdAt ?? '',
                                    ),
                                    unseenMessageCount: item.unseenMsg ?? 0,
                                    onTap: () {
                                      final info = ReceiverInformation(
                                        blockByMe: item.isBlockedByMe,
                                        blockByOther: item.isBlockedMe,
                                        receiverId: item.userData?.id,
                                        receiverName: item.userData?.name,
                                        receiverImage:
                                            item.userData?.profileImage,
                                        conversationID:
                                            item.lastMessage?.conversationId,
                                      );

                                      Get.toNamed(
                                        AppRoutes.messageScreen,
                                        arguments: info,
                                      );
                                    },
                                  );
                                },
                              );
                            }),
                          ),
                        ],
                      ],
                    ),
                  );
              }
            }),

            // =================================== Notification Section ===================================
            Obx(() {
              return CustomRefreshIndicator(
                onRefresh: () => controller.getAllNotification(),
                child: Column(
                  children: [
                    if (controller.chatType.value == ChatType.notification) ...[
                      SizedBox(height: 20.h),
                      controller.notificationList.isEmpty
                          ? Center(
                            child: CustomText(
                              text: AppStrings.noNotification.tr,
                              top: 200.h,
                            ),
                          )
                          : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: controller.notificationList.length,
                            itemBuilder: (context, index) {
                              switch (controller.notificationStatus.value) {
                                case Status.loading:
                                  return const CustomLoader();
                                case Status.error:
                                case Status.internetError:
                                  return GeneralErrorScreen(
                                    onTap:
                                        () => controller.getAllNotification(),
                                  );
                                case Status.completed:
                                  final notification =
                                      controller.notificationList[index];
                                  return NotificationsCard(
                                    onview: () {
                                      Get.toNamed(
                                        AppRoutes.otherUserDetailsScreen,
                                        arguments: [
                                          notification.sender?.id ?? '',
                                          false,
                                        ],
                                      );
                                    },
                                    name: notification.sender?.name,
                                    imageUrl: notification.sender?.profileImage,
                                    onTap: () {
                                      controller.acceptConnectionRequest(
                                        userID: notification.id ?? '',
                                        index: index,
                                      );
                                    },
                                    isLoading:
                                        index ==
                                            controller.loadingIndex.value &&
                                        controller.isAccepted.value,
                                  );
                              }
                            },
                          ),
                    ],
                  ],
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(currentIndex: 2),
    );
  }
}

class ChatButton extends StatelessWidget {
  const ChatButton({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.title,
    this.unreadItem = 0,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final String? title;
  final int? unreadItem;

  @override
  Widget build(BuildContext context) {
    final button = CustomButton(
      fillColor:
          isSelected ? AppColors.primary : AppColors.gray.withOpacity(.5),
      onTap: onTap,
      height: 40.h,
      width: 174.w,
      title: title ?? '',
      borderRadius: 10.r,
    );

    if (unreadItem != null && unreadItem! > 0) {
      return Badge.count(count: unreadItem!, child: button);
    }

    return button;
  }
}

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({
    super.key,
    this.name,
    this.imageUrl,
    this.onTap,
    this.isLoading = false,
    this.onview,
  });

  final String? name;
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool? isLoading;
  final VoidCallback? onview;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onview,
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        CustomText(
                          text: name ?? "N/A",
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: AppStrings.pendingConnection.tr,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                isLoading == true
                    ? const CustomLoader()
                    : CustomButton(
                      onTap: onTap ?? () {},
                      height: 40.h,
                      width: 100.w,
                      title: AppStrings.accept.tr,
                      borderRadius: 100.r,
                    ),
              ],
            ),
            SizedBox(height: 10.h),
            const Divider(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

enum ChatType { chat, notification }

// // ignore_for_file: deprecated_member_use

// import 'package:event_app/core/routes/app_routes.dart';
// import 'package:event_app/helper/imges_handler/image_handler.dart';
// import 'package:event_app/helper/shared_prefe/shared_prefe.dart';
// import 'package:event_app/helper/time_converter/date_converter.dart';
// import 'package:event_app/utils/app_colors/app_colors.dart';
// import 'package:event_app/utils/app_const/app_const.dart';
// import 'package:event_app/utils/app_strings/app_strings.dart';
// import 'package:event_app/view/components/custom_app_bar/custom_app_bar.dart';
// import 'package:event_app/view/components/custom_button/custom_button.dart';
// import 'package:event_app/view/components/custom_loader/custom_loader.dart';
// import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
// import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
// import 'package:event_app/view/components/custom_refresh_indicator/custom_refresh_indicator.dart';
// import 'package:event_app/view/components/custom_text/custom_text.dart';
// import 'package:event_app/view/components/custom_text_field/custom_text_field.dart';
// import 'package:event_app/view/components/general_error.dart';
// import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
// import 'package:event_app/view/screens/chat/widget/chat_card.dart';
// import 'package:event_app/view/screens/chat/widget/chat_shimmer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final ChatController controller = Get.find<ChatController>();

//   @override
//   void initState() {
//     getUserID();
//     // TO DO: implement initState.
//     controller.getRealTimeMessage();
//     controller.getAllConversation();
//     controller.getAllNotification();
//     super.initState();
//   }

//   // String? userID;

//   getUserID() async {
//     controller.userID.value = await SharePrefsHelper.getString(
//       AppConstants.userId,
//     );

//     // if (mounted) {
//     //   setState(() {});
//     // }
//     // setState(() {});

//     debugPrint('User ID: $controller.userID.value');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: AppStrings.chat.tr),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Obx(() {
//               return Row(
//                 children: [
//                   ChatButton(
//                     unreadItem: controller.unreadMessageCount.value,
//                     title: AppStrings.chats.tr,
//                     isSelected: controller.chatType.value == ChatType.chat,
//                     onTap: () {
//                       controller.chatType.value = ChatType.chat;
//                     },
//                   ),
//                   const Spacer(),
//                   ChatButton(
//                     unreadItem: controller.notificationCount.value,
//                     title: AppStrings.notifications.tr,
//                     isSelected:
//                         controller.chatType.value == ChatType.notification,
//                     onTap: () {
//                       controller.chatType.value = ChatType.notification;
//                       controller.getAllNotification();
//                     },
//                   ),
//                 ],
//               );
//             }),

//             SizedBox(height: 10.h),

//             //======================================= >> Chat Section ===============================>>
//             Obx(() {
//               switch (controller.conversationStatus.value) {
//                 case Status.loading:
//                   return SizedBox(height: 520.h, child: ChatShimmer());
//                 case Status.error:
//                   return GeneralErrorScreen(
//                     onTap: () => controller.getAllConversation(),
//                   );
//                 case Status.internetError:
//                   return GeneralErrorScreen(
//                     onTap: () => controller.getAllConversation(),
//                   );
//                 case Status.completed:
//                   return CustomRefreshIndicator(
//                     onRefresh: () {
//                       return controller.getAllConversation();
//                     },
//                     child: Column(
//                       children: [
//                         if (controller.chatType.value == ChatType.chat) ...[
//                           CustomTextField(
//                             textEditingController:
//                                 controller.searchController.value,
//                             isDens: true,
//                             cursorColor: AppColors.black,
//                             fillColor: AppColors.white,
//                             hintText: AppStrings.searchHere.tr,
//                             hintStyle: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12,

//                               color: AppColors.gray.withOpacity(.8),
//                             ),
//                             onChanged: (value) {
//                               controller.getAllConversation();
//                             },
//                           ),
//                           SizedBox(height: 10.h),
//                           SizedBox(
//                             height: 520.h,
//                             child: Obx(() {
//                               if (controller.conversationList.isEmpty) {
//                                 return CustomText(
//                                   text: AppStrings.noConversation.tr,
//                                   top: 200.h,
//                                 );
//                               }

//                               //  Sort newest first
//                               final sortedList =
//                                   controller.conversationList..sort((a, b) {
//                                     final aTime =
//                                         DateTime.tryParse(
//                                           a.lastMessage?.createdAt ?? '',
//                                         ) ??
//                                         DateTime(1970);
//                                     final bTime =
//                                         DateTime.tryParse(
//                                           b.lastMessage?.createdAt ?? '',
//                                         ) ??
//                                         DateTime(1970);
//                                     return bTime.compareTo(
//                                       aTime,
//                                     ); // descending order
//                                   });

//                               return ListView.builder(
//                                 padding: EdgeInsets.zero,
//                                 shrinkWrap: true,
//                                 itemCount: sortedList.length,
//                                 itemBuilder: (context, index) {
//                                   final item = sortedList[index];
//                                   return ChatCard(
//                                     isNew: item.isNew(controller.userID.value),
//                                     name: item.userData?.name,
//                                     imageUrl: item.userData?.profileImage,
//                                     lastMessage: item.lastMessage?.text,
//                                     time: DateConverter.formatTimeAgo(
//                                       item.lastMessage?.createdAt ?? '',
//                                     ),
//                                     unseenMessageCount: item.unseenMsg ?? 0,
//                                     onTap: () {
//                                       final info = ReceiverInformation(
//                                         blockByMe: item.isBlockedByMe,
//                                         blockByOther: item.isBlockedMe,
//                                         receiverId: item.userData?.id,
//                                         receiverName: item.userData?.name,
//                                         receiverImage:
//                                             item.userData?.profileImage,
//                                         conversationID:
//                                             item.lastMessage?.conversationId,
//                                       );

//                                       Get.toNamed(
//                                         AppRoutes.messageScreen,
//                                         arguments: info,
//                                       );
//                                     },
//                                   );
//                                 },
//                               );
//                             }),
//                           ),

//                           // SizedBox(
//                           //   height: 520.h,
//                           //   child:
//                           //       controller.conversationList.isNotEmpty
//                           //           ? ListView.builder(
//                           //             padding: EdgeInsets.zero,
//                           //             shrinkWrap: true,
//                           //             itemCount:
//                           //                 controller.conversationList.length,
//                           //             itemBuilder: (context, index) {
//                           //               final item =
//                           //                   controller.conversationList[index];
//                           //               return ChatCard(
//                           //                 isNew: item.isNew(userID ?? ''),
//                           //                 name: item.userData?.name,
//                           //                 imageUrl: item.userData?.profileImage,
//                           //                 lastMessage: item.lastMessage?.text,
//                           //                 time: DateConverter.formatTimeAgo(
//                           //                   item.lastMessage?.createdAt ?? '',
//                           //                 ),
//                           //                 unseenMessageCount:
//                           //                     item.unseenMsg ?? 0,
//                           //                 onTap: () {
//                           //                   final ReceiverInformation
//                           //                   information = ReceiverInformation(
//                           //                     blockByMe: item.isBlockedByMe,
//                           //                     blockByOther: item.isBlockedMe,
//                           //                     receiverId: item.userData?.id,
//                           //                     receiverName: item.userData?.name,
//                           //                     receiverImage:
//                           //                         item.userData?.profileImage,
//                           //                     conversationID:
//                           //                         item
//                           //                             .lastMessage
//                           //                             ?.conversationId,
//                           //                   );

//                           //                   Get.toNamed(
//                           //                     AppRoutes.messageScreen,
//                           //                     arguments: information,
//                           //                   );
//                           //                 },
//                           //               );
//                           //             },
//                           //           )
//                           //           : CustomText(
//                           //             text: AppStrings.noConversation.tr,
//                           //             top: 200.h,
//                           //           ),
//                           // ),
//                         ],
//                       ],
//                     ),
//                   );
//               }
//             }),

//             /// ======================================= Notification Section =================================
//             Obx(() {
//               return CustomRefreshIndicator(
//                 onRefresh: () {
//                   return controller.getAllNotification();
//                 },
//                 child: Column(
//                   children: [
//                     if (controller.chatType.value == ChatType.notification) ...[
//                       SizedBox(height: 20.h),

//                       controller.notificationList.isEmpty
//                           ? Center(
//                             child: CustomText(
//                               text: AppStrings.noNotification.tr,
//                               top: 200.h,
//                             ),
//                           )
//                           : ListView.builder(
//                             padding: EdgeInsets.zero,
//                             shrinkWrap: true,
//                             itemCount:
//                                 controller.notificationList.isEmpty
//                                     ? 0
//                                     : controller.notificationList.length,
//                             itemBuilder: (contex, index) {
//                               final notification =
//                                   controller.notificationList[index];

//                               switch (controller.notificationStatus.value) {
//                                 case Status.loading:
//                                   return CustomLoader();
//                                 case Status.error:
//                                   return GeneralErrorScreen(
//                                     onTap:
//                                         () => controller.getAllNotification(),
//                                   );
//                                 case Status.internetError:
//                                   return GeneralErrorScreen(
//                                     onTap:
//                                         () => controller.getAllNotification(),
//                                   );
//                                 case Status.completed:
//                                   return NotificationsCard(
//                                     name: notification.sender?.name,
//                                     imageUrl: notification.sender?.profileImage,
//                                     onTap: () {
//                                       controller.acceptConnectionRequest(
//                                         userID: notification.id ?? '',
//                                         index: index,
//                                       );
//                                     },
//                                     isLoading:
//                                         index ==
//                                             controller.loadingIndex.value &&
//                                         controller.isAccepted.value,
//                                   );
//                               }
//                             },
//                           ),
//                     ],
//                   ],
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),

//       bottomNavigationBar: NavBar(currentIndex: 2),
//     );
//   }
// }

// class ChatButton extends StatelessWidget {
//   const ChatButton({
//     super.key,
//     required this.onTap,
//     required this.isSelected,
//     this.title,
//     this.unreadItem = 0,
//   });

//   final VoidCallback onTap;
//   final bool isSelected;
//   final String? title;
//   final int? unreadItem;

//   @override
//   Widget build(BuildContext context) {
//     final button = CustomButton(
//       fillColor:
//           isSelected ? AppColors.primary : AppColors.gray.withOpacity(.5),
//       onTap: onTap,
//       height: 40.h,
//       width: 174.w,
//       title: title ?? '',
//       borderRadius: 10.r,
//     );

//     // show badge only when unreadItem > 0
//     if (unreadItem != null && unreadItem! > 0) {
//       return Badge.count(count: unreadItem!, child: button);
//     }

//     return button;
//   }
// }

// class NotificationsCard extends StatelessWidget {
//   const NotificationsCard({
//     super.key,
//     this.name,
//     this.imageUrl,
//     this.onTap,
//     this.isLoading = false,
//   });

//   final String? name;
//   final String? imageUrl;
//   final VoidCallback? onTap;
//   final bool? isLoading;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 CustomNetworkImage(
//                   imageUrl: ImageHandler.imagesHandle(imageUrl),
//                   height: 52.h,
//                   width: 52.w,
//                   boxShape: BoxShape.circle,
//                 ),
//                 SizedBox(width: 15.w),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: name ?? "N/A",
//                       fontSize: 17.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     CustomText(
//                       text: AppStrings.pendingConnection.tr,
//                       fontSize: 12.sp,
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             isLoading!
//                 ? CustomLoader()
//                 : CustomButton(
//                   onTap: onTap ?? () {},
//                   height: 40.h,
//                   width: 100.w,
//                   title: AppStrings.accept.tr,
//                   borderRadius: 100.r,
//                 ),
//           ],
//         ),
//         SizedBox(height: 10.h),
//         Divider(),
//         SizedBox(height: 10.h),
//       ],
//     );
//   }
// }

// enum ChatType { chat, notification }
