import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import '../styles/colors.dart';
import '../styles/images.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      shape: const CircleBorder(), onPressed: () {
        LayoutCubit.get(context).changeBottomNavBarIndex(7, context);
    },
      child: SvgPicture.asset(Assets.imagesBotIcon),
      //params
    );
  }
}