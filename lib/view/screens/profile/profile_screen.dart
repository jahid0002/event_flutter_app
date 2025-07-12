import 'package:event_app/helper/imges_handler/image_handler.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_nav_bar/navbar.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/profile/controller/profile_controller.dart';
import 'package:event_app/view/screens/profile/widget/profile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import 'widget/custom_profile_list_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.profileStatus.value) {
          case Status.loading:
            return ProfileShimmer();
          case Status.error:
            return GeneralErrorScreen(onTap: () => controller.getOwnProfile());
          case Status.internetError:
            return GeneralErrorScreen(onTap: () => controller.getOwnProfile());
          case Status.completed:
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 60, bottom: 30),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray.withValues(alpha: .1),
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Back & Title Row
                      Row(
                        children: [
                          BackButton(),
                          const SizedBox(width: 30),
                          const Spacer(),
                          CustomImage(
                            imageSrc: AppIcons.connection,
                            imageColor: AppColors.primary,
                          ),
                          const SizedBox(width: 6),
                          CustomText(
                            text: "Profile",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Profile Image with border progress
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 110.w,
                            height: 110.h,
                            child: CircularProgressIndicator(
                              value: 0.75, // 75% progress
                              strokeWidth: 6,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF00C29E),
                              ),
                              backgroundColor: Colors.grey.shade200,
                            ),
                          ),
                          CustomNetworkImage(
                            imageUrl: ImageHandler.imagesHandle(
                              controller.profileModel.value.profileImage,
                            ),
                            height: 110.w,
                            width: 110.h,
                            boxShape: BoxShape.circle,
                          ),
                          // Container(
                          //   width: 110,
                          //   height: 110,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     border: Border.all(color: Colors.white, width: 3),
                          //     image: const DecorationImage(
                          //       image: NetworkImage(
                          //         'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d',
                          //       ), // your image url
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      CustomText(
                        top: 20,
                        text: controller.profileModel.value.name ?? "N/A",
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomProfileListCard(
                  imageSrc: AppIcons.parson,
                  text: "Profile",
                  onTap: () {
                    Get.toNamed(AppRoutes.updateProfile);
                  },
                ),
                CustomProfileListCard(
                  imageSrc: AppIcons.language,
                  text: " App Language",
                  onTap: () {
                    Get.toNamed(AppRoutes.languageScreen);
                  },
                ),
                CustomProfileListCard(
                  imageSrc: AppIcons.settings,
                  text: "Settings",
                  onTap: () {
                    Get.toNamed(AppRoutes.settingScreen);
                  },
                ),
              ],
            );
        }
      }),
      bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
