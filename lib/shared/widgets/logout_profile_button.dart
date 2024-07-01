import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../layout/cubit/layout_cubit.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';

class LogoutProfileButton extends StatelessWidget {
  const LogoutProfileButton({
    super.key,
    required this.layoutCubit,
  });

  final LayoutCubit layoutCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: ListTile(
        onTap: () {
          layoutCubit.logOut(context);
        },
        leading: const Icon(Icons.logout),
        title:
        Text(AppStrings.logout.tr(), style: AppStyles.mRegular18(context)),
      ),
    );
  }
}