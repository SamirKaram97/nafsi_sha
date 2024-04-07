
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/images.dart';

class ArticleImageAndIcon extends StatelessWidget {
  const ArticleImageAndIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 384/216,
      child: Hero(
        tag: "samir",
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: const DecorationImage(image: AssetImage(Assets.imagesArticleImage)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Align(alignment: AlignmentDirectional.topEnd,child: CircleAvatar(backgroundColor: const Color(0XFFFEFEFE).withOpacity(.2),child: SvgPicture.asset(Assets.imagesBookMarkIcon))),
          ),
        ),
      ),
    );
  }
}
