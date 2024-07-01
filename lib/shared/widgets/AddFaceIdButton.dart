import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';
import 'package:gp_nafsi/screens/change_info/change_info_screen.dart';
import 'package:gp_nafsi/shared/styles/components.dart';

import '../../layout/cubit/layout_cubit.dart';
import '../../screens/AddFaceScreen/add_face_screen.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';

class AddFaceIdButton extends StatelessWidget {
   AddFaceIdButton({
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
          navTo(context, const FaceProfileAuth());
        },
        leading: const Icon(Icons.face),
        title:
        Text(AppStrings.addFaceId.tr(), style: AppStyles.mRegular18(context)),
        trailing: LayoutCubit.get(context).state is UpdateUserFaceIdLoadingState ?  SizedBox(height: 20,width: 20,child: CircularProgressIndicator()):null,
      ),
    );
  }
}