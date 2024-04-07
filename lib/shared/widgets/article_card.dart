import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp_nafsi/screens/article_content/article_content_screen.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/shadow_box.dart';

import '../styles/images.dart';
import 'article_image_and_icon.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1200),
            pageBuilder: (_, __, ___) => const ArticleContentScreen()));
      },
      child: ShadowBox(padding: 8,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleImageAndIcon(),
          const SizedBox(height: 10,),
          Text("Is The Weather Getting You Down?",style: AppStyles.mBold14(context).copyWith(color: Colors.black),),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a odio nec risus finibus porta nec quis massa. ",style: AppStyles.mMedium12(context).copyWith(color: Colors.black.withOpacity(0.75)),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text(AppStrings.readMore,style: AppStyles.mBold12(context),),
              const Spacer(),
              SvgPicture.asset(Assets.imagesBookIcon)
            ],
          )
        ],
      )),
    );
  }


}