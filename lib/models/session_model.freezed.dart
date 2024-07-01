// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return _SessionModel.fromJson(json);
}

/// @nodoc
mixin _$SessionModel {
  @JsonKey(name: 'articles')
  List<String> get articles => throw _privateConstructorUsedError;
  @JsonKey(name: 'appTime')
  String? get appTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'videostime')
  String? get videosTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'videos')
  List<WatchedVideoModel?>? get videos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionModelCopyWith<SessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionModelCopyWith<$Res> {
  factory $SessionModelCopyWith(
          SessionModel value, $Res Function(SessionModel) then) =
      _$SessionModelCopyWithImpl<$Res, SessionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'articles') List<String> articles,
      @JsonKey(name: 'appTime') String? appTime,
      @JsonKey(name: 'videostime') String? videosTime,
      @JsonKey(name: 'videos') List<WatchedVideoModel?>? videos});
}

/// @nodoc
class _$SessionModelCopyWithImpl<$Res, $Val extends SessionModel>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? appTime = freezed,
    Object? videosTime = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appTime: freezed == appTime
          ? _value.appTime
          : appTime // ignore: cast_nullable_to_non_nullable
              as String?,
      videosTime: freezed == videosTime
          ? _value.videosTime
          : videosTime // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<WatchedVideoModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionModelImplCopyWith<$Res>
    implements $SessionModelCopyWith<$Res> {
  factory _$$SessionModelImplCopyWith(
          _$SessionModelImpl value, $Res Function(_$SessionModelImpl) then) =
      __$$SessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'articles') List<String> articles,
      @JsonKey(name: 'appTime') String? appTime,
      @JsonKey(name: 'videostime') String? videosTime,
      @JsonKey(name: 'videos') List<WatchedVideoModel?>? videos});
}

/// @nodoc
class __$$SessionModelImplCopyWithImpl<$Res>
    extends _$SessionModelCopyWithImpl<$Res, _$SessionModelImpl>
    implements _$$SessionModelImplCopyWith<$Res> {
  __$$SessionModelImplCopyWithImpl(
      _$SessionModelImpl _value, $Res Function(_$SessionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? appTime = freezed,
    Object? videosTime = freezed,
    Object? videos = freezed,
  }) {
    return _then(_$SessionModelImpl(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appTime: freezed == appTime
          ? _value.appTime
          : appTime // ignore: cast_nullable_to_non_nullable
              as String?,
      videosTime: freezed == videosTime
          ? _value.videosTime
          : videosTime // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<WatchedVideoModel?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SessionModelImpl implements _SessionModel {
  const _$SessionModelImpl(
      {@JsonKey(name: 'articles') this.articles = const [],
      @JsonKey(name: 'appTime') this.appTime = "0",
      @JsonKey(name: 'videostime') this.videosTime = "0",
      @JsonKey(name: 'videos') this.videos = const []});

  factory _$SessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionModelImplFromJson(json);

  @override
  @JsonKey(name: 'articles')
  final List<String> articles;
  @override
  @JsonKey(name: 'appTime')
  final String? appTime;
  @override
  @JsonKey(name: 'videostime')
  final String? videosTime;
  @override
  @JsonKey(name: 'videos')
  final List<WatchedVideoModel?>? videos;

  @override
  String toString() {
    return 'SessionModel(articles: $articles, appTime: $appTime, videosTime: $videosTime, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionModelImpl &&
            const DeepCollectionEquality().equals(other.articles, articles) &&
            (identical(other.appTime, appTime) || other.appTime == appTime) &&
            (identical(other.videosTime, videosTime) ||
                other.videosTime == videosTime) &&
            const DeepCollectionEquality().equals(other.videos, videos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(articles),
      appTime,
      videosTime,
      const DeepCollectionEquality().hash(videos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      __$$SessionModelImplCopyWithImpl<_$SessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionModelImplToJson(
      this,
    );
  }
}

abstract class _SessionModel implements SessionModel {
  const factory _SessionModel(
          {@JsonKey(name: 'articles') final List<String> articles,
          @JsonKey(name: 'appTime') final String? appTime,
          @JsonKey(name: 'videostime') final String? videosTime,
          @JsonKey(name: 'videos') final List<WatchedVideoModel?>? videos}) =
      _$SessionModelImpl;

  factory _SessionModel.fromJson(Map<String, dynamic> json) =
      _$SessionModelImpl.fromJson;

  @override
  @JsonKey(name: 'articles')
  List<String> get articles;
  @override
  @JsonKey(name: 'appTime')
  String? get appTime;
  @override
  @JsonKey(name: 'videostime')
  String? get videosTime;
  @override
  @JsonKey(name: 'videos')
  List<WatchedVideoModel?>? get videos;
  @override
  @JsonKey(ignore: true)
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WatchedVideoModel _$WatchedVideoModelFromJson(Map<String, dynamic> json) {
  return _WatchedVideoModel.fromJson(json);
}

/// @nodoc
mixin _$WatchedVideoModel {
  @JsonKey(name: 'link')
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeWatched')
  String? get timeWatched => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchedVideoModelCopyWith<WatchedVideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchedVideoModelCopyWith<$Res> {
  factory $WatchedVideoModelCopyWith(
          WatchedVideoModel value, $Res Function(WatchedVideoModel) then) =
      _$WatchedVideoModelCopyWithImpl<$Res, WatchedVideoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'link') String? link,
      @JsonKey(name: 'timeWatched') String? timeWatched});
}

/// @nodoc
class _$WatchedVideoModelCopyWithImpl<$Res, $Val extends WatchedVideoModel>
    implements $WatchedVideoModelCopyWith<$Res> {
  _$WatchedVideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? timeWatched = freezed,
  }) {
    return _then(_value.copyWith(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      timeWatched: freezed == timeWatched
          ? _value.timeWatched
          : timeWatched // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchedVideoModelImplCopyWith<$Res>
    implements $WatchedVideoModelCopyWith<$Res> {
  factory _$$WatchedVideoModelImplCopyWith(_$WatchedVideoModelImpl value,
          $Res Function(_$WatchedVideoModelImpl) then) =
      __$$WatchedVideoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'link') String? link,
      @JsonKey(name: 'timeWatched') String? timeWatched});
}

/// @nodoc
class __$$WatchedVideoModelImplCopyWithImpl<$Res>
    extends _$WatchedVideoModelCopyWithImpl<$Res, _$WatchedVideoModelImpl>
    implements _$$WatchedVideoModelImplCopyWith<$Res> {
  __$$WatchedVideoModelImplCopyWithImpl(_$WatchedVideoModelImpl _value,
      $Res Function(_$WatchedVideoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? timeWatched = freezed,
  }) {
    return _then(_$WatchedVideoModelImpl(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      timeWatched: freezed == timeWatched
          ? _value.timeWatched
          : timeWatched // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WatchedVideoModelImpl implements _WatchedVideoModel {
  const _$WatchedVideoModelImpl(
      {@JsonKey(name: 'link') this.link,
      @JsonKey(name: 'timeWatched') this.timeWatched = "0"});

  factory _$WatchedVideoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchedVideoModelImplFromJson(json);

  @override
  @JsonKey(name: 'link')
  final String? link;
  @override
  @JsonKey(name: 'timeWatched')
  final String? timeWatched;

  @override
  String toString() {
    return 'WatchedVideoModel(link: $link, timeWatched: $timeWatched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchedVideoModelImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.timeWatched, timeWatched) ||
                other.timeWatched == timeWatched));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, link, timeWatched);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchedVideoModelImplCopyWith<_$WatchedVideoModelImpl> get copyWith =>
      __$$WatchedVideoModelImplCopyWithImpl<_$WatchedVideoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchedVideoModelImplToJson(
      this,
    );
  }
}

abstract class _WatchedVideoModel implements WatchedVideoModel {
  const factory _WatchedVideoModel(
          {@JsonKey(name: 'link') final String? link,
          @JsonKey(name: 'timeWatched') final String? timeWatched}) =
      _$WatchedVideoModelImpl;

  factory _WatchedVideoModel.fromJson(Map<String, dynamic> json) =
      _$WatchedVideoModelImpl.fromJson;

  @override
  @JsonKey(name: 'link')
  String? get link;
  @override
  @JsonKey(name: 'timeWatched')
  String? get timeWatched;
  @override
  @JsonKey(ignore: true)
  _$$WatchedVideoModelImplCopyWith<_$WatchedVideoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
