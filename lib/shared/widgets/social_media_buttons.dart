import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){},
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(
                side: BorderSide(width: 1, color: Color(0xFFF4F4F4)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(Assets.imagesGoogleIcon),
            ),
          ),
        ),
        const SizedBox(width: 18),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(
                side: BorderSide(width: 1, color: Color(0xFFF4F4F4)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(Assets.imagesFacebookIcon),
            ),
          ),
        ),
      ],
    );
  }
}