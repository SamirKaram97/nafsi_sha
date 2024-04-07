import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import '../styles/images.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 29,
          backgroundColor: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(Assets.imagesBotIcon),
          ),
        ),
      ),
    );
  }
}