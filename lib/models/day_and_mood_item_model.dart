import 'package:flutter/material.dart';
import '../shared/styles/images.dart';

class DayAndMoodItemModel
{
  final Mood mood;
  final String day;
  final String number;

  DayAndMoodItemModel({required this.mood, required this.day, required this.number});
}

enum Mood{
  pouting(facePath: Assets.imagesPoutingFace,shadowColor: Color(0x66F22A66)),
  smiling(facePath: Assets.imagesSmilingSmillingFace,shadowColor: Color(0x75FF9560)),
  smilingLove(facePath: Assets.imagesSmilingLoveFace,shadowColor: Color(0x75FF9560)),
  neutral(facePath: Assets.imagesNeutralFace,shadowColor:  Color(0x66FD8161));
  const Mood({
    required this.facePath,
    required this.shadowColor,

  });
  final String facePath;
  final Color shadowColor;
}