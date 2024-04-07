import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import '../styles/styles.dart';

class TestQuestionAnswerSelection extends StatelessWidget {
  const TestQuestionAnswerSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              child: Center(child: Text("disagree",style: AppStyles.mBold14(context),)),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              child: Center(child: Text("disagree",style: AppStyles.mBold14(context).copyWith(color: AppColors.whiteColor),)) ,
            ),
          ),
        ],
      ),
    );
  }
}