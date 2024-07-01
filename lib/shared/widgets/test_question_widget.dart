import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/test_question_answer_selection.dart';

import '../../models/test_model.dart';
import '../styles/styles.dart';

class TestQuestionWidget extends StatelessWidget {
  const TestQuestionWidget({
    super.key, required this.question, required this.answers, required this.qIndex, required this.testIndex,

  });
  final String question;
  final List<String> answers;
  final int qIndex;
  final int testIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question,style: AppStyles.mBold22(context),textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
        TestQuestionAnswerSelection(answers: answers,qIndex:qIndex,testIndex: testIndex),
      ],
    );
  }
}