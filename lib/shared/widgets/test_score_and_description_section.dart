import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/test_score_slider.dart';

import '../styles/styles.dart';
import 'description_box.dart';

class TestScoreAndDescriptionSection extends StatelessWidget {
  const TestScoreAndDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 22, vertical: 35),
      decoration: ShapeDecoration(
        color: const Color(0xFFFDF3E9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Column(
        children: [
          //box header text
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Depression Test Score",
                style: AppStyles.mBold26(context),
              )),

          //space
          const SizedBox(
            height: 20,
          ),

          //TestScoreSlider
          const TestScoreSlider(),

          //space
          const SizedBox(
            height: 20,
          ),

          //description Box
          const DescriptionBox()
        ],
      ),
    );
  }
}