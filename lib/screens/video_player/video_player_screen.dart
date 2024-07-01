
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/models/session_model.dart';
import 'package:gp_nafsi/models/video_response.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_state.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../layout/cubit/layout_cubit.dart';
import '../../shared/styles/images.dart';
import '../../shared/widgets/loop_icon_widget.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.videoResponse});
  final VideoResponse videoResponse;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> with WidgetsBindingObserver{
  late PausableTimer videoTimer;
  late int videoTimerInSeconds;
  late WatchedVideoModel watchedVideoModel;
  late int totalTime;

  late YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]); //to hide appBar
    initializePlayer();
    _initVideoTimer();
    // LayoutCubit.get(context).startVideosTimer();
    super.initState();
  }

  void _initVideoTimer()
  {
    int previousTimer=LayoutCubit.get(context).videoWithIntTime[widget.videoResponse.videoId]??0;
    watchedVideoModel=WatchedVideoModel(link: widget.videoResponse.videoLink);
    videoTimerInSeconds=0;
    videoTimer=PausableTimer.periodic(const Duration(seconds:1), () {
      videoTimerInSeconds=videoTimerInSeconds+1;
      totalTime=videoTimerInSeconds+previousTimer;
      watchedVideoModel=watchedVideoModel.copyWith(timeWatched: convertSecondsToTime(totalTime));
    })..start();
  }


  bool isHide =false;
  Future<void> initializePlayer() async {
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(widget.videoResponse.videoLink!);
    youtubePlayerController= YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        loop: true,
        autoPlay: true,
        mute: false,
        enableCaption:false
      ),
    );

    youtubePlayerController.addListener(() {
      if(youtubePlayerController.value.isControlsVisible!=isHide)
        {
      isHide=youtubePlayerController.value.isControlsVisible||!youtubePlayerController.value.isPlaying;
      print(isHide);
        setState(() {
        });}
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideosCubit, VideosState>(
      builder: (BuildContext context, VideosState state) {
        bool isFavouritesContainVideo=VideosCubit.get(context).isFavouritesContainVideo(widget.videoResponse);
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: YoutubePlayer(
                        controller: youtubePlayerController,
                        progressColors: const ProgressBarColors(
                            playedColor: Color(0XFFF5B0AC),
                            bufferedColor: AppColors.greyColor,
                            backgroundColor: AppColors.whiteColor),
                      ),
                    )
                  ],
                ),
                  AnimatedOpacity(
                    opacity: isHide
                        ? 1
                        : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: () {
                        VideosCubit.get(context).addOrRemoveVideoFavourites(widget.videoResponse);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: CircleAvatar(backgroundColor: isFavouritesContainVideo?AppColors.primaryColor:const Color(0XFFFEFEFE).withOpacity(.2),child: SvgPicture.asset(Assets.imagesBookMarkIcon,color: true?AppColors.whiteColor:null,)),
                      ),
                    ),
                                    ),
                  )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
      },
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;

    if(state == AppLifecycleState.resumed)
    {
      youtubePlayerController.play();
      _initVideoTimer();

    }
    else if(state == AppLifecycleState.paused)
    {
      videoTimer.pause();
      youtubePlayerController.pause();
      updateSessionFromVideo(context);
    }


  }


  @override
  void deactivate()async {
    updateSessionFromVideo(context);

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
    videoTimer.cancel();
    super.deactivate();

  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    print("disposed");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void updateSessionFromVideo(context)
  {
    var list=LayoutCubit.get(context).userSession!.videos?.toList();
    list!.removeWhere((element) => element?.link==widget.videoResponse.videoLink);
    list.add(watchedVideoModel);
    LayoutCubit.get(context).userSession=LayoutCubit.get(context).userSession!.copyWith(videos: list);
    int totalVideosTime=0;
    LayoutCubit.get(context).videoWithIntTime[widget.videoResponse.videoId!]=totalTime;
    LayoutCubit.get(context).videoWithIntTime.forEach((key, value) {
      totalVideosTime+=value;
    });
    LayoutCubit.get(context).userSession=LayoutCubit.get(context).userSession!.copyWith(videosTime: convertSecondsToTime(totalVideosTime),);
    LayoutCubit.get(context).videoWithIntTime[widget.videoResponse.videoId!]=totalTime;
  }
}


