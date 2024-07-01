// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return _ArticleModel.fromJson(json);
}

/// @nodoc
mixin _$ArticleModel {
  @JsonKey(name: '_id')
  String? get sId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'publish_date')
  String? get publishDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'publish_by')
  String? get publishBy => throw _privateConstructorUsedError;
  bool? get isPublished => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get iV => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleModelCopyWith<ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleModelCopyWith<$Res> {
  factory $ArticleModelCopyWith(
          ArticleModel value, $Res Function(ArticleModel) then) =
      _$ArticleModelCopyWithImpl<$Res, ArticleModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? sId,
      String? title,
      String? content,
      String? cover,
      List<String>? tags,
      @JsonKey(name: 'publish_date') String? publishDate,
      @JsonKey(name: 'publish_by') String? publishBy,
      bool? isPublished,
      @JsonKey(name: '__v') int? iV});
}

/// @nodoc
class _$ArticleModelCopyWithImpl<$Res, $Val extends ArticleModel>
    implements $ArticleModelCopyWith<$Res> {
  _$ArticleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? cover = freezed,
    Object? tags = freezed,
    Object? publishDate = freezed,
    Object? publishBy = freezed,
    Object? isPublished = freezed,
    Object? iV = freezed,
  }) {
    return _then(_value.copyWith(
      sId: freezed == sId
          ? _value.sId
          : sId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
      publishBy: freezed == publishBy
          ? _value.publishBy
          : publishBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublished: freezed == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool?,
      iV: freezed == iV
          ? _value.iV
          : iV // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleModelImplCopyWith<$Res>
    implements $ArticleModelCopyWith<$Res> {
  factory _$$ArticleModelImplCopyWith(
          _$ArticleModelImpl value, $Res Function(_$ArticleModelImpl) then) =
      __$$ArticleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? sId,
      String? title,
      String? content,
      String? cover,
      List<String>? tags,
      @JsonKey(name: 'publish_date') String? publishDate,
      @JsonKey(name: 'publish_by') String? publishBy,
      bool? isPublished,
      @JsonKey(name: '__v') int? iV});
}

/// @nodoc
class __$$ArticleModelImplCopyWithImpl<$Res>
    extends _$ArticleModelCopyWithImpl<$Res, _$ArticleModelImpl>
    implements _$$ArticleModelImplCopyWith<$Res> {
  __$$ArticleModelImplCopyWithImpl(
      _$ArticleModelImpl _value, $Res Function(_$ArticleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? cover = freezed,
    Object? tags = freezed,
    Object? publishDate = freezed,
    Object? publishBy = freezed,
    Object? isPublished = freezed,
    Object? iV = freezed,
  }) {
    return _then(_$ArticleModelImpl(
      sId: freezed == sId
          ? _value.sId
          : sId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
      publishBy: freezed == publishBy
          ? _value.publishBy
          : publishBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublished: freezed == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool?,
      iV: freezed == iV
          ? _value.iV
          : iV // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleModelImpl with DiagnosticableTreeMixin implements _ArticleModel {
  const _$ArticleModelImpl(
      {@JsonKey(name: '_id') this.sId,
      this.title,
      this.content,
      this.cover,
      final List<String>? tags,
      @JsonKey(name: 'publish_date') this.publishDate,
      @JsonKey(name: 'publish_by') this.publishBy,
      this.isPublished,
      @JsonKey(name: '__v') this.iV})
      : _tags = tags;

  factory _$ArticleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? sId;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? cover;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'publish_date')
  final String? publishDate;
  @override
  @JsonKey(name: 'publish_by')
  final String? publishBy;
  @override
  final bool? isPublished;
  @override
  @JsonKey(name: '__v')
  final int? iV;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArticleModel(sId: $sId, title: $title, content: $content, cover: $cover, tags: $tags, publishDate: $publishDate, publishBy: $publishBy, isPublished: $isPublished, iV: $iV)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArticleModel'))
      ..add(DiagnosticsProperty('sId', sId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('cover', cover))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('publishDate', publishDate))
      ..add(DiagnosticsProperty('publishBy', publishBy))
      ..add(DiagnosticsProperty('isPublished', isPublished))
      ..add(DiagnosticsProperty('iV', iV));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleModelImpl &&
            (identical(other.sId, sId) || other.sId == sId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.publishBy, publishBy) ||
                other.publishBy == publishBy) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.iV, iV) || other.iV == iV));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sId,
      title,
      content,
      cover,
      const DeepCollectionEquality().hash(_tags),
      publishDate,
      publishBy,
      isPublished,
      iV);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleModelImplCopyWith<_$ArticleModelImpl> get copyWith =>
      __$$ArticleModelImplCopyWithImpl<_$ArticleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleModelImplToJson(
      this,
    );
  }
}

abstract class _ArticleModel implements ArticleModel {
  const factory _ArticleModel(
      {@JsonKey(name: '_id') final String? sId,
      final String? title,
      final String? content,
      final String? cover,
      final List<String>? tags,
      @JsonKey(name: 'publish_date') final String? publishDate,
      @JsonKey(name: 'publish_by') final String? publishBy,
      final bool? isPublished,
      @JsonKey(name: '__v') final int? iV}) = _$ArticleModelImpl;

  factory _ArticleModel.fromJson(Map<String, dynamic> json) =
      _$ArticleModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get sId;
  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get cover;
  @override
  List<String>? get tags;
  @override
  @JsonKey(name: 'publish_date')
  String? get publishDate;
  @override
  @JsonKey(name: 'publish_by')
  String? get publishBy;
  @override
  bool? get isPublished;
  @override
  @JsonKey(name: '__v')
  int? get iV;
  @override
  @JsonKey(ignore: true)
  _$$ArticleModelImplCopyWith<_$ArticleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  @JsonKey(name: 'currentpage')
  int? get currentPage => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'numberofpages')
  int? get numberOfPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'currentpage') int? currentPage,
      int? limit,
      @JsonKey(name: 'numberofpages') int? numberOfPages});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? limit = freezed,
    Object? numberOfPages = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfPages: freezed == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$PaginationModelImplCopyWith(_$PaginationModelImpl value,
          $Res Function(_$PaginationModelImpl) then) =
      __$$PaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'currentpage') int? currentPage,
      int? limit,
      @JsonKey(name: 'numberofpages') int? numberOfPages});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$PaginationModelImpl>
    implements _$$PaginationModelImplCopyWith<$Res> {
  __$$PaginationModelImplCopyWithImpl(
      _$PaginationModelImpl _value, $Res Function(_$PaginationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? limit = freezed,
    Object? numberOfPages = freezed,
  }) {
    return _then(_$PaginationModelImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfPages: freezed == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationModelImpl
    with DiagnosticableTreeMixin
    implements _PaginationModel {
  const _$PaginationModelImpl(
      {@JsonKey(name: 'currentpage') this.currentPage,
      this.limit,
      @JsonKey(name: 'numberofpages') this.numberOfPages});

  factory _$PaginationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationModelImplFromJson(json);

  @override
  @JsonKey(name: 'currentpage')
  final int? currentPage;
  @override
  final int? limit;
  @override
  @JsonKey(name: 'numberofpages')
  final int? numberOfPages;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationModel(currentPage: $currentPage, limit: $limit, numberOfPages: $numberOfPages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationModel'))
      ..add(DiagnosticsProperty('currentPage', currentPage))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('numberOfPages', numberOfPages));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationModelImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, limit, numberOfPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<_$PaginationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationModelImplToJson(
      this,
    );
  }
}

abstract class _PaginationModel implements PaginationModel {
  const factory _PaginationModel(
          {@JsonKey(name: 'currentpage') final int? currentPage,
          final int? limit,
          @JsonKey(name: 'numberofpages') final int? numberOfPages}) =
      _$PaginationModelImpl;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$PaginationModelImpl.fromJson;

  @override
  @JsonKey(name: 'currentpage')
  int? get currentPage;
  @override
  int? get limit;
  @override
  @JsonKey(name: 'numberofpages')
  int? get numberOfPages;
  @override
  @JsonKey(ignore: true)
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return _ArticleResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleResponse {
  int? get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'paginationresult')
  PaginationModel? get paginationModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<ArticleModel?>? get articleModelList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleResponseCopyWith<ArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleResponseCopyWith<$Res> {
  factory $ArticleResponseCopyWith(
          ArticleResponse value, $Res Function(ArticleResponse) then) =
      _$ArticleResponseCopyWithImpl<$Res, ArticleResponse>;
  @useResult
  $Res call(
      {int? results,
      @JsonKey(name: 'paginationresult') PaginationModel? paginationModel,
      @JsonKey(name: 'data') List<ArticleModel?>? articleModelList});

  $PaginationModelCopyWith<$Res>? get paginationModel;
}

/// @nodoc
class _$ArticleResponseCopyWithImpl<$Res, $Val extends ArticleResponse>
    implements $ArticleResponseCopyWith<$Res> {
  _$ArticleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? paginationModel = freezed,
    Object? articleModelList = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as int?,
      paginationModel: freezed == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
      articleModelList: freezed == articleModelList
          ? _value.articleModelList
          : articleModelList // ignore: cast_nullable_to_non_nullable
              as List<ArticleModel?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res>? get paginationModel {
    if (_value.paginationModel == null) {
      return null;
    }

    return $PaginationModelCopyWith<$Res>(_value.paginationModel!, (value) {
      return _then(_value.copyWith(paginationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleResponseImplCopyWith<$Res>
    implements $ArticleResponseCopyWith<$Res> {
  factory _$$ArticleResponseImplCopyWith(_$ArticleResponseImpl value,
          $Res Function(_$ArticleResponseImpl) then) =
      __$$ArticleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? results,
      @JsonKey(name: 'paginationresult') PaginationModel? paginationModel,
      @JsonKey(name: 'data') List<ArticleModel?>? articleModelList});

  @override
  $PaginationModelCopyWith<$Res>? get paginationModel;
}

/// @nodoc
class __$$ArticleResponseImplCopyWithImpl<$Res>
    extends _$ArticleResponseCopyWithImpl<$Res, _$ArticleResponseImpl>
    implements _$$ArticleResponseImplCopyWith<$Res> {
  __$$ArticleResponseImplCopyWithImpl(
      _$ArticleResponseImpl _value, $Res Function(_$ArticleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? paginationModel = freezed,
    Object? articleModelList = freezed,
  }) {
    return _then(_$ArticleResponseImpl(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as int?,
      paginationModel: freezed == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
      articleModelList: freezed == articleModelList
          ? _value._articleModelList
          : articleModelList // ignore: cast_nullable_to_non_nullable
              as List<ArticleModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleResponseImpl
    with DiagnosticableTreeMixin
    implements _ArticleResponse {
  const _$ArticleResponseImpl(
      {this.results,
      @JsonKey(name: 'paginationresult') this.paginationModel,
      @JsonKey(name: 'data') final List<ArticleModel?>? articleModelList})
      : _articleModelList = articleModelList;

  factory _$ArticleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleResponseImplFromJson(json);

  @override
  final int? results;
  @override
  @JsonKey(name: 'paginationresult')
  final PaginationModel? paginationModel;
  final List<ArticleModel?>? _articleModelList;
  @override
  @JsonKey(name: 'data')
  List<ArticleModel?>? get articleModelList {
    final value = _articleModelList;
    if (value == null) return null;
    if (_articleModelList is EqualUnmodifiableListView)
      return _articleModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArticleResponse(results: $results, paginationModel: $paginationModel, articleModelList: $articleModelList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArticleResponse'))
      ..add(DiagnosticsProperty('results', results))
      ..add(DiagnosticsProperty('paginationModel', paginationModel))
      ..add(DiagnosticsProperty('articleModelList', articleModelList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleResponseImpl &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.paginationModel, paginationModel) ||
                other.paginationModel == paginationModel) &&
            const DeepCollectionEquality()
                .equals(other._articleModelList, _articleModelList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, results, paginationModel,
      const DeepCollectionEquality().hash(_articleModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      __$$ArticleResponseImplCopyWithImpl<_$ArticleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticleResponse implements ArticleResponse {
  const factory _ArticleResponse(
      {final int? results,
      @JsonKey(name: 'paginationresult') final PaginationModel? paginationModel,
      @JsonKey(name: 'data')
      final List<ArticleModel?>? articleModelList}) = _$ArticleResponseImpl;

  factory _ArticleResponse.fromJson(Map<String, dynamic> json) =
      _$ArticleResponseImpl.fromJson;

  @override
  int? get results;
  @override
  @JsonKey(name: 'paginationresult')
  PaginationModel? get paginationModel;
  @override
  @JsonKey(name: 'data')
  List<ArticleModel?>? get articleModelList;
  @override
  @JsonKey(ignore: true)
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
