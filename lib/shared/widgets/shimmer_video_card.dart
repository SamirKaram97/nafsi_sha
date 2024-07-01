import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerVideoCard extends StatelessWidget {
  const ShimmerVideoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.withOpacity(0.2),
      child: AspectRatio(
        aspectRatio: 343 / 281,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
    );
  }
}