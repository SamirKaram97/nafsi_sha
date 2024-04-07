import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/test_question_answer_selection.dart';

import '../styles/styles.dart';

class TestQuestionWidget extends StatelessWidget {
  const TestQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Lorem ipsum dolor sit amet consectetur. Dolor ac risus id consequat sit ",style: AppStyles.mBold22(context),textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
        const TestQuestionAnswerSelection(),
      ],
    );
  }
}