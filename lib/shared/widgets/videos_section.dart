import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';
import 'package:gp_nafsi/shared/widgets/videos_horizontal_list.dart';

import '../../models/video_model.dart';
import '../styles/images.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';
import 'load_more_button.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(colors: [Color(0XFFFEFEFE),Color(0XFFF9F9F9)],begin: AlignmentDirectional.topCenter,end: AlignmentDirectional.bottomCenter)
      // ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: AppStrings.videos),
          SizedBox(
            height: 15,
          ),
          VideosHorizontalList(),
          SizedBox(
            height: 35,
          ),
          LoadMoreButton(onTab: () {
            LayoutCubit.get(context).changeBottomNavBarIndex(4,context);
          },),

        ],
      ),
    );
  }
}


