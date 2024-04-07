import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({super.key, required this.padding, required this.child});
  final double padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsetsDirectional.all(padding),
      decoration: ShapeDecoration(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: _getBoxShadows(),
      ),
      child: child,
    );
  }
  _getBoxShadows()=>[
    const BoxShadow(
      color: Color(0x14000000),
      blurRadius: 32,
      offset: Offset(0, 4),
      spreadRadius: 0,
    )
  ];
}