import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'session_model.freezed.dart';
part 'session_model.g.dart';


@Freezed(makeCollectionsUnmodifiable: false)
class SessionModel with _$SessionModel {
  @JsonSerializable(explicitToJson: true)
  const factory SessionModel({
    @JsonKey(name: 'articles')
    @Default([])
    List<String> articles,

    @JsonKey(name: 'appTime')
    @Default("0")
    String? appTime,

    @JsonKey(name: 'videostime')
    @Default("0")
    String? videosTime,

    @JsonKey(name: 'videos')
    @Default([])
    List<WatchedVideoModel?>? videos,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, Object?> json)
  => _$SessionModelFromJson(json);

  // static String encode(List<SessionModel> videos) => json.encode(
  //   videos
  //       .map<Map<String, dynamic>>((video) => video.toJson())
  //       .toList(),
  // );
  //
  // static List<SessionModel> decode(String videos) =>
  //     (json.decode(videos) as List<dynamic>)
  //         .map<SessionModel>((item) => SessionModel.fromJson(item))
  //         .toList();
}


@Freezed(makeCollectionsUnmodifiable: false)
class WatchedVideoModel with _$WatchedVideoModel {
  @JsonSerializable(explicitToJson: true)
  const factory WatchedVideoModel({
   @JsonKey(name: 'link')
    String? link,

  @JsonKey(name: 'timeWatched')
  @Default("0")
    String? timeWatched,

  }) = _WatchedVideoModel;

  factory WatchedVideoModel.fromJson(Map<String, Object?> json)
  => _$WatchedVideoModelFromJson(json);






  // static String encode(List<WatchedVideoModel> videos) => json.encode(
  //   videos
  //       .map<Map<String, dynamic>>((video) => video.toJson())
  //       .toList(),
  // );
  //
  // static List<WatchedVideoModel> decode(String videos) =>
  //     (json.decode(videos) as List<dynamic>)
  //         .map<WatchedVideoModel>((item) => WatchedVideoModel.fromJson(item))
  //         .toList();
}
