import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'video_response.freezed.dart';
part 'video_response.g.dart';


@freezed
class VideoResponse with _$VideoResponse {
  const factory VideoResponse({
     String? title,
    @JsonKey(name: 'imageLink')
     String? imageLink,
    @JsonKey(name: 'videolink')
     String? videoLink,
    @JsonKey(name: 'videoId')
    String? videoId,
  }) = _VideoResponse;

  factory VideoResponse.fromJson(Map<String, Object?> json)
  => _$VideoResponseFromJson(json);



  static String encode(List<VideoResponse> videos) => json.encode(
    videos
        .map<Map<String, dynamic>>((video) => video.toJson())
        .toList(),
  );

  static List<VideoResponse> decode(String videos) =>
      (json.decode(videos) as List<dynamic>)
          .map<VideoResponse>((item) => VideoResponse.fromJson(item))
          .toList();
}