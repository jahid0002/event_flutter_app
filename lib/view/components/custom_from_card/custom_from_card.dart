import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';
import '../custom_text_field/custom_text_field.dart';

class CustomFormCard extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool? hasSuffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool hasBackgroundColor;
  final bool isMultiLine;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLine;
  final double? fontSize;
  final Color? titleColor;
  final TextInputType? keyboardType;

  const CustomFormCard({
    super.key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.hasSuffixIcon,
    this.readOnly = false,
    this.onTap,
    this.hasBackgroundColor = false,
    this.isMultiLine = false,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.maxLine,
    this.fontSize,
    this.titleColor,
    this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: titleColor ?? AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 16.w,
          bottom: 12.h,
          maxLines: 2,
        ),
        CustomTextField(
          isDens: true,
          cursorColor: AppColors.black,
          prefixIcon: prefixIcon,
          validator: validator,
          readOnly: readOnly,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            // ignore: deprecated_member_use
            color: AppColors.gray.withOpacity(.8),
          ),
          suffixIcon: suffixIcon,
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: GoogleFonts.poppins(color: AppColors.black),
          fillColor:
              hasBackgroundColor
                  ? AppColors.naveWhite
                  // ignore: deprecated_member_use
                  : AppColors.white,
          // ignore: deprecated_member_use
          fieldBorderColor: Colors.transparent,
          keyboardType:
              keyboardType ??
              (isPassword ? TextInputType.visiblePassword : TextInputType.text),
          onTap: onTap,
          maxLines: isPassword ? 1 : maxLine,
          fieldBorderRadius: 8,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
