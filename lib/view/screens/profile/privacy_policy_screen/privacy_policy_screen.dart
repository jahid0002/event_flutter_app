import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
            CustomText(text: "Privacy Policy", fontSize: 20, fontWeight: FontWeight.w600),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Column(
          children: [
            CustomText(text: "Lorem ipsum dolor sit amet consectetur. . Convallis vel risus egestas ornare proin in. Arcu sodales tempus tellus mattis ac elit hendrerit sapien venenatis id gravida nisl.",
            textAlign: TextAlign.start,
              maxLines: 10,
              fontSize: 14.w,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
