import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/colors.dart';
import '../styles/images.dart';

class LoopIconWidget extends StatelessWidget {
  const LoopIconWidget({super.key, required this.loopModeIndex});
  final int loopModeIndex;

  @override
  Widget build(BuildContext context) {
    switch(loopModeIndex)
    {
      case 0:
        return SvgPicture.asset(Assets.imagesRepeatIcon);
      case 1:
        return SvgPicture.asset(Assets.imagesRepeatIcon,color: AppColors.lightBlue,);

    }
    return const Icon(Icons.repeat_one,color: AppColors.lightBlue,);
  }
}