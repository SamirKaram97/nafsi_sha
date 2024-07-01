import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:pausable_timer/pausable_timer.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

class TestScoreSlider extends StatefulWidget {
   const TestScoreSlider({
    super.key, required this.finalScore, required this.testIndex,
  });
   final int finalScore;
   final int testIndex;

  @override
  State<TestScoreSlider> createState() => _TestScoreSliderState();
}

class _TestScoreSliderState extends State<TestScoreSlider> {
  late double width;

  @override
  void didChangeDependencies() {
    width=MediaQuery.sizeOf(context).width-84-70;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TestsCubit testsCubit=TestsCubit.get(context);
    int maxScore=testsCubit.tests[widget.testIndex].questions.length*3;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        //divider
        ClipRRect(borderRadius: BorderRadius.circular(12),child: const Divider(color: AppColors.primaryColor,thickness: 12,)),
        //score percent circle
        Row(
          children: [
            //70 radius for circle avatar
            //todo
            //need to refactor
             SizedBox(width:width*(widget.finalScore/(maxScore))),
            CircleAvatar(backgroundColor: AppColors.primaryColor,radius: 35,child: FittedBox(fit: BoxFit.scaleDown,child: Text("${widget.finalScore}",style: AppStyles.mBold26(context).copyWith(color: AppColors.whiteColor),)),),
          ],
        ),

      ],
    );
  }
}
