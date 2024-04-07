import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/article_card.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.articles),
        const SizedBox(height: 15,),
        Expanded(child: ListView.separated(itemBuilder: (context, index) {
          return const ArticleCard();
        }, separatorBuilder: (context, index) {
          return const SizedBox(height: 15,);
        }, itemCount: 10))
      ],
    );
  }
}
