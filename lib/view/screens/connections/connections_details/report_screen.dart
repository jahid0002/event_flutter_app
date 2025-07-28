import 'package:event_app/utils/ToastMsg/toast_message.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/custom_popupmenu_button/custom_popupmenu_button.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/connections/controller/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final String reportID = Get.arguments;

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
              text: "Report",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0.h, right: 20.w, left: 20.w),
        child: Column(
          children: [
            CustomFormCard(
              readOnly: true,
              hintText: 'Select Incident Type',
              title: 'Incident Type',
              controller: controller.reportIncedentController.value,

              suffixIcon: CustomPopupmenuButton(
                onChanged: (value) {
                  controller.reportIncedentController.value.text = value;
                },
                items: [
                  'Unprofessional Behavior',
                  'Failure to collaborate',
                  'Spam',
                  'Other',
                ],
              ),
            ),

            CustomFormCard(
              hintText: 'Enter Additional Note',
              title: 'Additional Note',
              controller: controller.additionalInfoController.value,
              maxLine: 3,
            ),

            SizedBox(height: 100.h),

            Obx(() {
              return controller.isReportLoading.value
                  ? const CustomLoader()
                  : CustomButton(
                    onTap: () {
                      if (controller
                          .reportIncedentController
                          .value
                          .text
                          .isEmpty) {
                        showCustomSnackBar(
                          'Please select incident type',
                          isError: true,
                        );
                        return;
                      } else {
                        controller.reportConnection(otherUserID: reportID);
                      }
                    },
                    title: 'Submit',
                    height: 48.h,
                  );
            }),
          ],
        ),
      ),
    );
  }
}
