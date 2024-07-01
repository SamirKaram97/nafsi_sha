import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/test_model.dart';
import '../styles/colors.dart';
import '../styles/images.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';


class TestTextsAndIconsWidget extends StatelessWidget {
  const TestTextsAndIconsWidget({super.key, required this.testModel});
  final TestModel testModel;


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 190 / 140,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              testModel.title,
              style:
              AppStyles.mBold14(context).copyWith(color: Colors.black),
            ),
            Expanded(
                child: Text(
              testModel.description,
              style: AppStyles.mMedium12(context),
                  overflow: TextOverflow.fade,
            )),
            Row(
              children: [
                Text(
                  AppStrings.start.tr(),
                  style: AppStyles.mBold12(context),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_right_alt,
                  color: AppColors.primaryColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
