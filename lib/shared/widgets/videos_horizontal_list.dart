import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_state.dart';
import 'package:gp_nafsi/shared/widgets/shimmer_video_card.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';

import '../../models/video_response.dart';

class VideosHorizontalList extends StatelessWidget {
  const VideosHorizontalList({super.key, required this.videos, required this.state});
  final List<VideoResponse?>? videos;
  final VideosState state;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height:MediaQuery.sizeOf(context).width/1.5,child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
      if(VideosCubit.get(context).videos == null) {
       return const Center(
        child: ShimmerVideoCard(),
      );}
      return VideoCard(videoResponse: videos![index]!);
    }, separatorBuilder: (context, index) => const SizedBox(width: 15,), itemCount: 5));
  }
}