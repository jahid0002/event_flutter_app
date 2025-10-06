import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static const String _languageKey = 'selected_language';

  // Available languages for the app
  static final Map<String, Locale> availableLanguages = {
    'English': const Locale('en', 'US'),
    'Spanish': const Locale('es', 'ES'),
  };

  // Language and locale variables
  var selectedLanguage = 'English'.obs;
  var currentLocale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    // You can keep loadSavedLanguage() here or use initializeLocale() from main()
    loadSavedLanguage();
  }

  // ADD THIS METHOD: Initialize locale (can be called from main())
  Future<void> initializeLocale() async {
    await loadSavedLanguage();
  }

  // Load saved language from SharedPreferences
  Future<void> loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString(_languageKey) ?? 'English';

      selectedLanguage.value = savedLanguage;
      currentLocale.value = _getLocaleFromLanguage(savedLanguage);

      // Update GetX locale - Add delay to ensure widget tree is ready
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.updateLocale(currentLocale.value);
      });

      debugPrint('Language loaded: $savedLanguage');
      debugPrint('Locale set to: ${currentLocale.value}');
    } catch (e) {
      debugPrint('Error loading saved language: $e');
      // Set default values in case of error
      selectedLanguage.value = 'English';
      currentLocale.value = const Locale('en', 'US');
    }
  }

  // Save selected language to SharedPreferences
  // Future<void> saveLanguage(String language) async {
  //   try {
  //     // Validate language
  //     if (!availableLanguages.containsKey(language)) {
  //       debugPrint('Invalid language: $language');
  //       return;
  //     }

  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString(_languageKey, language);

  //     selectedLanguage.value = language;
  //     currentLocale.value = _getLocaleFromLanguage(language);

  //     // Update GetX locale
  //     Get.updateLocale(currentLocale.value);

  //     debugPrint('Language saved and updated: $language');
  //     debugPrint('Current locale: ${currentLocale.value}');

  //     // Force UI rebuild if needed
  //     update();
  //   } catch (e) {
  //     debugPrint('Error saving language: $e');
  //     // Show error to user if needed
  //     Get.snackbar(
  //       'Error'.tr,
  //       'Failed to change language'.tr,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }.

  Future<void> saveLanguage(String language) async {
    try {
      // Validate language
      if (!availableLanguages.containsKey(language)) {
        debugPrint('Invalid language: $language');
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, language);

      // Update the observable values
      selectedLanguage.value = language;
      currentLocale.value = _getLocaleFromLanguage(language);

      // CRITICAL: Update GetX locale - this triggers app-wide language change
      await Get.updateLocale(currentLocale.value);

      // Force UI to rebuild
      update();

      debugPrint('Language saved and updated: $language');
      debugPrint('Current locale: ${currentLocale.value}');
    } catch (e) {
      debugPrint('Error saving language: $e');
      Get.snackbar(
        'Error'.tr,
        'Failed to change language'.tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Convert language name to Locale
  Locale _getLocaleFromLanguage(String language) {
    return availableLanguages[language] ?? const Locale('en', 'US');
  }

  // Get available languages list
  List<String> get availableLanguageNames {
    return availableLanguages.keys.toList();
  }

  // Helper method to get current language code for debugging
  String get currentLanguageCode {
    return currentLocale.value.languageCode;
  }

  // Check if a language is currently selected
  bool isLanguageSelected(String language) {
    return selectedLanguage.value == language;
  }

  // Get the display name for the current language
  String get currentLanguageDisplay {
    return selectedLanguage.value;
  }
}
