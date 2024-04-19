import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';

import '../../models/video_response.dart';

class VideosHorizontalList extends StatelessWidget {
  const VideosHorizontalList({super.key, required this.videos});
  final List<VideoResponse?>? videos;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height:MediaQuery.sizeOf(context).width/1.5,child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index) =>    VideoCard(videoResponse: videos![index]!), separatorBuilder: (context, index) => const SizedBox(width: 15,), itemCount: videos!.length));
  }
}