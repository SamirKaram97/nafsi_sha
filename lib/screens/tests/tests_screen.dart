import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/test_card.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.tests),
        const SizedBox(height: 15,),
        Expanded(child: ListView.separated(itemBuilder: (context, index) {
          return const TestCard();
        }, separatorBuilder: (context, index) {
          return const SizedBox(height: 15,);
        }, itemCount: 10))
      ],
    );
  }
}
