import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_loader/custom_loader.dart';
import 'package:event_app/view/components/general_error.dart';
import 'package:event_app/view/screens/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  final SettingsController controller = Get.find<SettingsController>();

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();

    controller.termsAndCondition();
  }

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
              text: AppStrings.termsConditions.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Obx(() {
        switch (controller.termsConditionStatus.value) {
          case Status.loading:
            return CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () => controller.termsAndCondition(),
            );
          case Status.internetError:
            return GeneralErrorScreen(
              onTap: () => controller.termsAndCondition(),
            );
          case Status.completed:
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  controller.termsCondition.value.description != null
                      ? Html(data: controller.termsCondition.value.description)
                      : Center(
                        child: CustomText(
                          text: AppStrings.noDataFound.tr,
                          top: 200.h,
                        ),
                      ),
                ],
              ),
            );
        }
      }),
    );
  }
}
