import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/models/video_response.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_state.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../generated/assets.dart';
import '../../shared/widgets/loop_icon_widget.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.videoResponse});
  final VideoResponse videoResponse;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  late YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    initializePlayer();
    super.initState();
  }


  Future<void> initializePlayer() async {
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(widget.videoResponse.videoLink!);
    youtubePlayerController= YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(() {
      print(youtubePlayerController.metadata.title);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideosCubit, VideosState>(
      builder: (BuildContext context, VideosState state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Expanded(
                  child: YoutubePlayer(
                    // bottomActions: const [
                    //   // Column(
                    //   //   mainAxisSize: MainAxisSize.min,
                    //   //   children: [
                    //   //     // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    //   //     //   IconButton(
                    //   //     //       onPressed: () {
                    //   //     //
                    //   //     //       },
                    //   //     //       icon: SvgPicture.asset(Assets.imagesShuffleIcon)),
                    //   //     //   IconButton(
                    //   //     //       onPressed: () {
                    //   //     //
                    //   //     //       },
                    //   //     //       icon: SvgPicture.asset(Assets.imagesLeftMusicIcon)),
                    //   //     //   // InkWell(
                    //   //     //   //     borderRadius: BorderRadius.circular(30),
                    //   //     //   //     onTap: () {
                    //   //     //   //       cubit.playOrPauseSound();
                    //   //     //   //     },
                    //   //     //   //     child: CircleAvatar(
                    //   //     //   //       radius: 45,
                    //   //     //   //       backgroundColor: AppColors.lightBlue,
                    //   //     //   //       child: Icon(
                    //   //     //   //         play ? Icons.pause : Icons.play_arrow,
                    //   //     //   //         color: AppColors.whiteColor,
                    //   //     //   //         size: 50,
                    //   //     //   //       ),
                    //   //     //   //     )),
                    //   //     //   //todo
                    //   //     //   // chose the best
                    //   //     //   SizedBox(
                    //   //     //     height: 100,
                    //   //     //     width: 100,
                    //   //     //
                    //   //     //   ),
                    //   //     //   IconButton(
                    //   //     //       onPressed: () {
                    //   //     //
                    //   //     //       },
                    //   //     //       icon: SvgPicture.asset(Assets.imagesRightMusicIcon)),
                    //   //     //   IconButton(
                    //   //     //       onPressed: () {
                    //   //     //
                    //   //     //       },
                    //   //     //       icon: const LoopIconWidget(loopModeIndex: 0,)),
                    //   //     //
                    //   //     // ],),
                    //   //   ],
                    //   // )
                    // ],
                    controller: youtubePlayerController,
                    progressColors: const ProgressBarColors(
                        playedColor: Color(0XFFF5B0AC),
                        bufferedColor: AppColors.greyColor,
                        backgroundColor: AppColors.whiteColor),
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
    youtubePlayerController.dispose();
    super.dispose();
  }
}
