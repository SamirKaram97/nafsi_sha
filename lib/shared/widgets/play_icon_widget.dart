import 'package:flutter/material.dart';

import '../styles/colors.dart';

class PlayIconWidget extends StatelessWidget {
  const PlayIconWidget({
    super.key, this.radius,
  });
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(radius: radius,backgroundColor: AppColors.pinkColor,child: const Icon(Icons.play_arrow,color: AppColors.whiteColor,),);
  }
}