import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/login/cubit/login_cubit.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';

import '../../screens/home/cubit/home_cubit.dart';
import 'days_and_mood_widget.dart';

class MoodTrackerSection extends StatelessWidget {
  const MoodTrackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppStrings.moodTracker.tr()),

        //space
        const SizedBox(height: 15),

        Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 23.0),
          decoration: ShapeDecoration(
            color: AppColors.orangeColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
          child: Column(
            children: [
              Text(AppStrings.howDoYouFeelToday.tr(),
                  style: AppStyles.mBold14(context)),

              //space
              const SizedBox(height: 15),
              DaysAndMoodsWidget(),
              const SizedBox(height: 30),

              //Feeling Button
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomButton(
                      title: AppStrings.detectYourFeeling.tr().toUpperCase(),
                      onPressed: () {
                        HomeCubit.get(context).pickImage();
                      }))
            ],
          ),
        )
      ],
    );
  }
}
