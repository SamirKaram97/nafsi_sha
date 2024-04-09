import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import '../styles/styles.dart';

class TestQuestionAnswerSelection extends StatefulWidget {
  const TestQuestionAnswerSelection({super.key});

  @override
  State<TestQuestionAnswerSelection> createState() => _TestQuestionAnswerSelectionState();
}

class _TestQuestionAnswerSelectionState extends State<TestQuestionAnswerSelection> {
  late int answer;
  @override
  void initState() {
    answer=2;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                answer=0;
              });
            },
            child: Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                color: answer==0?AppColors.primaryColor:null,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              child: Center(child: Text("disagree",style: AppStyles.mBold14(context).copyWith(color: answer==0?Colors.white:null),)),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                answer=1;
              });
            },
            child: Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                color: answer==1?AppColors.primaryColor:null,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                answer=2;
              });
            },
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: answer==2?AppColors.primaryColor:null,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                answer=3;
              });
            },
            child: Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                color: answer==3?AppColors.primaryColor:null,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                answer=4;
              });
            },
            child: Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                color: answer==4?AppColors.primaryColor:null,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              child: Center(child: Text("disagree",style: AppStyles.mBold14(context).copyWith(color: answer==4?Colors.white:null),)) ,
            ),
          ),
        ],
      ),
    );
  }
}