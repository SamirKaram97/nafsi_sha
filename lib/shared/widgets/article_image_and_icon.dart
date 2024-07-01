
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/models/article_models.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import '../styles/images.dart';

class ArticleImageAndIcon extends StatelessWidget {
    ArticleImageAndIcon({
    super.key, required this.tag, required this.articleModel,
     this.inContentPage
  });
  final String tag;
  final ArticleModel articleModel;
  bool? inContentPage;
  @override
  Widget build(BuildContext context) {
    bool isFavouritesContainArticle=ArticlesCubit.get(context).isFavouritesContainArticle(articleModel);
    return AspectRatio(
      aspectRatio: 384/216,
      child: Hero(
        tag: tag,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: articleModel.cover==null?const DecorationImage(image: AssetImage(Assets.imagesArticleImage)): DecorationImage(image: NetworkImage(articleModel.cover!),fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: inContentPage==true?null:Align(alignment: AlignmentDirectional.topEnd,child: GestureDetector(onTap: (){
              ArticlesCubit.get(context).addOrRemoveArticleFavourites(articleModel);
            },child: CircleAvatar(backgroundColor: isFavouritesContainArticle?AppColors.primaryColor:const Color(0XFFFEFEFE).withOpacity(.2),child: SvgPicture.asset(Assets.imagesBookMarkIcon,color: isFavouritesContainArticle?AppColors.whiteColor:null,)))),
          ),
        ),
      ),
    );
  }
}
