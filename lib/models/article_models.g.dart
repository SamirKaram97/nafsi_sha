// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleModelImpl _$$ArticleModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticleModelImpl(
      sId: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishDate: json['publish_date'] as String?,
      publishBy: json['publish_by'] as String?,
      isPublished: json['isPublished'] as bool?,
      iV: json['__v'] as int?,
    );

Map<String, dynamic> _$$ArticleModelImplToJson(_$ArticleModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
      'publish_date': instance.publishDate,
      'publish_by': instance.publishBy,
      'isPublished': instance.isPublished,
      '__v': instance.iV,
    };

_$PaginationModelImpl _$$PaginationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationModelImpl(
      currentPage: json['currentpage'] as int?,
      limit: json['limit'] as int?,
      numberOfPages: json['numberofpages'] as int?,
    );

Map<String, dynamic> _$$PaginationModelImplToJson(
        _$PaginationModelImpl instance) =>
    <String, dynamic>{
      'currentpage': instance.currentPage,
      'limit': instance.limit,
      'numberofpages': instance.numberOfPages,
    };

_$ArticleResponseImpl _$$ArticleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleResponseImpl(
      results: json['results'] as int?,
      paginationModel: json['paginationresult'] == null
          ? null
          : PaginationModel.fromJson(
              json['paginationresult'] as Map<String, dynamic>),
      articleModelList: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticleResponseImplToJson(
        _$ArticleResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'paginationresult': instance.paginationModel,
      'data': instance.articleModelList,
    };
