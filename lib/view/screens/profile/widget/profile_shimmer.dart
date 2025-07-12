// ignore_for_file: deprecated_member_use

import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/app_colors/app_colors.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top profile section shimmer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      BackButton(),
                      const SizedBox(width: 30),
                      const Spacer(),
                      CustomImage(
                        imageSrc: AppIcons.connection,
                        imageColor: AppColors.primary,
                      ),
                      const SizedBox(width: 6),
                      CustomText(
                        text: "Profile",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Profile image shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                _shimmerBox(width: 120, height: 20),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // List item shimmers
          _shimmerListTile(),
          _shimmerListTile(),
          _shimmerListTile(),
        ],
      ),
    );
  }

  Widget _shimmerBox({double width = double.infinity, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(width: width, height: height, color: Colors.white),
    );
  }

  Widget _shimmerListTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(width: 24, height: 24, color: Colors.white),
                const SizedBox(width: 10),
                Container(width: 100, height: 16, color: Colors.white),
                const Spacer(),
                Container(width: 16, height: 16, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
