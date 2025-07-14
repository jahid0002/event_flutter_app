// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_app/view/components/custom_popupmenu_button/custom_popupmenu_button.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final ProfileController controller = Get.find<ProfileController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();
    controller.getOwnProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Obx(() {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.getImageListLength(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: .7,
                    ),
                    itemBuilder: (context, index) {
                      List<String> images = [
                        ...(controller.profileModel.value.pictures ?? []),
                        ...controller.imageFiles.map((e) => e.path),
                      ];
                      debugPrint(images.length.toString());
                      // final image = images[index];
                      return CustomImagecard3(
                        addbutton: () {
                          controller.pickMultipleImages();
                        },
                        removeButton: () {
                          controller.removeImage(index, images[index]);
                        },
                        imagePath:
                            images.length == index ? null : images[index],
                      );
                    },
                  ),
                  SizedBox(height: 20.h),

                  Row(
                    children: [
                      Expanded(
                        child: CustomFormCard(
                          hintText: 'John Doe',
                          title: 'Name',
                          controller: controller.nameController.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomFormCard(
                          hintText: '25',
                          title: 'Age',
                          controller: controller.ageController.value,
                          keyboardType: TextInputType.number,
                          suffixIcon: Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.primary,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  CustomFormCard(
                    title: 'Gender',
                    controller: controller.genderController.value,
                    hintText: 'MALE',
                    readOnly: true,
                    suffixIcon: CustomPopupmenuButton(
                      onChanged: (value) {
                        controller.genderController.value.text = value;
                      },
                      items: ["MALE", "FEMALE"],
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your gender';
                      }
                      return null;
                    },
                  ),
                  CustomFormCard(
                    title: 'Living in',
                    controller: controller.addressController.value,
                    hintText: 'Enter your country',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  CustomFormCard(
                    title: 'My stay',
                    controller: controller.myStayController.value,
                    hintText: '25/10/1992',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // controller.selectDate();
                      },
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  CustomFormCard(
                    title: 'About me',
                    controller: controller.bioController.value,
                    maxLine: 4,
                    hintText:
                        'Enter a short description about yourself and your interests',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your bio';
                      }
                      return null;
                    },
                  ),
                  CustomFormCard(
                    title: 'Languages',
                    controller: controller.languageController.value,
                    hintText: 'Spanish',
                    readOnly: true,
                    suffixIcon: CustomPopupmenuButton(
                      onChanged: (value) {
                        controller.languageController.value.text = value;
                      },
                      items: ["Spanish", "English"],
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
            );
          }),
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
  final ProfileController controller = Get.find<ProfileController>();
  final List<String> interests = [
    "Workout 🏃‍♂️",
    "Casual 😄",
    "Networking 🤝",
    "Follow your trip 🧳",
    "Getting to know the city 🍽️",
  ];

  //final Set<in> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(interests.length, (index) {
        final isSelected = controller.selectedInterests.contains(
          interests[index],
        );
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
            if (selected) {
              controller.selectedInterests.add(interests[index]);
            } else {
              controller.selectedInterests.remove(interests[index]);
            }

            debugPrint("${controller.selectedInterests}");
          },
        );
      }),
    );
  }
}

class CustomImagecard3 extends StatelessWidget {
  const CustomImagecard3({
    super.key,
    this.imagePath,
    this.addbutton,
    this.removeButton,
  });

  final String? imagePath;
  final VoidCallback? addbutton;
  final VoidCallback? removeButton;

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
                  ? imagePath!.startsWith('http')
                      ? CustomNetworkImage(
                        imageUrl: imagePath!,
                        height: 155.h,
                        width: 108.w,
                        // boxShape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10),
                      )
                      : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(imagePath!),
                          height: 155.h,
                          width: 108.w,
                          fit: BoxFit.cover,
                        ),
                      )
                  : SizedBox(),
        ),

        Positioned(
          right: -8,
          bottom: -8,

          child: GestureDetector(
            onTap: imagePath == null ? addbutton : removeButton,
            child: Card(
              elevation: 5,
              color: Colors.transparent,
              child: Container(
                height: 31.h,
                width: 31.w,
                decoration: BoxDecoration(
                  color:
                      imagePath != null ? AppColors.white : AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  imagePath != null ? Icons.close : Icons.add,
                  color:
                      imagePath != null ? AppColors.primary : AppColors.white,
                  size: 25.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
