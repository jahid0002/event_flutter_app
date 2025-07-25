// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'dart:io';

import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/helper/time_converter/date_converter.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final ReceiverInformation receiverInformation = Get.arguments;

  final ChatController controller = Get.find<ChatController>();
  final List<_ChatMessage> messages = [
    _ChatMessage(text: "Hi Mia!", isSent: true, time: "17:00", isRead: true),
    _ChatMessage(
      text: "How do you know Utsav Gandhi",
      isSent: true,
      time: "17:00",
      isRead: true,
    ),
    _ChatMessage(text: "Hello Sam!", isSent: false, time: "17:01"),
  ];

  // final TextEditingController _controller = TextEditingController();

  // void _sendMessage() {
  //   if (_controller.text.trim().isEmpty) return;
  //   setState(() {
  //     messages.add(
  //       _ChatMessage(
  //         text: _controller.text.trim(),
  //         isSent: true,
  //         time: TimeOfDay.now().format(context),
  //         isRead: false,
  //       ),
  //     );
  //     _controller.clear();
  //   });
  // }.

  @override
  void initState() {
    // TO DO: implement initState
    controller.getAllMessage(otherUserID: receiverInformation.receiverId ?? '');
    controller.getRealTimeMessage(
      otherUserID: '${receiverInformation.receiverId}',
    );
    controller.seenResponse(
      otherUserID: receiverInformation.receiverId ?? '',
      conversationID: receiverInformation.conversationID ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(receiverInformation.receiverId);
    return Scaffold(
      appBar: CustomAppBar(title: receiverInformation.receiverName ?? 'N/A'),
      body: Column(
        children: [
          //==================== Chat Messages List ====================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Obx(() {
                switch (controller.messageStatus.value) {
                  case Status.loading:
                    return CustomLoader();
                  case Status.error:
                    return GeneralErrorScreen(
                      onTap:
                          () => controller.getAllMessage(
                            otherUserID: receiverInformation.receiverId ?? '',
                          ),
                    );
                  case Status.internetError:
                    return GeneralErrorScreen(
                      onTap:
                          () => controller.getAllMessage(
                            otherUserID: receiverInformation.receiverId ?? '',
                          ),
                    );
                  case Status.completed:
                    return ListView.builder(
                      //   controller: controller.scrollController.value,
                      physics: AlwaysScrollableScrollPhysics(),
                      reverse: true,
                      itemCount: controller.messageList.length,
                      itemBuilder: (context, index) {
                        // final data = controller.messageList[index];

                        final message = controller.messageList[index];

                        //   final reverseMessageList = messages.reversed.toList();
                        return CustomInboxMessage(
                          profileImage: receiverInformation.receiverImage,
                          isMe:
                              receiverInformation.receiverId ==
                                      message.msgByUserId?.id
                                  ? false
                                  : true,
                          message: message.text ?? '',
                          messageTime: DateConverter.formatTimeAgo(
                            message.createdAt ?? '',
                          ),

                          type: message.messageType == null ? 'text' : 'manual',
                          imageUrls: [],
                        );
                      },
                    );
                }
              }),
            ),
          ),

          //==================== Message Input Field ====================
          Padding(
            padding: EdgeInsets.only(bottom: 0, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Show selected images preview
                // if (controller.selectedImages.isNotEmpty &&
                //     controller.showImagesSection.value) ...[
                //   Padding(
                //     padding: EdgeInsets.only(bottom: 8, left: 40.w),
                //     child: Wrap(
                //       spacing: 10, // Spacing between images
                //       children: List.generate(
                //         controller.selectedImages.length,
                //         (index) {
                //           return Stack(
                //             alignment: Alignment.topRight,
                //             children: [
                //               Image.file(
                //                 controller.selectedImages[index],
                //                 height: 100.h,
                //                 width: 100.w,
                //               ),
                //               Positioned(
                //                 top: -10.h,
                //                 right: -5.w,
                //                 child: IconButton(
                //                   icon: Icon(Icons.cancel, color: Colors.red),
                //                   onPressed: () {
                //                     setState(() {
                //                       // ignore: invalid_use_of_protected_member
                //                       controller.selectedImages.value.removeAt(
                //                         index,
                //                       );
                //                     });
                //                   },
                //                 ),
                //               ),
                //             ],
                //           );
                //         },
                //       ),
                //     ),
                //   ),
                // ],

                // SizedBox(height: 10.h),
                Row(
                  children: [
                    // IconButton(
                    //   icon: const Icon(
                    //     Icons.attach_file,
                    //     color: AppColors.primary,
                    //   ),
                    //   onPressed:
                    //       controller.pickMultipleImages, // Updated function
                    // ),
                    SizedBox(width: 5),
                    Expanded(
                      child: CustomTextField(
                        isDens: true,
                        cursorColor: AppColors.black,
                        fillColor: AppColors.fillColor,
                        textEditingController:
                            controller.messageController.value,
                        hintText: 'Type a message',
                        fieldBorderColor: Colors.grey,
                        onChanged: (text) {
                          // setState(() {}); // Update UI
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          controller.sendMessage(
                            receiverID: receiverInformation.receiverId ?? '',
                          );

                          // if (controller.selectedImages.isNotEmpty ||
                          //     controller
                          //         .messageController
                          //         .value
                          //         .text
                          //         .isNotEmpty) {
                          //   if (controller.selectedImages.isEmpty) {
                          //     MessageModel model = MessageModel(
                          //       senderId: controller.userID.value,
                          //       message:
                          //           controller.messageController.value.text,
                          //       messageType: 'manual',
                          //     );

                          //     controller.messageList.insert(0, model);
                          //     controller.sendMessage(
                          //       receiverID: user.id ?? '',
                          //       usertype: user.userType ?? '',
                          //     );
                          //   } else {
                          //     List<String> imageUrls = [];
                          //     for (
                          //       int i = 0;
                          //       i < controller.selectedImages.length;
                          //       i++
                          //     ) {
                          //       imageUrls.add(
                          //         controller.selectedImages[i].path,
                          //       );
                          //     }

                          //     MessageModel model = MessageModel(
                          //       senderId: controller.userID.value,
                          //       message:
                          //           controller.messageController.value.text,
                          //       messageType: 'manualImage',
                          //       mediaUrl: imageUrls,
                          //     );
                          //     controller.showImagesSection.value = false;
                          //     controller.showImagesSection.refresh();
                          //     controller.messageList.insert(0, model);

                          //     controller.messageFileSend(
                          //       receiverID: user.id ?? '',
                          //       usertype: user.userType ?? '',
                          //     );
                          //   }

                          //   // setState(() {
                          //   //   controller.selectedImages
                          //   //       .clear(); // Clear images after sending
                          //   // });
                          // }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      //         itemCount: messages.length,
      //         itemBuilder: (context, index) {
      //           final msg = messages[index];
      //           return Align(
      //             alignment:
      //                 msg.isSent ? Alignment.centerRight : Alignment.centerLeft,
      //             child: Container(
      //               margin: const EdgeInsets.symmetric(vertical: 4),
      //               padding: const EdgeInsets.symmetric(
      //                 vertical: 10,
      //                 horizontal: 16,
      //               ),
      //               constraints: BoxConstraints(
      //                 maxWidth: MediaQuery.of(context).size.width * 0.75,
      //               ),
      //               decoration: BoxDecoration(
      //                 color:
      //                     AppColors
      //                         .primary, //msg.isSent ? Colors.green[600] : Colors.green[300],
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: const Radius.circular(20),
      //                   topRight: const Radius.circular(20),
      //                   bottomLeft: Radius.circular(msg.isSent ? 20 : 5),
      //                   bottomRight: Radius.circular(msg.isSent ? 5 : 20),
      //                 ),
      //               ),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: [
      //                   Text(
      //                     msg.text,
      //                     style: const TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                   const SizedBox(height: 5),
      //                   Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: [
      //                       Text(
      //                         msg.time,
      //                         style: const TextStyle(
      //                           color: Colors.white70,
      //                           fontSize: 12,
      //                         ),
      //                       ),
      //                       if (msg.isSent) ...[
      //                         const SizedBox(width: 4),
      //                         Icon(
      //                           msg.isRead ? Icons.done_all : Icons.done,
      //                           size: 16,
      //                           color:
      //                               msg.isRead
      //                                   ? Colors.lightBlueAccent
      //                                   : Colors.white70,
      //                         ),
      //                       ],
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      //       child: Container(
      //         // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //         decoration: BoxDecoration(
      //           color: AppColors.white,
      //           borderRadius: BorderRadius.circular(30.r),
      //           boxShadow: [
      //             BoxShadow(
      //               color: AppColors.black.withOpacity(0.05),
      //               offset: const Offset(0, -2),
      //               blurRadius: 6,
      //             ),
      //           ],
      //         ),
      //         child: Row(
      //           children: [
      //             SizedBox(width: 16.h),
      //             Expanded(
      //               child: TextField(
      //                 controller: _controller,
      //                 decoration: const InputDecoration(
      //                   hintText: 'Send a message...',
      //                   border: InputBorder.none,
      //                 ),
      //                 textCapitalization: TextCapitalization.sentences,
      //               ),
      //             ),
      //             IconButton(
      //               icon: const Icon(Icons.send, color: AppColors.gray),
      //               onPressed: _sendMessage,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 30.h),
      //   ],
      // ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isSent;
  final String time;
  final bool isRead;

  _ChatMessage({
    required this.text,
    required this.isSent,
    required this.time,
    this.isRead = false,
  });
}

class CustomInboxMessage extends StatelessWidget {
  final bool? isGroup;
  final bool isMe;
  final String message;
  final String? messageTime;
  final String type;
  final List<String> imageUrls;
  final String? profileImage;
  final String? senderName;

  const CustomInboxMessage({
    super.key,
    required this.isMe,
    required this.message,
    this.messageTime,
    required this.type,
    required this.imageUrls,
    this.profileImage,
    this.isGroup = false,
    this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isMe)
              CircleAvatar(
                backgroundColor: AppColors.primary,
                backgroundImage: NetworkImage(
                  ImageHandler.imagesHandle(profileImage),
                ), // Replace with user's profile image
                radius: 16,
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (type == 'manual') _buildManualBubble(context),
                  if (type == 'text') _buildMessageBubble(context),
                  if (type == 'image') _buildImageMessage(context),
                  if (type == 'manualImage') _buildManualImageMessage(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(BuildContext context) {
    return Column(
      //TO DO : add sender name
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (isGroup! && !isMe) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomText(
              top: 5.h,
              text: senderName ?? '',
              fontSize: 12.w,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
              bottomRight: isMe ? Radius.zero : const Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: message,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: isMe ? Colors.black : Colors.black,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: messageTime ?? '',
                    fontSize: 10.w,
                    color: Colors.grey[600] ?? Colors.black54,
                  ),
                  if (isMe) ...[
                    Icon(
                      Icons.done_all,
                      size: 16,
                      color: Colors.blue, // Blue if read, grey if sent
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageMessage(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        //TO DO : add sender name
        if (isGroup! && !isMe) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomText(
              top: 5.h,
              text: senderName ?? '',
              fontSize: 12.w,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
        if (imageUrls.isNotEmpty)
          Stack(
            children: [
              SizedBox(
                height: 140.h,
                width: 200.w,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  // reverse: isMe,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    final imageUrl = imageUrls[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 6,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(
                          //   () => ShowImageScreen(
                          //     imageUrls: imageUrls,
                          //     initialIndex: index,
                          //   ),
                          // );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CustomNetworkImage(
                            imageUrl: ImageHandler.imagesHandle(imageUrl),
                            height: 180.h,
                            width: 180.w,
                            //  fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (message.trim().isEmpty) ...[
                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: messageTime ?? '',
                        fontSize: 10,
                        color: AppColors.white,
                      ),
                      if (isMe) const SizedBox(width: 4),
                      if (isMe)
                        const Icon(
                          Icons.done_all,
                          size: 16,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        if (message.trim().isNotEmpty)
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
                  bottomRight: isMe ? Radius.zero : const Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: message,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: messageTime ?? '',
                        fontSize: 10,
                        color: Colors.grey[600] ?? Colors.black54,
                      ),
                      if (isMe) const SizedBox(width: 4),
                      if (isMe)
                        const Icon(
                          Icons.done_all,
                          size: 16,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  //=============================== manual bubble ===============================
  Widget _buildManualBubble(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
          bottomRight: isMe ? Radius.zero : const Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText(
            text: message,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isMe ? Colors.black : Colors.black,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: messageTime ?? '',
                fontSize: 10.w,
                color: Colors.grey[600] ?? Colors.black54,
              ),
              if (isMe)
                Icon(
                  Icons.circle_outlined,
                  size: 16,
                  color: Colors.blue, // Blue if read, grey if sent
                ),
            ],
          ),
        ],
      ),
    );
  }

  //=============================== manual image bubble ===============================
  Widget _buildManualImageMessage(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        //TO DO : add sender name
        if (isGroup! && !isMe) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomText(
              top: 5.h,
              text: senderName ?? '',
              fontSize: 12.w,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
        if (imageUrls.isNotEmpty)
          Stack(
            children: [
              SizedBox(
                height: 140.h,
                width: 200.w,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  // reverse: isMe,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    final imageUrl = imageUrls[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 6,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(() => ShowImageScreen(
                          //     imageUrls: imageUrls, initialIndex: index));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(imageUrl),
                            height: 180.h,
                            width: 180.w,
                            fit: BoxFit.cover,
                          ),

                          //  CustomNetworkImage(
                          //   imageUrl: ImageHandler.imagesHandle(imageUrl),
                          //   height: 180.h,
                          //   width: 180.w,
                          //   //  fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (message.trim().isEmpty) ...[
                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: messageTime ?? '',
                        fontSize: 10,
                        color: AppColors.white,
                      ),
                      if (isMe) const SizedBox(width: 4),
                      if (isMe)
                        const Icon(
                          Icons.circle_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        if (message.trim().isNotEmpty)
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
                  bottomRight: isMe ? Radius.zero : const Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: message,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: messageTime ?? '',
                        fontSize: 10,
                        color: Colors.grey[600] ?? Colors.black54,
                      ),
                      if (isMe) const SizedBox(width: 4),
                      if (isMe)
                        const Icon(
                          Icons.circle_outlined,
                          size: 16,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// class ShowImageScreen extends StatelessWidget {
//   const ShowImageScreen({
//     super.key,
//     required this.imageUrls,
//     this.initialIndex = 0,
//   });

//   final List<String> imageUrls;
//   final int initialIndex;

//   @override
//   Widget build(BuildContext context) {
//     PageController pageController = PageController(initialPage: initialIndex);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           'Images',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: PhotoViewGallery.builder(
//         pageController: pageController,
//         itemCount: imageUrls.length,
//         backgroundDecoration: const BoxDecoration(color: Colors.black),
//         builder: (context, index) {
//           return PhotoViewGalleryPageOptions(
//             imageProvider: NetworkImage(
//               ImageHandler.imagesHandle(imageUrls[index]),
//             ),
//             minScale: PhotoViewComputedScale.contained,
//             maxScale: PhotoViewComputedScale.covered * 2,
//             heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
//           );
//         },
//         loadingBuilder:
//             (context, event) => const Center(
//               child: CircularProgressIndicator(color: Colors.white),
//             ),
//       ),
//     );
//   }
// }
