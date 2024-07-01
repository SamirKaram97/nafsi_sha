import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/test_result/test_result_screen.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';
import 'package:gp_nafsi/shared/widgets/shadow_box.dart';

import '../../models/test_model.dart';
import '../../shared/styles/images.dart';
import '../../shared/widgets/test_question_widget.dart';

class TestContentScreen extends StatefulWidget {
  const TestContentScreen({super.key, required this.testModel, required this.testIndex,});
  final TestModel testModel;
  final int testIndex;

  @override
  State<TestContentScreen> createState() => _TestContentScreenState();
}

class _TestContentScreenState extends State<TestContentScreen> {

  @override
  void initState() {
    widget.testModel.qScore= List.filled(widget.testModel.questions.length, 1);
    print(widget.testModel.qScore?.length);
    print(widget.testModel.questions.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          const CustomAppBar(
            backButton: true,
            deep: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    //headerImage
                    Hero(
                      tag: widget.testModel.imagePath,
                      child: AspectRatio(
                        aspectRatio: 400 / 232,
                        child: ShadowBox(
                            padding: 8,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  widget.testModel.imagePath,
                                  fit: BoxFit.cover,
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    TestsSection(testModel: widget.testModel,testIndex: widget.testIndex),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                        title: AppStrings.submit.tr(),
                        onPressed: () {
                          int finalScore=0;
                          for (var element in widget.testModel.qScore!) {
                            finalScore+=element;
                          }
                          navTo(context,  TestResultScreen(finalScore:finalScore,testIndex:widget.testIndex));
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class TestsSection extends StatelessWidget {
  const TestsSection({
    super.key, required this.testModel, required this.testIndex,
  });
  final TestModel testModel;
  final int testIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>  TestQuestionWidget(question: testModel.questions[index],answers: testModel.answers,qIndex: index,testIndex:testIndex),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Divider(
                height: 30,
                color: AppColors.dividerColor,
              ),
        ),
        itemCount:  testModel.questions.length);
  }
}
