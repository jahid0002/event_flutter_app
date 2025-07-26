import 'package:event_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class SplashScreen extends StatefulWidget {
//   final Duration delay;

//   const SplashScreen({super.key, this.delay = const Duration(seconds: 3)});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(widget.delay, () {
//       if (mounted) {
//         Get.offAllNamed(AppRoutes.selectedScreen);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text('Splash')));
//   }
// }
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
    return const Scaffold(body: Center(child: Text('Splash Screen')));
  }
}
