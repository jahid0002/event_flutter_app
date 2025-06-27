// // ignore_for_file: prefer_const_constructors
// import 'package:dance_club_app/utils/app_colors/app_colors.dart';
// import 'package:dance_club_app/utils/app_strings/app_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomRoyelDropdown extends StatefulWidget {
//   final double height;
//   final double? width;
//   final Color? fillColor;
//   final Color textColor;
//   final String? title;

//   final double marginVertical;
//   final double marginHorizontal;
//   final bool isBorder;
//   final double? fontSize;
//   final double? borderWidth;
//   final double? borderRadius;
//   final void Function(String?)? onChange;

//   const CustomRoyelDropdown(
//       {this.height = 55,
//       this.width = double.maxFinite,
//       this.title,
//       this.marginVertical = 0,
//       this.marginHorizontal = 0,
//       this.fillColor = AppColors.white,
//       this.textColor = AppColors.black,
//       this.isBorder = false,
//       this.fontSize,
//       this.borderWidth,
//       this.borderRadius,
//       super.key,
//       this.onChange});

//   @override
//   State<CustomRoyelDropdown> createState() => _CustomRoyelDropdownState();
// }

// class _CustomRoyelDropdownState extends State<CustomRoyelDropdown> {
//   // final CustomController customController = Get.find<CustomController>();

//   String title = AppStrings.gender;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Container(
//         alignment: Alignment.center,
//         height: widget.height,
//         width: widget.width,
//         padding: EdgeInsets.only(left: 10.w),
//         decoration: BoxDecoration(
//           border: widget.isBorder
//               ? Border.all(
//                   color: widget.textColor, width: widget.borderWidth ?? .05)
//               : null,
//           borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
//           color: widget.fillColor,
//         ),
//         child: DropdownButton<String>(
//           padding: EdgeInsets.only(right: 20),
//           hint: CustomText(
//             text: widget.title ?? title,
//             fontSize: widget.fontSize ?? 18.sp,
//             color: widget.textColor,
//             fontWeight: FontWeight.w500,
//             right: 15.w,
//           ),
//           borderRadius: BorderRadius.circular(10),
//           elevation: 2,
//           dropdownColor: AppColors.black_80,
//           icon: const Icon(
//             Icons.keyboard_arrow_down_rounded,
//             color: AppColors.white,
//           ),
//           iconSize: 25,
//           underline: const SizedBox(),
//           isExpanded: true, // This makes the dropdown full-width
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontSize: 12.w,
//           ),
//           // value: customController.cetagoryList.value,
//           onChanged: widget.onChange,
//           items: customController.cetagoryList.map((String item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               onTap: () {
//                 widget.onChange!(item);
//                 title = item;
//                 setState(() {});
//               },
//               child: CustomText(
//                 text: item,
//                 color: AppColors.white,
//                 fontSize: 15.w,
//                 fontWeight: FontWeight.w500,
//               ),
//             );
//           }).toList(),
//         ),
//       );
//     });
//   }
// }
