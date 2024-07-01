import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp_nafsi/models/article_models.dart';
import 'package:gp_nafsi/screens/article_content/article_content_screen.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/shadow_box.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/images.dart';
import 'article_image_and_icon.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 1200),
                pageBuilder: (_, __, ___) => ArticleContentScreen(
                      articleModel: articleModel,
                    )));
      },
      child: ShadowBox(
          padding: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleImageAndIcon(tag: articleModel.sId!,articleModel: articleModel),
              const SizedBox(
                height: 10,
              ),
              Text(
                articleModel.title ?? "",
                style: AppStyles.mBold14(context).copyWith(color: Colors.black),
              ),
              Text(
                articleModel.content ?? "",
                style: AppStyles.mMedium14(context)
                    .copyWith(color: Colors.black.withOpacity(0.75)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.readMore.tr(),
                    style: AppStyles.mBold12(context),
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.imagesBookIcon)
                ],
              )
            ],
          )),
    );
  }
}



