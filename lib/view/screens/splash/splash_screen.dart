import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/utils/app_icons/app_icons.dart';
import 'package:event_app/view/components/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.selectedScreen);
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer to prevent test failure
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomImage(imageSrc: AppIcons.logo2)),
    );
  }
}
