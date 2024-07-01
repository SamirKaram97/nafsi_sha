import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/change_info/change_info_screen.dart';
import 'package:gp_nafsi/shared/styles/components.dart';

import '../../layout/cubit/layout_cubit.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';

class UpdateUserDataButton extends StatelessWidget {
  const UpdateUserDataButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: ListTile(
        onTap: () {
          if(LayoutCubit.get(context).userModel!=null)
            {
          navTo(context, ChangeInfoScreen(userModel: LayoutCubit.get(context).userModel!,));
            }
        },
        leading: const Icon(Icons.published_with_changes),
        title:
        Text(AppStrings.changeMyInfo.tr(), style: AppStyles.mRegular18(context)),
      ),
    );
  }
}