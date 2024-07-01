import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/shadow_box.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerArticleCard extends StatelessWidget {
  const ShimmerArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.withOpacity(0.2),
      child: ShadowBox(
          padding: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.withOpacity(0.2),
                child: AspectRatio(
                  aspectRatio: 384/216,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "      ",

              ),
              const Text(
                "       ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    "            ",
                  ),
                ],
              )
            ],
          )),
    );
  }
}