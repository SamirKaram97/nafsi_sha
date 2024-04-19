import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/test_result/test_result_screen.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';
import 'package:gp_nafsi/shared/widgets/shadow_box.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import '../../shared/styles/images.dart';
import '../../shared/widgets/test_question_widget.dart';

class TestContentScreen extends StatelessWidget {
  const TestContentScreen({super.key});

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
                    AspectRatio(
                      aspectRatio: 400 / 232,
                      child: ShadowBox(
                          padding: 8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                Assets.imagesArticleImage,
                                fit: BoxFit.cover,
                              ))),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    const TestsSection(),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                        title: S.of(context).submit,
                        onPressed: () {
                          navTo(context, const TestResultScreen());
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const TestQuestionWidget(),
        separatorBuilder: (context, index) => Divider(
              height: 30,
              color: AppColors.dividerColor,
            ),
        itemCount: 10);
  }
}
