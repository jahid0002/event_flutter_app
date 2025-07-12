// ignore_for_file: deprecated_member_use

import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImagecard(imagePath: AppConstants.boyPhoto),
                  CustomImagecard(),
                  CustomImagecard(),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImagecard(),
                  CustomImagecard(),
                  CustomImagecard(),
                ],
              ),
              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: CustomFormCard(
                      hintText: 'John Doe',
                      title: 'Name',
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomFormCard(
                      hintText: '25',
                      title: 'Age',
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      suffixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              CustomFormCard(
                title: 'Gender',
                controller: TextEditingController(),
                hintText: 'Male',
                readOnly: true,
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              CustomFormCard(
                title: 'Living in',
                controller: TextEditingController(),
                hintText: 'Enter your country',
              ),
              CustomFormCard(
                title: 'My stay',
                controller: TextEditingController(),
                hintText: '25/10/1992',
                suffixIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.primary,
                ),
              ),
              CustomFormCard(
                title: 'About me',
                controller: TextEditingController(),
                maxLine: 4,
                hintText:
                    'Figma ipsum component variant main layer. Scrolling frame shadow opacity draft stroke content. Move layout background',
              ),
              CustomFormCard(
                title: 'Languages',
                controller: TextEditingController(),
                hintText: 'Spanish',
                readOnly: true,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primary,
                ),
              ),
              CustomText(
                text: 'My interests',
                fontSize: 16.w,
                fontWeight: FontWeight.w600,
                bottom: 10.h,
                textAlign: TextAlign.start,
              ),
              InterestsSelector(),
              SizedBox(height: 20.h),
              Center(
                child: CustomButton(
                  //fillColor: AppColors.primary,
                  onTap: () {},
                  height: 40.h,
                  width: 174.w,
                  title: 'Save',
                  borderRadius: 10.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomImagecard extends StatelessWidget {
  const CustomImagecard({super.key, this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 108.w,
          height: 155.h,
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              imagePath != null
                  ? CustomNetworkImage(
                    borderRadius: BorderRadius.circular(10),
                    imageUrl: AppConstants.profileImage,
                    height: 155.h,
                    width: 108.w,
                  )
                  : SizedBox(),
        ),

        Positioned(
          right: -8,
          bottom: -8,

          child: Card(
            elevation: 5,
            color: Colors.transparent,
            child: Container(
              height: 31.h,
              width: 31.w,
              decoration: BoxDecoration(
                color: imagePath != null ? AppColors.white : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                imagePath != null ? Icons.close : Icons.add,
                color: imagePath != null ? AppColors.primary : AppColors.white,
                size: 25.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InterestsSelector extends StatefulWidget {
  const InterestsSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InterestsSelectorState createState() => _InterestsSelectorState();
}

class _InterestsSelectorState extends State<InterestsSelector> {
  final List<String> interests = [
    "Workout 🏃‍♂️",
    "Casual 😄",
    "Networking 🤝",
    "Follow your trip 🧳",
    "Getting to know the city 🍽️",
  ];

  final Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(interests.length, (index) {
        final isSelected = selectedIndexes.contains(index);
        return ChoiceChip(
          label: Text(
            interests[index],
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
              color:
                  isSelected
                      ? AppColors.primary
                      : AppColors.gray.withOpacity(.5),
            ),
          ),
          selected: isSelected,
          selectedColor: AppColors.primary.withOpacity(0.1),
          backgroundColor: AppColors.white,
          shape: StadiumBorder(
            side: BorderSide(
              color: isSelected ? AppColors.primary : Colors.grey.shade400,
              width: 1.8,
            ),
          ),
          onSelected: (selected) {
            setState(() {
              if (selected) {
                selectedIndexes.add(index);
              } else {
                selectedIndexes.remove(index);
              }
            });
          },
        );
      }),
    );
  }
}
