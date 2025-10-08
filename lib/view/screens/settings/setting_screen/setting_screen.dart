import 'package:event_app/helper/shared_prefe/shared_prefe.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/screens/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../profile/widget/custom_settings_list_card.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final SettingsController controller = Get.find<SettingsController>();

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
              text: AppStrings.settings.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // CustomSettingsListCard(
          //   text: "Account & Security",
          //   onTap: () {
          //     Get.toNamed(AppRoutes.accountSecurityScreen);
          //   },
          // ),
          CustomSettingsListCard(
            text: AppStrings.notification.tr,
            onTap: () {
              Get.toNamed(AppRoutes.notificationsScreen);
            },
          ),
          CustomSettingsListCard(
            text: AppStrings.helpSupport.tr,
            onTap: () {
              Get.toNamed(AppRoutes.helpSupportScreen);
            },
          ),
          CustomSettingsListCard(
            text: AppStrings.privacyPolicy.tr,
            onTap: () {
              Get.toNamed(AppRoutes.privacyPolicyScreen);
            },
          ),
          CustomSettingsListCard(
            text: AppStrings.termsConditions.tr,
            onTap: () {
              Get.toNamed(AppRoutes.termsConditionsScreen);
            },
          ),
          CustomSettingsListCard(
            text: AppStrings.logOut.tr,
            color: AppColors.red,
            onTap: () {
              showLogoutDialog(context, () {
                SharePrefsHelper.remove(AppConstants.bearerToken);
                SharePrefsHelper.remove(AppConstants.userId);
                Get.offAllNamed(AppRoutes.selectedScreen);
              });
            },
          ),
          CustomSettingsListCard(
            text: AppStrings.deleteAccount.tr,
            color: AppColors.red,
            onTap: () {
              showDeleteAccountDialog(context, () {
                controller.deleteAccountApi();
                // TO DO
              });
            },
          ),
        ],
      ),
    );
  }

  /// Confirm Button

  void showDeleteAccountDialog(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.delete, size: 50.w, color: Colors.redAccent),
                SizedBox(height: 15.h),
                Text(
                  AppStrings.deleteAccountTitle.tr,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppStrings.deleteAccountMessage.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// Cancel Button
                    // TextButton(
                    //   onPressed: () {
                    //     Get.back();
                    //   },
                    //   child: Text(
                    //     AppStrings.cancel.tr,
                    //     style: TextStyle(
                    //       fontSize: 14.sp,
                    //       color: AppColors.primary,
                    //     ),
                    //   ),
                    // ),
                    CustomButton(
                      fontSize: 16.sp,
                      fillColor: AppColors.primary,
                      onTap: () {
                        Get.back();
                      },
                      title: AppStrings.cancel.tr,
                      height: 48.h,
                      width: 100.w,
                    ),

                    /// Delete Button
                    CustomButton(
                      fontSize: 16.sp,
                      fillColor: AppColors.red,
                      onTap: onConfirm,
                      title: AppStrings.delete.tr,
                      height: 48.h,
                      width: 100.w,
                    ),
                    // TextButton(

                    //   onPressed: onConfirm,
                    //   child: Text(
                    //     AppStrings.delete.tr,
                    //     style: TextStyle(
                    //       fontSize: 14.sp,
                    //       color: Colors.redAccent,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showLogoutDialog(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.logout, size: 50.w, color: Colors.redAccent),
                SizedBox(height: 15.h),
                Text(
                  AppStrings.logOutTitle.tr,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppStrings.logOutMessage.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// Cancel Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          AppStrings.cancel.tr,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    /// Confirm Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        onConfirm(); // Call logout action
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          AppStrings.confirmLogOut.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
