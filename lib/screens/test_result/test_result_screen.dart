import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';

import '../../shared/widgets/test_and_explain_result.dart';
import '../../shared/widgets/test_score_and_description_section.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key, required this.finalScore, required this.testIndex});
  final int finalScore;
  final int testIndex;

  //need to refactor more and more

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const CustomAppBar(
            deep: true,
            backButton: true,
          ),
          Expanded(child: TestResultScreenBody(finalScore: finalScore,testIndex: testIndex,)),
        ],
      )),
    );
  }
}

class TestResultScreenBody extends StatelessWidget {
  const TestResultScreenBody({super.key, required this.finalScore, required this.testIndex});
  final int finalScore;
  final int testIndex;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //space
            const SizedBox(
              height: 70,
            ),

            //head ready text
            Center(
              child: Text(
                AppStrings.yourResultsAreReady.tr(),
                style: AppStyles.mExtraBold50(context),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(
              height: 35,
            ),

            //TestScoreAndDescriptionSection
             TestScoreAndDescriptionSection(testIndex: testIndex,finalScore: finalScore),

            //space
            const SizedBox(
              height: 25,
            ),

            //Test And Explain Result List
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>  TestAndExplainResult(score: TestsCubit.get(context).tests[testIndex].scores[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 48,
                    ),
                itemCount: 3),

            //submit Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomButton(
                  title: AppStrings.done.tr(),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
