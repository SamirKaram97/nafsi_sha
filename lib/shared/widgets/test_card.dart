import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/test_content/test_content.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/widgets/shadow_box.dart';
import 'package:gp_nafsi/shared/widgets/test_texts_and_icons_widget.dart';

import '../styles/colors.dart';
import '../styles/images.dart';

class TestCard extends StatelessWidget {
  const TestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        navTo(context, const TestContentScreen());
      },
      child: ShadowBox(padding: 5, child: Row(
        children: [
          Expanded(
              child: AspectRatio(aspectRatio: 190/140,child: ClipRRect(borderRadius: BorderRadius.circular(9),child: Image.asset(Assets.imagesTestImage)))),
          const Expanded(child: TestTextsAndIconsWidget())
        ],
      )),
    );
  }



}


