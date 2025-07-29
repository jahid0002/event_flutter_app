import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MessageShimmer extends StatelessWidget {
  const MessageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 8,
      itemBuilder: (context, index) {
        final isSender = index % 2 == 0;

        return Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(14),
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isSender ? 16 : 0),
                  bottomRight: Radius.circular(isSender ? 0 : 16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 12, width: 80, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(height: 10, width: 50, color: Colors.white),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
