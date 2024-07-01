import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';

import '../styles/styles.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key, required this.testIndex});

  final int testIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        color: const Color(0XFF80542F).withOpacity(.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //description title
          Text(
            AppStrings.description.tr(),
            style: AppStyles.mBold16(context),
          ),

          //space
          const SizedBox(
            height: 20,
          ),

          //description text
          Column(
            children: TestsCubit.get(context).tests[testIndex].scores.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                      child:
                      Text(e.name,style: AppStyles.mBold18(context))),
                  Text(e.analysis,style: AppStyles.mMedium14(context),),
                ],
              ),
            )).toList(),
          )
        ],
      ),
    );
  }
}
