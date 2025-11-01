import 'package:event_app/utils/ToastMsg/toast_message.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/screens/profile/controller/profile_controller.dart';
import 'package:event_app/view/screens/register/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class AgeLoginOnboarding extends StatefulWidget {
  const AgeLoginOnboarding({super.key});

  @override
  State<AgeLoginOnboarding> createState() => _AgeLoginOnboardingState();
}

class _AgeLoginOnboardingState extends State<AgeLoginOnboarding> {
  // final TextEditingController _controller = TextEditingController();
  // final FocusNode _focusNode = FocusNode();

  final OnboardingController controller = Get.find<OnboardingController>();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TO DO: implement initState

    profileController.getOwnProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Back Button
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
                    text: AppStrings.back.tr,
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    left: 8,
                  ),
                ],
              ),
              CustomText(
                top: 40,
                text: AppStrings.howOldAreYou.tr,
                fontSize: 24.w,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                top: 10,
                //top: 40,
                text: "Must be 18 or older / Obligatorio 18 o más",
                fontSize: 24.w,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                top: 10,
                text: AppStrings.ageInfo.tr,
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: AppColors.softWhite,
                maxLines: 4,
                bottom: 180,
              ),
              CustomTextFieldForAge(
                fillColor: Color(0xffF9FAFB),
                hintText: AppStrings.enterYourAge.tr,
              ),

              SizedBox(height: 8),
              Text(
                AppStrings.agePublic.tr,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              //Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: AppStrings.next.tr,
              fontSize: 16.w,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              right: 8,
            ),
            GestureDetector(
              onTap: () {
                if (controller.ageController.value.text.isNotEmpty) {
                  debugPrint("age ${controller.ageController.value.text}");

                  Get.toNamed(AppRoutes.genderLoginOnboarding);
                } else {
                  showCustomSnackBar(AppStrings.pleaseEnterYourAge.tr);
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
      ),
    );
  }
}

class CustomTextFieldForAge extends StatefulWidget {
  final Color fillColor;
  final String hintText;

  const CustomTextFieldForAge({
    super.key,
    required this.fillColor,
    required this.hintText,
  });

  @override
  State<CustomTextFieldForAge> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldForAge> {
  final TextEditingController _controller = TextEditingController();
  final OnboardingController controller = Get.find<OnboardingController>();
  int? selectedNumber;

  void _showNumberPicker() async {
    final pickedNumber = await showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return NumberPickerCarousel(
          initialNumber: selectedNumber ?? 22,
          min: 18,
          max: 150,
        );
      },
    );

    if (pickedNumber != null) {
      setState(() {
        selectedNumber = pickedNumber;
        _controller.text = pickedNumber.toString();
        controller.ageController.value.text = pickedNumber.toString();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: true,
      onTap: _showNumberPicker,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        suffixIcon: Icon(Icons.arrow_drop_down),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class NumberPickerCarousel extends StatefulWidget {
  final int initialNumber;
  final int min;
  final int max;

  const NumberPickerCarousel({
    super.key,
    required this.initialNumber,
    required this.min,
    required this.max,
  });

  @override
  State<NumberPickerCarousel> createState() => _NumberPickerCarouselState();
}

class _NumberPickerCarouselState extends State<NumberPickerCarousel> {
  late FixedExtentScrollController _scrollController;
  late int currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialNumber.clamp(widget.min, widget.max);
    _scrollController = FixedExtentScrollController(
      initialItem: currentValue - widget.min,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onSelectedItemChanged(int index) {
    setState(() {
      currentValue = widget.min + index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: "Select Age",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            bottom: 10.h,
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: _scrollController,
              itemExtent: 50,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: _onSelectedItemChanged,
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  if (index < 0 || index > widget.max - widget.min) return null;
                  int number = widget.min + index;
                  return Center(
                    child: CustomText(
                      text: number.toString(),

                      fontSize: 24,
                      color:
                          number == currentValue
                              ? AppColors.primary
                              : AppColors.gray,
                      fontWeight:
                          number == currentValue
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () => Navigator.of(context).pop(currentValue),
            child: CustomText(
              text: "Confirm",
              fontSize: 14.w,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
