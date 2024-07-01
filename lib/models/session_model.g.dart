// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionModelImpl _$$SessionModelImplFromJson(Map<String, dynamic> json) =>
    _$SessionModelImpl(
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      appTime: json['appTime'] as String? ?? "0",
      videosTime: json['videostime'] as String? ?? "0",
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : WatchedVideoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SessionModelImplToJson(_$SessionModelImpl instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'appTime': instance.appTime,
      'videostime': instance.videosTime,
      'videos': instance.videos?.map((e) => e?.toJson()).toList(),
    };

_$WatchedVideoModelImpl _$$WatchedVideoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchedVideoModelImpl(
      link: json['link'] as String?,
      timeWatched: json['timeWatched'] as String? ?? "0",
    );

Map<String, dynamic> _$$WatchedVideoModelImplToJson(
        _$WatchedVideoModelImpl instance) =>
    <String, dynamic>{
      'link': instance.link,
      'timeWatched': instance.timeWatched,
    };
