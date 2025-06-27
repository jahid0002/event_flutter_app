import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';
class CustomSettingsListCard extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  final Color? color;
  const CustomSettingsListCard({super.key,this.text, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0, right: 10, left: 10),
        child: Card(
          color: AppColors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CustomText(text: text ?? "Profile", fontSize: 16, fontWeight: FontWeight.w500,left: 8,color: color ?? Colors.black,),
                const Spacer(),
                CustomImage(imageSrc: AppIcons.backArrow, imageColor: color),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
