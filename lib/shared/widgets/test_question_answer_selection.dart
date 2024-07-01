import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';


import '../styles/styles.dart';
import '../utils/strings.dart';

class TestQuestionAnswerSelection extends StatefulWidget {
  const TestQuestionAnswerSelection({super.key, required this.answers, required this.qIndex, required this.testIndex});

  final List<String> answers;
  final int qIndex;
  final int testIndex;

  @override
  State<TestQuestionAnswerSelection> createState() => _TestQuestionAnswerSelectionState();
}

class _TestQuestionAnswerSelectionState extends State<TestQuestionAnswerSelection> {
  late int answer;
  @override
  void initState() {
    answer=1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      answer=0;
                      TestsCubit.get(context).tests[widget.testIndex].qScore![widget.qIndex]=answer;
                      log(TestsCubit.get(context).tests[widget.testIndex].qScore.toString());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: answer==0?AppColors.primaryColor:null,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(child: FittedBox(child: Text(widget.answers[0],style: AppStyles.mBold14(context).copyWith(color: answer==0?Colors.white:null),))),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      answer=1;
                      TestsCubit.get(context).tests[widget.testIndex].qScore![widget.qIndex]=answer;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: answer==1?AppColors.primaryColor:null,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(child: FittedBox(child: Text(widget.answers[1],style: AppStyles.mBold14(context).copyWith(color: answer==1?Colors.white:null),))),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      answer=2;
                      TestsCubit.get(context).tests[widget.testIndex].qScore![widget.qIndex]=answer;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: answer==2?AppColors.primaryColor:null,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(child: FittedBox(child: Text(widget.answers[2],style: AppStyles.mBold14(context).copyWith(color: answer==2?Colors.white:null),))),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      answer=3;
                      TestsCubit.get(context).tests[widget.testIndex].qScore![widget.qIndex]=answer;

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: answer==3?AppColors.primaryColor:null,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(child: FittedBox(child: Text(widget.answers[3],style: AppStyles.mBold14(context).copyWith(color: answer==3?Colors.white:null),))),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}