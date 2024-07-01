import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_state.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/article_card.dart';

import 'package:gp_nafsi/shared/widgets/section_title.dart';


class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var articles=ArticlesCubit.get(context).articles;

        if(state is GetArticlesErrorState)
          {
            return Center(child: Text(state.errorMessage));
          }
        if (state is GetArticlesLoadingState) {
          return const CircularProgressIndicator();
        } else if (articles!=null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: AppStrings.articles.tr()),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ArticleCard(
                          articleModel: articles![index]!,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: articles.length ?? 0))
            ],
          );
        }
        return const SizedBox();

      },
    );
  }
}
