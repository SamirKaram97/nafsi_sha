import '../../../models/video_response.dart';

abstract class VideosState{}

 class VideosInitState extends VideosState{}

class GetVideosLoadingState extends VideosState{}

class AddVideoToFavourites extends VideosState{}
class RemoveVideoToFavourites extends VideosState{}

class GetVideosErrorState extends VideosState{
  final String errorMessage;

  GetVideosErrorState({required this.errorMessage});
}

class GetVideosSuccessState extends VideosState{
  final List<VideoResponse?>? videos;

  GetVideosSuccessState({required this.videos});
}
