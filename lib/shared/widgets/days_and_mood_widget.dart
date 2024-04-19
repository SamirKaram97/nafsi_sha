import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';

import '../../generated/l10n.dart';
import '../../models/day_and_mood_item_model.dart';
import '../styles/images.dart';
import 'day_and_mood_item.dart';

class DaysAndMoodsWidget extends StatelessWidget {
   DaysAndMoodsWidget({super.key});


   List<DayAndMoodItemModel> items(context)=>[
    DayAndMoodItemModel(day: S.of(context).thu,number: "1",mood: Mood.smiling),
    DayAndMoodItemModel(day: S.of(context).fri,number: "2",mood: Mood.neutral),
    DayAndMoodItemModel(day: S.of(context).sat,number: "3",mood: Mood.pouting),
    DayAndMoodItemModel(day: S.of(context).sun,number: "4",mood: Mood.smilingLove),
    DayAndMoodItemModel(day: S.of(context).mon,number: "5",mood: Mood.smiling),
    DayAndMoodItemModel(day: S.of(context).tue,number: "6",mood: Mood.pouting),
    DayAndMoodItemModel(day: S.of(context).wed,number: "7",mood: Mood.neutral),
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




