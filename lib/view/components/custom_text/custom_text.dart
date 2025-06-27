import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.black,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.textType,
    this.textDecorationColor,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final TextType? textType;
  final Color? textDecorationColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLines,
        overflow: overflow,
        style: GoogleFonts.openSans(
          fontSize: textType != null ? setFonteSize(textType!) : fontSize.w,
          fontWeight: textType != null ? setFontWeight(textType!) : fontWeight,
          color: color,
          decoration: decoration,
          decorationColor: textDecorationColor ?? Colors.black,
          decorationThickness: 2,
        ),
      ),
    );
  }

  double setFonteSize(TextType type) {
    switch (type) {
      case TextType.title:
        return 16.w;

      case TextType.subTitle:
        return 12.w;
      case TextType.discription:
        return 10.w;
      case TextType.small:
        return 14.w;
      case TextType.h5:
        return 14.w;
      case TextType.h6:
        return 14.w;
      case TextType.h15500:
        return 15.w;
      case TextType.h13500:
        return 13.w;
      case TextType.h12500:
        return 12.w;
      case TextType.h16600:
        return 16.w;
    }
  }

  setFontWeight(TextType type) {
    switch (type) {
      case TextType.title:
        return FontWeight.w500;

      case TextType.subTitle:
        return FontWeight.w400;
      case TextType.discription:
        return FontWeight.w400;
      case TextType.small:
        return FontWeight.w400;
      case TextType.h5:
        return FontWeight.w500;
      case TextType.h6:
        return FontWeight.w600;
      case TextType.h15500:
        return FontWeight.w500;
      case TextType.h13500:
        return FontWeight.w500;
      case TextType.h12500:
        return FontWeight.w500;
      case TextType.h16600:
        return FontWeight.w600;
    }
  }
}

enum TextType {
  title,
  subTitle,
  discription,
  small,
  h5,
  h6,
  h15500,
  h13500,
  h12500,
  h16600,
}
