import 'package:event_app/utils/ToastMsg/toast_message.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/screens/register/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_text/custom_text.dart';

class TalkToMeLoginOnboarding extends StatefulWidget {
  const TalkToMeLoginOnboarding({super.key});

  @override
  State<TalkToMeLoginOnboarding> createState() =>
      _TalkToMeLoginOnboardingState();
}

class _TalkToMeLoginOnboardingState extends State<TalkToMeLoginOnboarding> {
  final OnboardingController controller = Get.find<OnboardingController>();
  // String selectedLanguage = 'English';

  List<String> selectedLanguages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
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
                  text: "What languages do you speak? 🌍",
                  fontSize: 24.w,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                ),
                CustomText(
                  top: 40,
                  text:
                      "Choose your language to start connecting your way. Select at least 1, and as many as you want.\n\nSelect at least 1, and as many as you want.",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                  color: AppColors.softWhite,
                  maxLines: 4,
                  bottom: 50,
                ),

                Obx(() {
                  return Column(
                    children: List.generate(controller.languages.length, (
                      index,
                    ) {
                      return Column(
                        children: [
                          _languageTile(
                            controller.languages[index],
                            isSelected: selectedLanguages.contains(
                              controller.languages[index],
                            ),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      );
                    }),
                  );
                }),
                // _languageTile(
                //   'English',
                //   isSelected: selectedLanguages.contains('English'),
                // ),
                // const SizedBox(height: 12),
                // _languageTile(
                //   'Spanish',
                //   isSelected: selectedLanguages.contains('Spanish'),
                // ),
                // const SizedBox(height: 12),
                // _languageTile(
                //   'German',
                //   isSelected: selectedLanguages.contains('German'),
                // ),
                // const SizedBox(height: 12),
                // _languageTile(
                //   'French',
                //   isSelected: selectedLanguages.contains('French'),
                // ),
                SizedBox(height: 20),
                TextField(controller: controller.languageController.value),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: CustomText(
                        text:
                            "Type the language and tap 'add' to save it to your profile.",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        color: Color(0xff828693),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomButton(
                        onTap: () {
                          if (controller
                              .languageController
                              .value
                              .text
                              .isNotEmpty) {
                            setState(() {
                              controller.languages.add(
                                controller.languageController.value.text,
                              );
                            });
                            controller.languageController.value.clear();
                          }
                        },
                        title: "add",
                        height: 30,
                        width: 60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                // Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
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
                if (selectedLanguages.isEmpty) {
                  showCustomSnackBar("Please select at least one language");
                  return;
                }
                controller.selectedLanguages.value = selectedLanguages;
                debugPrint(controller.selectedLanguages.toString());
                Get.toNamed(AppRoutes.showYourBestSelf);
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

  Widget _languageTile(String language, {bool isSelected = false}) {
    //  final bool isSelected = selectedLanguages.contains(language);
    return GestureDetector(
      onTap: () {
        setState(() {
          //selectedLanguage = language;
          if (selectedLanguages.contains(language)) {
            selectedLanguages.remove(language);
          } else {
            selectedLanguages.add(language);
          }
        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 60.h,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
          ),
        ),
        child: CustomText(
          text: language,

          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          // textAlign: ,
        ),
        // child: RadioListTile<String>(
        //   value: language,
        //   groupValue: language,
        //   onChanged: (val) {
        //     setState(() {
        //       if (selectedLanguages.contains(val)) {
        //         selectedLanguages.remove(val);
        //       } else {
        //         selectedLanguages.add(val!);
        //       }
        //     });
        //   },
        //   contentPadding: EdgeInsets.zero,
        //   title: Text(
        //     language,
        //     style: TextStyle(
        //       color: isSelected ? Colors.white : Colors.black,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        //   activeColor: Colors.black,
        //   controlAffinity: ListTileControlAffinity.trailing,
        // ),
      ),
    );
  }
}
