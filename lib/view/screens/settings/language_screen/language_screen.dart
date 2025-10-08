import 'package:event_app/utils/app_colors/app_colors.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/utils/app_strings/app_strings.dart';
import 'package:event_app/view/components/custom_button/custom_button.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:event_app/view/components/custom_text/custom_text.dart';
import 'package:event_app/view/screens/settings/controller/langues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final LanguageController languageController = Get.find<LanguageController>();
  String _tempSelectedLanguage = '';

  @override
  void initState() {
    super.initState();
    _tempSelectedLanguage = languageController.selectedLanguage.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 20),
            const Spacer(),
            CustomImage(
              imageSrc: AppIcons.connection,
              imageColor: AppColors.primary,
            ),
            const SizedBox(width: 6),
            CustomText(
              text: AppStrings.languages.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            // Debug info
            // Obx(
            //   () => Container(
            //     padding: const EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade100,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Column(
            //       children: [
            //         Text(
            //           'Current Language: ${languageController.selectedLanguage.value}',
            //         ),
            //         Text(
            //           'Current Locale: ${languageController.currentLocale.value}',
            //         ),
            //         Text(
            //           'Language Code: ${languageController.currentLanguageCode}',
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //  const SizedBox(height: 20),
            _languageTile('Spanish'),
            const SizedBox(height: 12),
            _languageTile('English'),
            const Spacer(),

            // FIXED: Save Button
            Obx(() {
              final bool isEnabled =
                  _tempSelectedLanguage !=
                  languageController.selectedLanguage.value;

              return CustomButton(
                width: 120,
                height: 45,
                borderRadius: 30,
                onTap: isEnabled ? () => _saveLanguage() : () {}, // Never null
                title: "save".tr,
                fontSize: 16,
                textColor: Colors.white,
                fillColor: isEnabled ? AppColors.primary : Colors.grey,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _languageTile(String language) {
    final bool isSelected = _tempSelectedLanguage == language;

    return GestureDetector(
      onTap: () {
        setState(() {
          _tempSelectedLanguage = language;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00C29E) : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: const Color(0xFF00C29E).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: RadioListTile<String>(
          value: language,
          groupValue: _tempSelectedLanguage,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _tempSelectedLanguage = value;
              });
            }
          },
          contentPadding: EdgeInsets.zero,
          title: Text(
            language,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          activeColor: Colors.white,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    );
  }

  Future<void> _saveLanguage() async {
    try {
      // Show loading dialog
      Get.dialog(
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: AppColors.primary),
                const SizedBox(height: 16),
                Text(
                  'loading'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );

      await languageController.saveLanguage(_tempSelectedLanguage);
      Get.back();

      Get.snackbar(
        'success'.tr,
        'Language changed to $_tempSelectedLanguage successfully',
        backgroundColor: AppColors.primary,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      await Future.delayed(const Duration(milliseconds: 1500));
      Get.back();
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();

      Get.snackbar(
        'error'.tr,
        'Failed to save language',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

// import 'package:event_app/utils/app_colors/app_colors.dart';
// import 'package:event_app/utils/app_icons/app_icons.dart';
// import 'package:event_app/utils/app_strings/app_strings.dart';
// import 'package:event_app/view/components/custom_button/custom_button.dart';
// import 'package:event_app/view/components/custom_image/custom_image.dart';
// import 'package:event_app/view/components/custom_text/custom_text.dart';
// import 'package:event_app/view/screens/profile/settings/controller/langues_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LanguageScreen extends StatefulWidget {
//   const LanguageScreen({super.key});

//   @override
//   State<LanguageScreen> createState() => _LanguageScreenState();
// }

// class _LanguageScreenState extends State<LanguageScreen> {
//   final LanguageController languageController = Get.find<LanguageController>();
//   late String _tempSelectedLanguage; // Temporary selection

//   @override
//   void initState() {
//     super.initState();
//     // Initialize with current language
//     _tempSelectedLanguage = languageController.selectedLanguage.value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         centerTitle: true,
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(width: 20),
//             const Spacer(),
//             CustomImage(
//               imageSrc: AppIcons.connection,
//               imageColor: AppColors.primary,
//             ),
//             const SizedBox(width: 6),
//             CustomText(
//               text: AppStrings.languages.tr,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//             const Spacer(flex: 2),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Column(
//           children: [
//             // Debug info - remove this in production
//             Obx(
//               () => Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade100,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Current Language: ${languageController.selectedLanguage.value}',
//                     ),
//                     Text(
//                       'Current Locale: ${languageController.currentLocale.value}',
//                     ),
//                     Text(
//                       'Language Code: ${languageController.currentLanguageCode}',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Spanish Language Option
//             _languageTile('Spanish'),
//             const SizedBox(height: 12),
//             // English Language Option
//             _languageTile('English'),
//             const Spacer(),

//             // Save Button - Only enable if language changed
//             Obx(
//               () => CustomButton(
//                 width: 120,
//                 height: 45,
//                 borderRadius: 30,
//                 onTap:
//                     _tempSelectedLanguage !=
//                             languageController.selectedLanguage.value
//                         ? _saveLanguage
//                         : null,
//                 title: "save".tr,
//                 fontSize: 16,
//                 textColor: Colors.white,
//                 fillColor:
//                     _tempSelectedLanguage !=
//                             languageController.selectedLanguage.value
//                         ? AppColors.primary
//                         : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _languageTile(String language) {
//     final bool isSelected = _tempSelectedLanguage == language;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _tempSelectedLanguage = language;
//         });
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFF00C29E) : Colors.transparent,
//           borderRadius: BorderRadius.circular(13),
//           border: Border.all(
//             color: isSelected ? Colors.transparent : Colors.grey.shade300,
//             width: 1.5,
//           ),
//           boxShadow:
//               isSelected
//                   ? [
//                     BoxShadow(
//                       color: const Color(0xFF00C29E).withOpacity(0.3),
//                       spreadRadius: 0,
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ]
//                   : null,
//         ),
//         child: RadioListTile<String>(
//           value: language,
//           groupValue: _tempSelectedLanguage,
//           onChanged: (String? value) {
//             if (value != null) {
//               setState(() {
//                 _tempSelectedLanguage = value;
//               });
//             }
//           },
//           contentPadding: EdgeInsets.zero,
//           title: Text(
//             language,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//               fontWeight: FontWeight.w500,
//               fontSize: 16,
//             ),
//           ),
//           activeColor: Colors.white,
//           controlAffinity: ListTileControlAffinity.trailing,
//         ),
//       ),
//     );
//   }

//   Future<void> _saveLanguage() async {
//     try {
//       // Show loading dialog
//       Get.dialog(
//         Center(
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircularProgressIndicator(color: AppColors.primary),
//                 const SizedBox(height: 16),
//                 Text(
//                   'loading'.tr,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         barrierDismissible: false,
//       );

//       // Save the language - this should trigger Get.updateLocale()
//       await languageController.saveLanguage(_tempSelectedLanguage);

//       // Close loading dialog
//       Get.back();

//       // Show success message
//       Get.snackbar(
//         'success'.tr,
//         'language_changed_successfully'.trParams({
//           'language': _tempSelectedLanguage,
//         }),
//         backgroundColor: AppColors.primary,
//         colorText: Colors.white,
//         duration: const Duration(seconds: 2),
//         snackPosition: SnackPosition.BOTTOM,
//         margin: const EdgeInsets.all(16),
//         borderRadius: 8,
//         icon: const Icon(Icons.check_circle, color: Colors.white),
//       );

//       // Wait a moment for the snackbar, then go back
//       await Future.delayed(const Duration(milliseconds: 1500));
//       Get.back();
//     } catch (e) {
//       // Close loading dialog if open
//       if (Get.isDialogOpen ?? false) Get.back();

//       // Show error message
//       Get.snackbar(
//         'error'.tr,
//         'failed_to_save_language'.tr,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         duration: const Duration(seconds: 3),
//         snackPosition: SnackPosition.BOTTOM,
//         margin: const EdgeInsets.all(16),
//         borderRadius: 8,
//         icon: const Icon(Icons.error, color: Colors.white),
//       );
//     }
//   }
// }

// import 'package:event_app/utils/app_strings/app_strings.dart';
// import 'package:event_app/view/components/custom_button/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../utils/app_colors/app_colors.dart';
// import '../../../../../utils/app_icons/app_icons.dart';
// import '../../../../components/custom_image/custom_image.dart';
// import '../../../../components/custom_text/custom_text.dart';

// class LanguageScreen extends StatefulWidget {
//   const LanguageScreen({super.key});

//   @override
//   State<LanguageScreen> createState() => _LanguageScreenState();
// }

// class _LanguageScreenState extends State<LanguageScreen> {
//   String selectedLanguage = 'English';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: BackButton(),
//         centerTitle: true,
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(width: 20),
//             const Spacer(),
//             CustomImage(
//               imageSrc: AppIcons.connection,
//               imageColor: AppColors.primary,
//             ),
//             const SizedBox(width: 6),
//             CustomText(
//               text: AppStrings.languages.tr,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//             const Spacer(flex: 2),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Column(
//           children: [
//             _languageTile('Spanish'),
//             const SizedBox(height: 12),
//             _languageTile('English'),
//             const Spacer(),
//             CustomButton(
//               width: 120,
//               height: 45,
//               borderRadius: 30,
//               onTap: () {},
//               title: "Save",
//               fontSize: 16,
//               textColor: Colors.white,
//               fillColor: AppColors.primary,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _languageTile(String language) {
//     final bool isSelected = selectedLanguage == language;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedLanguage = language;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFF00C29E) : Colors.transparent,
//           borderRadius: BorderRadius.circular(13),
//           border: Border.all(
//             color: isSelected ? Colors.transparent : Colors.grey.shade300,
//           ),
//         ),
//         child: RadioListTile<String>(
//           value: language,
//           groupValue: selectedLanguage,
//           onChanged: (val) {
//             setState(() {
//               selectedLanguage = val!;
//             });
//           },
//           contentPadding: EdgeInsets.zero,
//           title: Text(
//             language,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           activeColor: Colors.black,
//           controlAffinity: ListTileControlAffinity.trailing,
//         ),
//       ),
//     );
//   }
// }
