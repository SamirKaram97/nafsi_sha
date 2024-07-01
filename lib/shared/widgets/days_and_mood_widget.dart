import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';

import '../../models/day_and_mood_item_model.dart';
import '../styles/images.dart';
import '../utils/strings.dart';
import 'day_and_mood_item.dart';

class DaysAndMoodsWidget extends StatelessWidget {
   DaysAndMoodsWidget({super.key});


   List<DayAndMoodItemModel> items(context)=>[
    DayAndMoodItemModel(day: AppStrings.thu.tr(),number: "1",mood: Mood.smiling),
    DayAndMoodItemModel(day: AppStrings.fri.tr(),number: "2",mood: Mood.neutral),
    DayAndMoodItemModel(day: AppStrings.sat.tr(),number: "3",mood: Mood.pouting),
    DayAndMoodItemModel(day: AppStrings.sun.tr(),number: "4",mood: Mood.smilingLove),
    DayAndMoodItemModel(day: AppStrings.mon.tr(),number: "5",mood: Mood.smiling),
    DayAndMoodItemModel(day: AppStrings.tue.tr(),number: "6",mood: Mood.pouting),
    DayAndMoodItemModel(day: AppStrings.wed.tr(),number: "7",mood: Mood.neutral),
  ];

//need to refactor
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsetsDirectional.only(start: 15,end: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items(context).map((e) => Expanded(child: DayAndMoodItem(dayAndMoodItemModel: e))).toList(),
      ),
    );
  }
}




