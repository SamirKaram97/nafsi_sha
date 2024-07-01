import 'package:flutter/material.dart';

import '../../models/test_model.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';

class TestAndExplainResult extends StatelessWidget {
  const TestAndExplainResult({super.key, required this.score});
  final TestScoreModel score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            score.name,
            style: AppStyles.mExtraBold35(context),
          ),
        ),
       ListView.separated(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context, index) =>  Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const Padding(
             padding: EdgeInsets.all(4.0),
             child: CircleAvatar(radius: 5,backgroundColor: AppColors.primaryColor,),
           ),
           Expanded(
             child: Text(
               score.suggestions[index],
               style: AppStyles.mMedium16(context),
             ),
           ),
         ],
       ), separatorBuilder: (context, index) => const SizedBox(height: 8,), itemCount: score.suggestions.length),
      ],
    );
  }

}
