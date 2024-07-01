import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/shared/widgets/test_score_slider.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';
import 'description_box.dart';

class TestScoreAndDescriptionSection extends StatelessWidget {
  const TestScoreAndDescriptionSection({super.key, required this.finalScore, required this.testIndex});
  final int finalScore;
  final int testIndex;
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
                TestsCubit.get(context).tests[testIndex].title,
                style: AppStyles.mBold26(context),
              )),

          //space
          const SizedBox(
            height: 20,
          ),

          //TestScoreSlider
            TestScoreSlider(finalScore: finalScore,testIndex: testIndex),
          // min and max value
          // Row(children: [
          //   Text("0",style: AppStyles.mBold18(context).copyWith(color: AppColors.primaryColor),),
          //   const Spacer(),
          //   Text("100",style: AppStyles.mBold18(context).copyWith(color: AppColors.primaryColor)),
          // ],),

          //space
          const SizedBox(
            height: 20,
          ),

          //description Box
           DescriptionBox(testIndex: testIndex)
        ],
      ),
    );
  }
}