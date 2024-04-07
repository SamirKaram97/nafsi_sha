import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';

import '../../models/day_and_mood_item_model.dart';
import '../styles/images.dart';
import 'day_and_mood_item.dart';

class DaysAndMoodsWidget extends StatelessWidget {
   DaysAndMoodsWidget({super.key});


  final List<DayAndMoodItemModel> items=[
    DayAndMoodItemModel(day: "Thu",number: "1",mood: Mood.smiling),
    DayAndMoodItemModel(day: "Fri",number: "2",mood: Mood.neutral),
    DayAndMoodItemModel(day: "Sat",number: "3",mood: Mood.pouting),
    DayAndMoodItemModel(day: "Sun",number: "4",mood: Mood.smilingLove),
    DayAndMoodItemModel(day: "Mon",number: "5",mood: Mood.smiling),
    DayAndMoodItemModel(day: "Tue",number: "6",mood: Mood.pouting),
    DayAndMoodItemModel(day: "Wed",number: "7",mood: Mood.neutral),
  ];

//need to refactor
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((e) => Expanded(child: DayAndMoodItem(dayAndMoodItemModel: e))).toList(),
      ),
    );
  }
}




