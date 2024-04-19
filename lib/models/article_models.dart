import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'article_models.freezed.dart';
part 'article_models.g.dart';



@freezed
class ArticleModel with _$ArticleModel
{
  const factory ArticleModel({
    @JsonKey(name: '_id')
    String? sId,

    String? title,


    String? content,


    List<String>? tags,

    @JsonKey(name: 'publish_date')
    String? publishDate,

    @JsonKey(name: 'publish_by')
    String? publishBy,


    bool? isPublished,

    @JsonKey(name: '__v')
    int? iV,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, Object?> json)
  => _$ArticleModelFromJson(json);





  static String encode(List<ArticleModel> articles) => json.encode(
    articles
        .map<Map<String, dynamic>>((article) => article.toJson())
        .toList(),
  );

  static List<ArticleModel> decode(String articles) =>
      (json.decode(articles) as List<dynamic>)
          .map<ArticleModel>((item) => ArticleModel.fromJson(item))
          .toList();
}


@freezed
class PaginationModel with _$PaginationModel
{
  const factory PaginationModel({
    @JsonKey(name: 'currentpage')
    int? currentPage,
    int? limit,
    @JsonKey(name: 'numberofpages')
    int? numberOfPages,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, Object?> json)
  => _$PaginationModelFromJson(json);
}

@freezed
class ArticleResponse with _$ArticleResponse
{
  const factory ArticleResponse({
    int? results,
    @JsonKey(name: 'paginationresult')
    PaginationModel? paginationModel,
    @JsonKey(name: 'data')
    List<ArticleModel?>? articleModelList,
  }) = _ArticleResponse;

  factory ArticleResponse.fromJson(Map<String, Object?> json)
  => _$ArticleResponseFromJson(json);
}








