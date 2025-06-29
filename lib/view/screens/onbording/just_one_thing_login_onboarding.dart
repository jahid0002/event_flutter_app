import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/onbording/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
// import '../../../core/routes/app_routes.dart';

class JustOneThingLoginOnboarding extends StatefulWidget {
  const JustOneThingLoginOnboarding({super.key});

  @override
  State<JustOneThingLoginOnboarding> createState() =>
      _JustOneThingLoginOnboardingState();
}

class _JustOneThingLoginOnboardingState
    extends State<JustOneThingLoginOnboarding> {
  final OnboardingController controller = Get.find<OnboardingController>();

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
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
                ),

                // Heading
                CustomText(
                  top: 40,
                  text: "All set! Just one last thing…",
                  fontSize: 24.w,
                  fontWeight: FontWeight.w700,
                ),

                // Subtext
                CustomText(
                  top: 10,
                  bottom: 30,
                  text:
                      "Make sure your check-out date is correct. Your profile will disappear that day",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                  color: AppColors.softWhite,
                  maxLines: 2,
                ),

                // Centered Image
                Center(
                  child: CustomImage(
                    imageSrc: AppIcons.lustImage,
                    height: 100,
                    width: 100,
                  ),
                ),

                SizedBox(height: 40),

                // Calendar
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(onTap: () {}, title: "Okey"),
                SizedBox(height: 10),
                // Next Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: "Finish",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        right: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.homeScreen);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          maxRadius: 20,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
