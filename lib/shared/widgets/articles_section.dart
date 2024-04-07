import 'package:flutter/material.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/shared/widgets/load_more_button.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';

import '../utils/strings.dart';
import 'article_card.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.articles,),
        const SizedBox(height: 15,),
        const ArticleCard(),
        const SizedBox(height: 15,),
        // const ArticleCard(),
        const SizedBox(height: 15,),
        LoadMoreButton(onTab: () {
          LayoutCubit.get(context).changeBottomNavBarIndex(5,context);
        },)
      ],
    );
  }
}
