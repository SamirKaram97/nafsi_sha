import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';

import 'days_and_mood_widget.dart';

class MoodTrackerSection extends StatelessWidget {
  const MoodTrackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.moodTracker),
        const SizedBox(height: 15,),
        Container(
          padding:const EdgeInsets.only(top: 16.0,bottom: 23.0),
          decoration: ShapeDecoration(
            color:  AppColors.orangeColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
          child: Column(
            children: [
              Text(AppStrings.howDoYouFeelToday,style:AppStyles.mBold14(context),),
              const SizedBox(height: 15,),
              DaysAndMoodsWidget(),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(title: AppStrings.detectYourFeeling.toUpperCase(), onPressed: (){}),
              )
            ],
          ),
        )
      ],
    );
  }
}


