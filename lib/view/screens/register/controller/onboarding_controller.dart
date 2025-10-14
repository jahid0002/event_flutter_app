// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:convert';
import 'dart:io';
import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/shared_prefe/shared_prefe.dart';
import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/profile/model/profile_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class OnboardingController extends GetxController {
  //========= Image Picker GetX Controller Code ===========//

  final ImagePicker _picker = ImagePicker();

  // Pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // Pick an image using the camera
  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  //======================= Get Multiple Image Picker Code ===================//

  // Observable list of File objects

  // Method to add an image to the list
  void addImage(File imageFile) {
    imageFiles.add(imageFile);
  }

  // Method to remove an image from the list
  void removeImage(int index) {
    imageFiles.removeAt(index);
  }

  // Method to get all image files
  List<File> getAllImages() {
    return imageFiles;
  }

  // Method to pick multiple images from the gallery
  Future<void> pickMultipleImages() async {
    final ImagePicker picker = ImagePicker();

    // Pick multiple images
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      // Add each picked image to the list as a File
      for (var file in pickedFiles) {
        addImage(File(file.path)); // Add the File to the list
      }
    } else {
      // Handle when no image is picked
      debugPrint("No images selected");
    }
  }

  //============================== User registration ==============================//
  setLeavingDate(DateTime date) {
    leavingDate = Rx<DateTime>(date);
  }

  initField() async {
    nameController.value.text = await SharePrefsHelper.getString(
      AppConstants.name,
    );
    emailController.value.text = await SharePrefsHelper.getString(
      AppConstants.email,
    );
  }

  RxList<String> languages =
      <String>['English', 'Spanish', 'German', 'French'].obs;

  Rx<TextEditingController> languageController = TextEditingController().obs;

  Rx<DateTime>? leavingDate;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> genderController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;

  RxList<String> selectedInterests = <String>[].obs;
  RxList<String> selectedLanguages = <String>[].obs;
  RxList<File> imageFiles = <File>[].obs;
  final Rx<File?> selectedImage = Rx<File?>(null);
  // Rx<DateTime>? selectedLustDate; // Add this line

  RxBool userRegistered = false.obs;

  Future<void> userRegistration() async {
    userRegistered(true);

    num age = num.parse(ageController.value.text);

    Map<String, String> body = {
      'data': jsonEncode({
        "name": nameController.value.text,
        "bio": "",
        "gender": genderController.value.text,
        "age": age,
        "address": countryController.value.text,
        "interests": selectedInterests,
        "language": selectedLanguages,

        "checkOutDate": leavingDate?.value.toUtc().toIso8601String(),
      }),
    };

    var response = await ApiClient.postMultipartData(
      ApiUrl.register,
      body,
      multipartBody: [...imageFiles.map((e) => MultipartBody('pictures', e))],
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      SharePrefsHelper.setBool(AppConstants.isRegistered, true);

      getOwnProfile();
      //  Get.offAllNamed(AppRoutes.homeScreen);
      //  Get.offAllNamed(AppRoutes.welcomeHotelScreen);
    } else {
      userRegistered(false);
      ApiChecker.checkApi(response);
    }
  }

  Rx<Status> profileStatus = Status.loading.obs;

  Rx<ProfileModel> profileModel = ProfileModel().obs;
  Future<void> getOwnProfile() async {
    var response = await ApiClient.getData(ApiUrl.getOwnProfile);
    userRegistered(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      profileModel.value = ProfileModel.fromMap(response.body['data']);
      profileStatus(Status.completed);

      SharePrefsHelper.setString(AppConstants.userId, profileModel.value.id);
      SharePrefsHelper.setString(
        AppConstants.hotelName,
        profileModel.value.hotel?.name ?? '',
      );

      final String? hotelName = await SharePrefsHelper.getString(
        AppConstants.hotelName,
      );
      debugPrint(
        '============================================== >>>> Hotel Name: $hotelName',
      );
      Get.offAllNamed(AppRoutes.welcomeHotelScreen);
    } else {
      profileStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  String formatToUtcIsoString(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String();
  }

  String formatDate(DateTime date) {
    return DateFormat('d MMM').format(date);
  }
}
