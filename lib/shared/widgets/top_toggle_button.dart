
import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';

class TopToggleButton extends StatelessWidget {
  const TopToggleButton({super.key, required this.isSelected, required this.title});

  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        decoration: ShapeDecoration(
          color: isSelected?AppColors.primaryColor:Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadows: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            title,
            style: isSelected?AppStyles.mSemiBold18(context).copyWith(color: AppColors.whiteColor):AppStyles.mSemiBold18(context),
          ),
        ),
      ),
    );
  }
}