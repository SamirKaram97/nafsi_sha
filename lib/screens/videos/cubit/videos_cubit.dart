import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/video_model.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';

import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/video_response.dart';
import '../../../shared/utils/strings.dart';
import 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(VideosInitState());
  final List<VideoResponse> localVideos=[
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

  List<VideoResponse>? videos;

  static VideosCubit get(context) => BlocProvider.of(context);

  void getVideos(context)async {
    emit(GetVideosLoadingState());
    if (await ApiServices.internetConnectionChecker.hasConnection) {
    try{
      //todo
      //factore methods with states
       videos= await ApiServices.getVideos(context);
      //  videos=[];
      print(" videos length ${videos!.length}");
      if(videos!.length>0)
        {
          SharedHelper.cacheVideos(videos!);
        }
      else
        {
          videos=SharedHelper.getCacheVideos();
          print(videos?.last.toJson());
        }
     print(videos!.length);
      emit(GetVideosSuccessState(videos: videos));
    }
    catch(e)
    {
      emit(GetVideosErrorState(errorMessage: ApiServices.getErrorMessage(e, context)));
      print(e.toString());
    }
  }
    else
      {
        emit(GetVideosErrorState(errorMessage: AppStrings.networkError.tr()));
      }
  }


  late List<VideoResponse> favouriteVideos;


  void getFavouriteVideos()
  {
    favouriteVideos=SharedHelper.getFavouriteVideos();
    print("favouriteVideos ${favouriteVideos.length}" );
  }

  void _addVideoToFavourites(VideoResponse videoModel)async
  {
    favouriteVideos.add(videoModel);
    await SharedHelper.saveFavouriteVideos(favouriteVideos);
    emit(AddVideoToFavourites());
  }

  void _removeVideoFromFavourites(VideoResponse videoModel)async
  {
    favouriteVideos.removeWhere((element) => element.videoId==videoModel.videoId);
    await SharedHelper.saveFavouriteVideos(favouriteVideos);
    emit(RemoveVideoToFavourites());
  }


  void addOrRemoveVideoFavourites(VideoResponse videoModel)
  {
    if(isFavouritesContainVideo(videoModel))
    {
      _removeVideoFromFavourites(videoModel);
    }
    else
    {
      _addVideoToFavourites(videoModel);
    }
  }

  bool isFavouritesContainVideo(VideoResponse videoModel)
  {
    for(int i=0;i<favouriteVideos.length;i++)
    {
      if(favouriteVideos[i].videoId==videoModel.videoId)
      {
        return true;
      }
    }
    return false;
  }


}
