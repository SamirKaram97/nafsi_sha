import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_state.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_state.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';

import '../../shared/utils/strings.dart';
import '../../shared/widgets/article_card.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/top_toggle_button.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var layout = LayoutCubit.get(context);
        var favArticles = ArticlesCubit.get(context).favouriteArticles;
        var favVideos = VideosCubit.get(context).favouriteVideos;

        return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            layout.changeFavouriteIndex(0, context);
                          },
                          child: TopToggleButton(
                              isSelected: layout.selectedFavouriteIndex == 0,
                              title: AppStrings.favouriteArticles.tr())),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            layout.changeFavouriteIndex(1, context);
                          },
                          child: TopToggleButton(
                              isSelected: layout.selectedFavouriteIndex == 1,
                              title: AppStrings.favouriteVideos.tr())),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: layout.selectedFavouriteIndex == 0
                          ? BlocConsumer<ArticlesCubit, ArticlesState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                return favArticles.isEmpty?Center(
                                  child: Text(AppStrings.noFavouriteArticles.tr(),
                                      style: AppStyles.mSemiBold38(context).copyWith(
                                          fontSize: getResponsiveFontSize(context, fontSize: 30)),
                                      textAlign: TextAlign.center),
                                ):ListView.separated(
                                    itemBuilder: (context, index) {
                                      return ArticleCard(
                                        articleModel: favArticles[index]!,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 15,
                                      );
                                    },
                                    itemCount: favArticles.length ?? 0);
                              },
                            )
                          : BlocConsumer<VideosCubit, VideosState>(
                              builder: (context, state) {
                                return favVideos.isEmpty?Center(
                                  child: Text(AppStrings.noFavouriteVideos.tr(),
                                      style: AppStyles.mSemiBold38(context).copyWith(
                                          fontSize: getResponsiveFontSize(context, fontSize: 30)),
                                      textAlign: TextAlign.center),
                                ): ListView.separated(
                                  itemBuilder: (context, index) {
                                    return VideoCard(
                                      videoResponse: favVideos[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 15,
                                    );
                                  },
                                  itemCount: favVideos.length ?? 0);
                              },
                              listener:
                                  (BuildContext context, VideosState state) {},
                            )),
                ],
              );
      },
    );
  }
}
