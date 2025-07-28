// ignore_for_file: deprecated_member_use

import 'package:event_app/utils/ToastMsg/toast_message.dart';
import 'package:event_app/view/screens/register/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class QueLoginOnboarding extends StatefulWidget {
  const QueLoginOnboarding({super.key});

  @override
  State<QueLoginOnboarding> createState() => _QueLoginOnboardingState();
}

class _QueLoginOnboardingState extends State<QueLoginOnboarding> {
  final OnboardingController controller = Get.find<OnboardingController>();
  int selectedIndex = 4;

  List<int> selectedIndices = [];

  final List<Map<String, String>> purposes = [
    {
      "title": "Getting to know the city 🏙️",
      "subtitle":
          "Discover the city while eating or having a drink with someone.",
    },
    {
      "title": "Follow your trip 🧳",
      "subtitle":
          "Find travel buddies to continue your journey to other cities.",
    },
    {
      "title": "Casual 😁",
      "subtitle": "Meet people who share similar hobbies or interests.",
    },
    {
      "title": "Networking 🤝",
      "subtitle":
          "Connect with people for professional or work-related interests.",
    },
    {
      "title": "Work Out 🏃",
      "subtitle": "Play sports and stay active with others in the city.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  CustomText(
                    text: "Back",
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    left: 8,
                  ),
                ],
              ),

              CustomText(
                top: 40,
                text: "What interests do you have?💘",
                fontSize: 24.w,
                fontWeight: FontWeight.w700,
                maxLines: 2,
              ),

              CustomText(
                top: 40,
                text:
                    "Choose the type of interests you have to connect with people who share them... you choose!",
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: AppColors.softWhite,
                maxLines: 4,
                bottom: 20,
              ),

              // Expanded ListView
              Expanded(
                child: ListView.builder(
                  itemCount: purposes.length,
                  itemBuilder: (context, index) {
                    // final isSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          if (selectedIndices.contains(index)) {
                            selectedIndices.remove(index);
                          } else {
                            selectedIndices.add(index);
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              selectedIndices.contains(index)
                                  ? AppColors.primary
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                selectedIndices.contains(index)
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    purposes[index]['title']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color:
                                          selectedIndices.contains(index)
                                              ? Colors.white
                                              : Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    purposes[index]['subtitle']!,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          selectedIndices.contains(index)
                                              ? Colors.white70
                                              : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      selectedIndices.contains(index)
                                          ? Colors.white
                                          : Colors.grey.shade400,
                                  width: 2,
                                ),
                                color:
                                    selectedIndices.contains(index)
                                        ? Colors.black
                                        : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Next Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: "Next",
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    right: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (selectedIndices.isNotEmpty) {
                        controller.selectedInterests.value =
                            selectedIndices
                                .map(
                                  (index) =>
                                      purposes[index]['title'].toString(),
                                )
                                .toList();

                        debugPrint(controller.selectedInterests.toString());

                        Get.toNamed(AppRoutes.phoneCallLoginOnboard);
                      } else {
                        showCustomSnackBar(
                          'Please select at least one interest.',
                        );
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      maxRadius: 20,
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
