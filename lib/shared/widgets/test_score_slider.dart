import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

class TestScoreSlider extends StatefulWidget {
  const TestScoreSlider({
    super.key,
  });

  @override
  State<TestScoreSlider> createState() => _TestScoreSliderState();
}

class _TestScoreSliderState extends State<TestScoreSlider> {
  double percent=50;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder:(context, constraints) {
        print(constraints.maxWidth);
        return IntrinsicHeight(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              //divider
              ClipRRect(borderRadius: BorderRadius.circular(12),child: const Divider(color: AppColors.primaryColor,thickness: 12,)),

              //score percent circle
              Row(
                children: [
                  //70 radius for circle avatar
                  if(percent>50)
                    SizedBox(width:constraints.maxWidth-(constraints.maxWidth*(1-percent/100))-70),
                  if(percent<50)
                    SizedBox(width:constraints.maxWidth*((percent/100))),
                  if(percent==50)
                    SizedBox(width:constraints.maxWidth-(constraints.maxWidth*(1-percent/100))-35),
                  CircleAvatar(backgroundColor: AppColors.primaryColor,radius: 35,child: FittedBox(fit: BoxFit.scaleDown,child: Text(percent.toInt().toString(),style: AppStyles.mBold26(context).copyWith(color: AppColors.whiteColor),)),),

                ],
              ),

              //min and max value
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Row(children: [
                  Text("0",style: AppStyles.mBold18(context).copyWith(color: AppColors.primaryColor),),
                  const Spacer(),
                  Text("100",style: AppStyles.mBold18(context).copyWith(color: AppColors.primaryColor)),
                ],),
              )
            ],
          ),
        );
      },
    );
  }
}
