import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/video_player/video_player_screen.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/widgets/play_icon_widget.dart';

import '../../models/video_response.dart';
import '../styles/colors.dart';
import '../styles/images.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';
import 'package:shimmer/shimmer.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.videoResponse,
  });
  final VideoResponse videoResponse;

  @override
  Widget build(BuildContext context) {
    print(videoResponse.imageLink??"nullllllllllllll");

    return InkWell(
      onTap: () {
        navTo(context,  VideoPlayerScreen(videoResponse: videoResponse,));
      },
      child: AspectRatio(
        aspectRatio: 343 / 281,
        child: Container(
          decoration: ShapeDecoration(
            image:  DecorationImage(
                image: NetworkImage(
                  videoResponse.imageLink??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBD0QVr-15nU3xny685gcltIOO80r_knw73vLwVCP3FP_X7oHvMWN1xr1WpRxhcG768oE&usqp=CAU",
                ),
                fit: BoxFit.cover),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  children: [Spacer(), PlayIconWidget()],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 28),
                child: Text(
                  videoResponse.title!,
                  style: AppStyles.mSemiBold20(context),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}






