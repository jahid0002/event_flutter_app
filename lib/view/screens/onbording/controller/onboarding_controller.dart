// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OnboardingController extends GetxController {
  //========= Image Picker GetX Controller Code ===========//

  final Rx<File?> selectedImage = Rx<File?>(null);
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

  var imageFiles = <File>[].obs; // Observable list of File objects

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

  Rx<DateTime?>? leavingDate;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> genderController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;

  RxList<String> selectedInterests = <String>[].obs;
  RxList<String> selectedLanguages = <String>[].obs;
}
