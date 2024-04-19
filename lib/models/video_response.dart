import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'video_response.freezed.dart';
part 'video_response.g.dart';


@freezed
class VideoResponse with _$VideoResponse {
  const factory VideoResponse({
     String? title,
    @JsonKey(name: 'videolink')
     String? videoLink,
    @JsonKey(name: 'videoId')
    String? videoId,
  }) = _VideoResponse;

  factory VideoResponse.fromJson(Map<String, Object?> json)
  => _$VideoResponseFromJson(json);
}