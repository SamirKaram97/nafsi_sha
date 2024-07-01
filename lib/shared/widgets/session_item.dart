import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:gp_nafsi/models/full_session_model.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';

import '../styles/colors.dart';

class SessionItem extends StatelessWidget {
  const SessionItem({super.key, required this.customUISessionModel});
  final CustomUISessionModel customUISessionModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30,vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.greyColor, borderRadius: BorderRadius.circular(10)),
        child:  Column(
          children: [
            Row(
              children: [
                 Text(AppStrings.date.tr()),
                const Spacer(),
                Text(customUISessionModel.date),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
             Row(
              children: [
                 Text(AppStrings.time.tr()),
                const Spacer(),
                Text(customUISessionModel.time),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
             Row(
              children: [
                 Text(AppStrings.appTime.tr()),
                const Spacer(),
                Text(customUISessionModel.appTime),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
             Row(
              children: [
                 Text(AppStrings.videoTime.tr()),
                const Spacer(),
                Text(customUISessionModel.videosTime??"0"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
