// ignore_for_file: prefer_const_constructors

import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/screens/chat/chat_screen.dart';
import 'package:event_app/view/screens/connections/connections_screen.dart';
import 'package:event_app/view/screens/home/home_screen.dart';
import 'package:event_app/view/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var bottomNavIndex = 0;

  List<String> unselectedIcon = [
    AppIcons.home,
    AppIcons.connection,
    AppIcons.chat,
    AppIcons.parson,
  ];

  List<IconData> icons = [Icons.language, Icons.person];
  List<IconData> icons2 = [Icons.language_outlined, Icons.person_outline];

  List<String> selectedIcon = [
    AppIcons.home,
    AppIcons.connection,
    AppIcons.chat,
    AppIcons.parson,
  ];
  final List<String> userNavText = [
    // AppStrings.home,
    // AppStrings.rewards,
    // AppStrings.donation,
    // AppStrings.profile
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 22.h),
      // alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          unselectedIcon.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: Column(
              children: [
                CustomImage(
                  imageSrc:
                      index == bottomNavIndex
                          ? selectedIcon[index]
                          : unselectedIcon[index],
                  height: 30.h,
                  width: 30.w,
                  imageColor:
                      index == bottomNavIndex
                          ? AppColors.primary
                          : AppColors.gray,
                ),
                // CustomText(
                //   textAlign: TextAlign.center,
                //   text: userNavText[index],
                //   color:
                //       index == bottomNavIndex
                //           ? AppColors.primary
                //           : AppColors.black,
                //   fontSize: 12.w,
                //   fontWeight: FontWeight.w400,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index == 0 && widget.currentIndex != 0) {
      Get.offAll(() => HomeScreen());
    } else if (index == 3 && widget.currentIndex != 3) {
      Get.to(() => ProfileScreen());
    } else if (index == 1 && widget.currentIndex != 1) {
      Get.to(() => ConnectionsScreen());
    } else if (index == 2 && widget.currentIndex != 2) {
      Get.to(() => ChatScreen());
    }
  }
}
