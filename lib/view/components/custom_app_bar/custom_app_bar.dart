import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.backgroundColor = Colors.white,
    this.elevation = 0.0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leading ?? const BackButton(),
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
          CustomText(text: title, fontSize: 16, fontWeight: FontWeight.w700),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
