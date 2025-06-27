import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/routes/app_routes.dart';
import '../../components/custom_text/custom_text.dart';

class CalenderLoginOnboarding extends StatefulWidget {
  const CalenderLoginOnboarding({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeavingDateScreenState createState() => _LeavingDateScreenState();
}

class _LeavingDateScreenState extends State<CalenderLoginOnboarding> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
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
            CustomText(
              top: 40,
              text: "When are you leaving? ✈️",
              fontSize: 24.w,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              top: 10,
              text:
                  "Tell us your check-out dates to connect with guests staying at the same time.",
              fontSize: 14.w,
              fontWeight: FontWeight.w400,
              color: AppColors.softWhite,
              maxLines: 2,
            ),
            SizedBox(height: 24),
            // Calendar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
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
            ),

            SizedBox(height: 24),
            // Emoji message
            Text("🖋️😉", style: TextStyle(fontSize: 24)),
            CustomText(
              text: "Double-check your dates...",
              fontSize: 16.w,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
            CustomText(
              text:
                  "As soon as you check out,\nyour profile magically disappears too.",
              fontSize: 16.w,
              fontWeight: FontWeight.w500,
              color: AppColors.softWhite,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 20),
              child: Row(
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
                      Get.toNamed(AppRoutes.yourNameLoginOnboarding);
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
    );
  }
}
