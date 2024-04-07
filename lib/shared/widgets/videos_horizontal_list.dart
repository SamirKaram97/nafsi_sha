import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';

class VideosHorizontalList extends StatelessWidget {
  const VideosHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height:MediaQuery.sizeOf(context).width/1.5,child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index) =>   const VideoCard(), separatorBuilder: (context, index) => const SizedBox(width: 15,), itemCount: 10));
  }
}