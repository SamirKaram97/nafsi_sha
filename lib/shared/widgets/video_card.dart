
import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/play_icon_widget.dart';

import '../styles/colors.dart';
import '../styles/images.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key,});


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343/281,
      child: Container(
        decoration: ShapeDecoration(
          image: const DecorationImage(
              image: AssetImage
                (Assets.imagesVideoCardImage,),fit: BoxFit.cover),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Row(
                children: [Spacer(),PlayIconWidget()],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 28 ),
              child: Text(AppStrings.campingRelax,style: AppStyles.mSemiBold20(context),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28 ),
              child: Text("3hr 10min . 20 Songs ",style: AppStyles.mRegular14(context).copyWith(color: AppColors.whiteColor),),
            ),
            const SizedBox(height: 20,)


          ],
        ),
      ),
    );
  }
}


