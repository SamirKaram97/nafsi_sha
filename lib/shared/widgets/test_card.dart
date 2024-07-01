import 'package:flutter/material.dart';
import 'package:gp_nafsi/models/test_model.dart';
import 'package:gp_nafsi/screens/test_content/test_content.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/widgets/shadow_box.dart';
import 'package:gp_nafsi/shared/widgets/test_texts_and_icons_widget.dart';

import '../styles/colors.dart';
import '../styles/images.dart';

class TestCard extends StatelessWidget {
  const TestCard({super.key, required this.testModel, required this.testIndex});
  final TestModel testModel;
  final int testIndex;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(
            context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1200),
            pageBuilder: (_, __, ___) => TestContentScreen(
                testModel: testModel,testIndex:testIndex
            )));
      },
      child: ShadowBox(padding: 5, child: Row(
        children: [
          Expanded(
              child: Hero(tag: testModel.imagePath,child: AspectRatio(aspectRatio: 190/140,child: ClipRRect(borderRadius: BorderRadius.circular(9),child: Image.asset(testModel.imagePath,fit: BoxFit.cover,))))),
           Expanded(child: TestTextsAndIconsWidget(testModel: testModel,))
        ],
      )),
    );
  }
}


