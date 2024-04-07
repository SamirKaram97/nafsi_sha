import 'package:flutter/material.dart';

import '../../models/day_and_mood_item_model.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';

class DayAndMoodItem extends StatelessWidget {
   const DayAndMoodItem({
    super.key,required this.dayAndMoodItemModel,
  });
  final DayAndMoodItemModel dayAndMoodItemModel;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Container(
            width: double.infinity ,
            padding: const EdgeInsetsDirectional.only(top:12,bottom: 12),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
            fit: BoxFit.scaleDown,
                  child: Text(
                    dayAndMoodItemModel.day,
                    style: AppStyles.mRegular14(context),
                  ),
                ),
                FittedBox(
                  child: Text(
                    dayAndMoodItemModel.number,
                    style: AppStyles.mMedium18(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2,),
          Container(
              padding: const EdgeInsetsDirectional.all(8.0),
              decoration: ShapeDecoration(
                color: AppColors.whiteWith60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Container(
                width: 20,
                height: 20,
                decoration:  BoxDecoration(
                  image: DecorationImage(image: AssetImage(dayAndMoodItemModel.mood.facePath)),
                  boxShadow: [
                    BoxShadow(
                      color: dayAndMoodItemModel.mood.shadowColor,
                      blurRadius: 6,
                      offset: const Offset(0, 6),
                      spreadRadius: -4,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}