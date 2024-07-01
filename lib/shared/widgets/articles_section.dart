import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_state.dart';
import 'package:gp_nafsi/shared/widgets/load_more_button.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/shimmer_article_card.dart';

import '../utils/strings.dart';
import 'article_card.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var articles = ArticlesCubit.get(context).articles;

        if (state is GetArticlesErrorState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: AppStrings.articles.tr()),

              //space
              const SizedBox(height: 15),
              articles == null
                  ? const ShimmerArticleCard():
              articles.isEmpty?const SizedBox()
                  : ArticleCard(articleModel: articles[0]!),

              //space
              const SizedBox(height: 15),
              LoadMoreButton(onTab: () {
                LayoutCubit.get(context).changeBottomNavBarIndex(5, context);
              })
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
