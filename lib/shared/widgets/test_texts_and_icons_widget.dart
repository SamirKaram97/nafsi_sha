
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/colors.dart';
import '../styles/images.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';

class TestTextsAndIconsWidget extends StatelessWidget {
  const TestTextsAndIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 190/140,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [
            Row(
              children: [
                Text("Anxiety Test",style: AppStyles.mBold14(context).copyWith(color: Colors.black),),
                const Spacer(),
                SvgPicture.asset(Assets.imagesBookMarkIcon)
              ],
            ),
            Expanded(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",style: AppStyles.mMedium12(context),)),
            Row(
              children: [
                Text(AppStrings.start,style: AppStyles.mBold12(context),),
                const Spacer(),
                const Icon(Icons.arrow_right_alt,color: AppColors.primaryColor,)
              ],
            )

          ],
        ),
      ),
    );
  }
}


