import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  const VerticalGap({super.key, this.height = 20});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 20);
  }
}
