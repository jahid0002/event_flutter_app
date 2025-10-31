// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
import 'package:event_app/view/screens/connections/controller/connection_controller.dart';
import 'package:event_app/view/screens/connections/model/connection_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConnectionsDetailsScreen extends StatefulWidget {
  const ConnectionsDetailsScreen({super.key});

  @override
  State<ConnectionsDetailsScreen> createState() =>
      _ConnectionsDetailsScreenState();
}

class _ConnectionsDetailsScreenState extends State<ConnectionsDetailsScreen> {
  final ConnectionModel connection = Get.arguments;
  final ConnectionController conntroller = Get.find<ConnectionController>();

  // Image slider variables
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;
  Timer? _imageTimer;

  @override
  void initState() {
    super.initState();
    conntroller.getConnectionDetails(userId: connection.otherUser?.id ?? '');

    // Start auto image slider after connection details are loaded
    ever(conntroller.userDetailsStatus, (status) {
      if (status == Status.completed) {
        _startImageSlider();
      }
    });
  }

  void _startImageSlider() {
    final images = _getImageList();
    if (images.length > 1) {
      _imageTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (_pageController.hasClients) {
          final nextPage = (_currentImageIndex + 1) % images.length;
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  List<String> _getImageList() {
    final pictures = conntroller.connectionDetails.value.pictures;
    final profileImage = conntroller.connectionDetails.value.profileImage;

    List<String> images = [];

    // Add pictures from API
    if (pictures != null && pictures.isNotEmpty) {
      images.addAll(pictures);
    }

    // Add profile image if pictures list is empty
    if (images.isEmpty && profileImage != null && profileImage.isNotEmpty) {
      images.add(profileImage);
    }

    // Fallback to connection's profile image
    if (images.isEmpty && connection.otherUser?.profileImage != null) {
      images.add(connection.otherUser!.profileImage!);
    }

    return images;
  }

  @override
  void dispose() {
    _imageTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildImageIndicators(int imageCount, double availableWidth) {
    if (imageCount <= 1) return const SizedBox.shrink();

    // Calculate indicator width based on image count
    // For fewer images, indicators are bigger; for many images, they're smaller
    double totalSpacing =
        (imageCount - 1) * 6.w; // 6.w spacing between indicators
    double availableForIndicators = availableWidth - totalSpacing;
    double maxIndicatorWidth = 60.w; // Maximum width for each indicator
    double minIndicatorWidth = 15.w; // Minimum width for each indicator

    double calculatedWidth = availableForIndicators / imageCount;
    double indicatorWidth = calculatedWidth.clamp(
      minIndicatorWidth,
      maxIndicatorWidth,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imageCount,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          height: 4.h,
          width: indicatorWidth,
          decoration: BoxDecoration(
            color:
                _currentImageIndex == index
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Slider Section
                Obx(() {
                  final images = _getImageList();

                  return SizedBox(
                    height: 612.h,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        // PageView for images
                        PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return CustomNetworkImage(
                              imageUrl: ImageHandler.imagesHandle(
                                images[index],
                              ),
                              height: 612.h,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(20.r),
                            );
                          },
                        ),

                        // Overlay with back button and indicator
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black.withOpacity(0.3),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.h),

                                  // Image indicators - using LayoutBuilder to get available width
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      return _buildImageIndicators(
                                        images.length,
                                        constraints.maxWidth,
                                      );
                                    },
                                  ),

                                  SizedBox(height: 10.h),

                                  // Back button
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Platform.isIOS
                                              ? Icons.arrow_back_ios
                                              : Icons.arrow_back,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: CustomText(
                    top: 50.h,
                    left: 35.w,
                    text: AppStrings.aboutMe.tr,
                    fontSize: 16.w,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    bottom: 5.h,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.primary, thickness: 3),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.gray, thickness: 3),
                    ),
                  ],
                ),

                Obx(() {
                  switch (conntroller.userDetailsStatus.value) {
                    case Status.loading:
                      return CustomLoader();
                    case Status.error:
                      return GeneralErrorScreen(
                        onTap:
                            () => conntroller.getConnectionDetails(
                              userId: connection.otherUser?.id ?? '',
                            ),
                      );
                    case Status.internetError:
                      return GeneralErrorScreen(
                        onTap:
                            () => conntroller.getConnectionDetails(
                              userId: connection.otherUser?.id ?? '',
                            ),
                      );
                    case Status.completed:
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250.w,
                                      child: CustomText(
                                        top: 10.h,
                                        left: 0.w,
                                        text:
                                            conntroller
                                                .connectionDetails
                                                .value
                                                .name ??
                                            AppStrings.na.tr,
                                        fontSize: 24.w,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    CustomText(
                                      top: 10.h,
                                      left: 10.w,
                                      text:
                                          '${connection.otherUser?.age ?? AppStrings.na.tr}',
                                      fontSize: 18.w,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      ReceiverInformation
                                      information = ReceiverInformation(
                                        receiverId: connection.otherUser?.id,
                                        receiverName:
                                            connection.otherUser?.name,
                                        receiverImage:
                                            connection.otherUser?.profileImage,
                                      );
                                      Get.toNamed(
                                        AppRoutes.messageScreen,
                                        arguments: information,
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.primary,
                                      maxRadius: 20.r,
                                      child: Icon(
                                        Icons.chat_bubble,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            CustomText(
                              text: AppStrings.aboutMeTitle.tr,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 15.h,
                            ),
                            CustomText(
                              text:
                                  conntroller.connectionDetails.value.bio ??
                                  AppStrings.na.tr,
                              fontSize: 12.w,
                              fontWeight: FontWeight.w400,
                              maxLines: 5,
                              textAlign: TextAlign.start,
                              bottom: 10.h,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: AppStrings.gender.tr,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                ModifyButton(
                                  color: AppColors.gray,
                                  title:
                                      conntroller
                                          .connectionDetails
                                          .value
                                          .gender,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: AppStrings.from.tr,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                ModifyButton(
                                  color: AppColors.gray,
                                  title:
                                      conntroller
                                          .connectionDetails
                                          .value
                                          .address ??
                                      AppStrings.na.tr,
                                ),
                              ],
                            ),
                            CustomText(
                              top: 20.h,
                              text: AppStrings.myInterests.tr,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 10.h,
                            ),

                            Wrap(
                              spacing: 10.w,
                              runSpacing: 10.h,
                              children: List.generate(
                                conntroller
                                        .connectionDetails
                                        .value
                                        .interests
                                        ?.length ??
                                    0,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.gray,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          100.r,
                                        ),
                                      ),
                                      constraints: BoxConstraints(
                                        minHeight: 30.h,
                                        maxWidth: 250.w,
                                      ),
                                      child: Text(
                                        conntroller
                                                .connectionDetails
                                                .value
                                                .interests?[index] ??
                                            AppStrings.na.tr,
                                        style: TextStyle(
                                          fontSize: 14.w,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.gray,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            CustomText(
                              top: 20.h,
                              text: AppStrings.languages.tr,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              bottom: 10.h,
                            ),

                            Wrap(
                              spacing: 10.w,
                              runSpacing: 10.h,
                              children: List.generate(
                                conntroller
                                        .connectionDetails
                                        .value
                                        .language
                                        ?.length ??
                                    0,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.gray,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          100.r,
                                        ),
                                      ),
                                      constraints: BoxConstraints(
                                        minHeight: 30.h,
                                        maxWidth: 250.w,
                                      ),
                                      child: Text(
                                        conntroller
                                                .connectionDetails
                                                .value
                                                .language?[index] ??
                                            AppStrings.na.tr,
                                        style: TextStyle(
                                          fontSize: 14.w,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.gray,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 40.h),
                          ],
                        ),
                      );
                  }
                }),
              ],
            ),
            Positioned(
              top: 570.h,
              left: 100.w,
              child: Row(
                children: [
                  ConnectionsDetailsButton(
                    imageSrc: Icons.close,
                    color: AppColors.red,
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    height: 84.h,
                    width: 84.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: CustomImage(
                        imageSrc: AppIcons.connection,
                        imageColor: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';

// import 'package:event_app/core/routes/app_routes.dart';
// import 'package:event_app/helper/imges_handler/image_handler.dart';
// import 'package:event_app/utils/app_colors/app_colors.dart';
// import 'package:event_app/utils/app_const/app_const.dart';
// import 'package:event_app/utils/app_icons/app_icons.dart';
// import 'package:event_app/utils/app_strings/app_strings.dart';
// import 'package:event_app/view/components/custom_image/custom_image.dart';
// import 'package:event_app/view/components/custom_loader/custom_loader.dart';
// import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
// import 'package:event_app/view/components/custom_text/custom_text.dart';
// import 'package:event_app/view/components/general_error.dart';
// import 'package:event_app/view/screens/chat/controller/chat_controller.dart';
// import 'package:event_app/view/screens/connections/controller/connection_controller.dart';
// import 'package:event_app/view/screens/connections/model/connection_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class ConnectionsDetailsScreen extends StatefulWidget {
//   const ConnectionsDetailsScreen({super.key});

//   @override
//   State<ConnectionsDetailsScreen> createState() =>
//       _ConnectionsDetailsScreenState();
// }

// class _ConnectionsDetailsScreenState extends State<ConnectionsDetailsScreen> {
//   final ConnectionModel connection = Get.arguments;
//   final ConnectionController conntroller = Get.find<ConnectionController>();

//   @override
//   void initState() {
//     // TO DO: implement initState
//     super.initState();
//     conntroller.getConnectionDetails(userId: connection.otherUser?.id ?? '');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomNetworkImage(
//                   imageUrl: ImageHandler.imagesHandle(
//                     connection.otherUser?.profileImage,
//                   ),
//                   height: 612.h,
//                   width: double.infinity,
//                   borderRadius: BorderRadius.circular(20.r),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20.0.w,
//                       vertical: 10.h,
//                     ),
//                     child: Column(
//                       //   mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20.h),
//                         SizedBox(height: 20.h),

//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               icon: Icon(
//                                 Platform.isIOS
//                                     ? Icons.arrow_back_ios
//                                     : Icons.arrow_back,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                             // CircleAvatar(
//                             //   backgroundColor: AppColors.primary,
//                             //   maxRadius: 15.r,
//                             //   child: Icon(
//                             //     Icons.more_horiz,
//                             //     color: AppColors.white,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//                   child: CustomText(
//                     top: 50.h,
//                     left: 35.w,
//                     text: AppStrings.aboutMe.tr,
//                     fontSize: 16.w,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.primary,
//                     bottom: 5.h,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(color: AppColors.primary, thickness: 3),
//                     ),
//                     Expanded(
//                       child: Divider(color: AppColors.gray, thickness: 3),
//                     ),
//                   ],
//                 ),

//                 Obx(() {
//                   switch (conntroller.userDetailsStatus.value) {
//                     case Status.loading:
//                       return CustomLoader();
//                     case Status.error:
//                       return GeneralErrorScreen(
//                         onTap:
//                             () => conntroller.getConnectionDetails(
//                               userId: connection.otherUser?.id ?? '',
//                             ),
//                       );
//                     case Status.internetError:
//                       return GeneralErrorScreen(
//                         onTap:
//                             () => conntroller.getConnectionDetails(
//                               userId: connection.otherUser?.id ?? '',
//                             ),
//                       );
//                     case Status.completed:
//                       return Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   // mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     SizedBox(
//                                       width: 250.w,
//                                       child: CustomText(
//                                         top: 10.h,
//                                         left: 0.w,
//                                         text:
//                                             conntroller
//                                                 .connectionDetails
//                                                 .value
//                                                 .name ??
//                                             AppStrings.na.tr,
//                                         fontSize: 24.w,
//                                         fontWeight: FontWeight.w600,
//                                         maxLines: 3,
//                                         textAlign: TextAlign.start,
//                                         // color: AppColors.primary,
//                                       ),
//                                     ),
//                                     CustomText(
//                                       top: 10.h,
//                                       left: 10.w,
//                                       text:
//                                           '${connection.otherUser?.age ?? AppStrings.na.tr}',
//                                       fontSize: 18.w,
//                                       fontWeight: FontWeight.w400,
//                                       // color: AppColors.primary,
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       ReceiverInformation
//                                       information = ReceiverInformation(
//                                         receiverId: connection.otherUser?.id,
//                                         receiverName:
//                                             connection.otherUser?.name,
//                                         receiverImage:
//                                             connection.otherUser?.profileImage,
//                                       );
//                                       Get.toNamed(
//                                         AppRoutes.messageScreen,
//                                         arguments: information,
//                                       );
//                                     },
//                                     child: CircleAvatar(
//                                       backgroundColor: AppColors.primary,
//                                       maxRadius: 20.r,
//                                       child: Icon(
//                                         Icons.chat_bubble,
//                                         color: AppColors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 20.h),
//                             CustomText(
//                               text: AppStrings.aboutMeTitle.tr,
//                               fontSize: 16.w,
//                               fontWeight: FontWeight.w600,
//                               bottom: 15.h,
//                             ),
//                             CustomText(
//                               text:
//                                   conntroller.connectionDetails.value.bio ??
//                                   AppStrings.na.tr,
//                               fontSize: 12.w,
//                               fontWeight: FontWeight.w400,
//                               maxLines: 5,
//                               textAlign: TextAlign.start,
//                               bottom: 10.h,
//                             ),

//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 CustomText(
//                                   text: AppStrings.gender.tr,
//                                   fontSize: 16.w,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 ModifyButton(
//                                   color: AppColors.gray,
//                                   title:
//                                       conntroller
//                                           .connectionDetails
//                                           .value
//                                           .gender,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 20.h),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 CustomText(
//                                   text: AppStrings.from.tr,
//                                   fontSize: 16.w,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 ModifyButton(
//                                   color: AppColors.gray,
//                                   title:
//                                       conntroller
//                                           .connectionDetails
//                                           .value
//                                           .address ??
//                                       AppStrings.na.tr,
//                                 ),
//                               ],
//                             ),
//                             CustomText(
//                               top: 20.h,
//                               text: AppStrings.myInterests.tr,
//                               fontSize: 16.w,
//                               fontWeight: FontWeight.w600,
//                               bottom: 10.h,
//                             ),

//                             // Row(
//                             //   children: List.generate(
//                             //     conntroller
//                             //             .connectionDetails
//                             //             .value
//                             //             .interests
//                             //             ?.length ??
//                             //         0,
//                             //     (index) {
//                             //       return ModifyButton(
//                             //         // width: 200.w,
//                             //         color: AppColors.gray,
//                             //         title:
//                             //             conntroller
//                             //                 .connectionDetails
//                             //                 .value
//                             //                 .interests?[index] ??
//                             //             AppStrings.na.tr,
//                             //       );
//                             //     },
//                             //   ),
//                             // ),
//                             Wrap(
//                               spacing: 10.w, // horizontal space between items
//                               runSpacing:
//                                   10.h, // vertical space between wrapped lines
//                               children: List.generate(
//                                 conntroller
//                                         .connectionDetails
//                                         .value
//                                         .interests
//                                         ?.length ??
//                                     0,
//                                 (index) {
//                                   return GestureDetector(
//                                     onTap: () {},
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: 16.w,
//                                         vertical: 8.h,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: AppColors.white,
//                                         border: Border.all(
//                                           color: AppColors.gray,
//                                           width: 1,
//                                         ),
//                                         borderRadius: BorderRadius.circular(
//                                           100.r,
//                                         ),
//                                       ),
//                                       constraints: BoxConstraints(
//                                         minHeight: 30.h,
//                                         maxWidth:
//                                             250.w, // optional max width per item
//                                       ),
//                                       child: Text(
//                                         conntroller
//                                                 .connectionDetails
//                                                 .value
//                                                 .interests?[index] ??
//                                             AppStrings.na.tr,
//                                         style: TextStyle(
//                                           fontSize: 14.w,
//                                           fontWeight: FontWeight.w700,
//                                           color: AppColors.gray,
//                                         ),
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 1,
//                                         softWrap: false,
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),

//                             CustomText(
//                               top: 20.h,
//                               text: AppStrings.languages.tr,
//                               fontSize: 16.w,
//                               fontWeight: FontWeight.w600,
//                               bottom: 10.h,
//                             ),

//                             // Row(
//                             //   children: List.generate(
//                             //     conntroller
//                             //             .connectionDetails
//                             //             .value
//                             //             .language
//                             //             ?.length ??
//                             //         0,
//                             //     (index) {
//                             //       return ModifyButton(
//                             //         // width: 200.w,
//                             //         color: AppColors.gray,
//                             //         title:
//                             //             conntroller
//                             //                 .connectionDetails
//                             //                 .value
//                             //                 .language?[index] ??
//                             //             AppStrings.na.tr,
//                             //       );
//                             //     },
//                             //   ),

//                             // [
//                             //   ModifyButton(
//                             //     color: AppColors.gray,
//                             //     title: 'Spanish',
//                             //     width: 120.w,
//                             //   ),
//                             //   SizedBox(width: 10.w),
//                             //   ModifyButton(
//                             //     title: 'Italian',
//                             //     color: AppColors.gray,
//                             //     width: 120.w,
//                             //   ),
//                             // ],
//                             //  ),
//                             Wrap(
//                               spacing: 10.w, // horizontal gap between items
//                               runSpacing: 10.h, // vertical gap between lines
//                               children: List.generate(
//                                 conntroller
//                                         .connectionDetails
//                                         .value
//                                         .language
//                                         ?.length ??
//                                     0,
//                                 (index) {
//                                   return GestureDetector(
//                                     onTap: () {},
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: 16.w,
//                                         vertical: 8.h,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: AppColors.white,
//                                         border: Border.all(
//                                           color: AppColors.gray,
//                                           width: 1,
//                                         ),
//                                         borderRadius: BorderRadius.circular(
//                                           100.r,
//                                         ),
//                                       ),
//                                       constraints: BoxConstraints(
//                                         minHeight: 30.h,
//                                         maxWidth:
//                                             250.w, // optional max width per chip
//                                       ),
//                                       child: Text(
//                                         conntroller
//                                                 .connectionDetails
//                                                 .value
//                                                 .language?[index] ??
//                                             AppStrings.na.tr,
//                                         style: TextStyle(
//                                           fontSize: 14.w,
//                                           fontWeight: FontWeight.w700,
//                                           color: AppColors.gray,
//                                         ),
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 1,
//                                         softWrap: false,
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),

//                             SizedBox(height: 40.h),
//                           ],
//                         ),
//                       );
//                   }
//                 }),
//               ],
//             ),
//             Positioned(
//               top: 570.h,
//               left: 100.w,
//               child: Row(
//                 children: [
//                   ConnectionsDetailsButton(
//                     imageSrc: Icons.close,
//                     color: AppColors.red,
//                   ),
//                   SizedBox(width: 20.w),
//                   Container(
//                     height: 84.h,
//                     width: 84.w,
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(
//                             0.1,
//                           ), // Adjust opacity as needed
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                           offset: Offset(
//                             0,
//                             4,
//                           ), // horizontal, vertical shadow offset
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(25.0),
//                       child: CustomImage(
//                         imageSrc: AppIcons.connection,
//                         imageColor: AppColors.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ConnectionsDetailsButton extends StatelessWidget {
  const ConnectionsDetailsButton({super.key, this.imageSrc, this.color});

  final IconData? imageSrc;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      width: 84.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Adjust opacity as needed
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4), // horizontal, vertical shadow offset
          ),
        ],
      ),
      child: Icon(
        imageSrc ?? Icons.link,
        color: color ?? AppColors.primary,
        size: 40.w,
      ),
    );
  }
}

class ModifyButton extends StatelessWidget {
  const ModifyButton({
    super.key,
    this.title = AppStrings.na,
    this.color,
    this.width,
  });

  final String? title;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: color ?? AppColors.primary, width: 1),
              borderRadius: BorderRadius.circular(100.r),
            ),
            constraints: BoxConstraints(
              minHeight: 30.h,
              // Optional: prevent it from being *too* wide
              maxWidth: 250.w,
            ),
            child: Text(
              title ?? AppStrings.na.tr,
              style: TextStyle(
                fontSize: 14.w,
                fontWeight: FontWeight.w700,
                color: color ?? AppColors.primary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
