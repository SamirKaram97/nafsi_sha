import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/login/cubit/login_cubit.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import '../../screens/home/cubit/home_cubit.dart';
import 'days_and_mood_widget.dart';

class MoodTrackerSection extends StatelessWidget {
  const MoodTrackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: S.of(context).moodTracker),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 23.0),
          decoration: ShapeDecoration(
            color: AppColors.orangeColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
          child: Column(
            children: [
              Text(
                S.of(context).howDoYouFeelToday,
                style: AppStyles.mBold14(context),
              ),
              const SizedBox(
                height: 15,
              ),
              DaysAndMoodsWidget(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                    title: S.of(context).detectYourFeeling.toUpperCase(),
                    onPressed: () {
                      // HomeCubit.get(context).pickImage();
                    }),
              )
            ],
          ),
        )
      ],
    );
  }
}
