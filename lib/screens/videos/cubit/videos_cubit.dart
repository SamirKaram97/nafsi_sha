import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/video_response.dart';
import 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(VideosInitState());
  final List<VideoResponse> videos=[
    const VideoResponse(title: "Video1,"),
    const VideoResponse(title: "Videos,"),
    const VideoResponse(title: "Video3,"),
    const VideoResponse(title: "Video4,"),
    const VideoResponse(title: "Video5,"),
    const VideoResponse(title: "Video6,"),
    const VideoResponse(title: "Video7,"),
    const VideoResponse(title: "Video8,"),
    const VideoResponse(title: "Video9,"),
    const VideoResponse(title: "Video10,"),
  ];


  static VideosCubit get(context) => BlocProvider.of(context);

  void getVideos(context)async {
    emit(GetVideosLoadingState());
    if (await ApiServices.internetConnectionChecker.hasConnection) {

    try{
     List<VideoResponse> videos= await ApiServices.getVideos(context);
     print(videos.length);
      emit(GetVideosSuccessState(videos: videos));
    }
    catch(e)
    {
      emit(GetVideosErrorState(errorMessage: ApiServices.getErrorMessage(e, context)));
    }
  }
    else
      {
        emit(GetVideosErrorState(errorMessage: S.of(context).networkError));
      }
  }


}
