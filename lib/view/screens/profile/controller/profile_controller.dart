// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:io';

import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  Rx<Status> profileStatus = Status.loading.obs;

  Rx<ProfileModel> profileModel = ProfileModel().obs;

  Future<void> getOwnProfile() async {
    var response = await ApiClient.getData(ApiUrl.getOwnProfile);
    if (response.statusCode == 200 || response.statusCode == 201) {
      profileModel.value = ProfileModel.fromMap(response.body['data']);
      profileStatus(Status.completed);
      initAllField(profileModel.value);
    } else {
      profileStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //========================== Update Profile ===============================

  RxList<File> imageFiles = <File>[].obs;

  void addImage(File imageFile) {
    imageFiles.add(imageFile);
  }

  RxList<String> deleteImageUrls = <String>[].obs;
  // Method to remove an image from the list
  void removeImage(int index, String image) {
    if (image.startsWith('http')) {
      deleteImageUrls.add(image);
      profileModel.value.pictures!.removeAt(index);
      profileModel.refresh();
      debugPrint('Image removed at index $deleteImageUrls');
    } else {
      int newIndex = index - (profileModel.value.pictures?.length ?? 0);
      imageFiles.removeAt(newIndex);
    }
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
        addImage(File(file.path));
        // getOwnProfile(); // Add the File to the list
      }
    } else {
      // Handle when no image is picked
      debugPrint("No images selected");
    }
  }

  //=========================== Get Image List Length ========================
  int getImageListLength() {
    return imageFiles.length + (profileModel.value.pictures?.length ?? 0) + 1;
  }

  //============================= All field Init ============================

  initAllField(ProfileModel profileModel) {
    nameController.value.text = profileModel.name ?? '';
    ageController.value.text = profileModel.age?.toString() ?? '';
    genderController.value.text = profileModel.gender ?? '';
    addressController.value.text = profileModel.address ?? '';
    myStayController.value.text = profileModel.checkOutDate?.toString() ?? '';
    bioController.value.text = profileModel.bio ?? '';
    languageController.value.text = profileModel.language?.join(',') ?? '';
    selectedInterests.value = profileModel.interests ?? [];
  }

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> genderController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> myStayController = TextEditingController().obs;
  Rx<TextEditingController> bioController = TextEditingController().obs;
  Rx<TextEditingController> languageController = TextEditingController().obs;
  RxList<String> selectedInterests = <String>[].obs;
  @override
  void onInit() {
    // TO DO: implement onInit
    super.onInit();
    getOwnProfile();
  }
}
