import '../../../models/article_models.dart';

abstract class ArticlesState{}

 class ArticlesInitState extends ArticlesState{}

class GetArticlesLoadingState extends ArticlesState{}

class GetArticlesErrorState extends ArticlesState{
 final String errorMessage;

  GetArticlesErrorState({required this.errorMessage});
}

class GetArticlesSuccessState extends ArticlesState{
 final List<ArticleModel?>? articles;

  GetArticlesSuccessState({required this.articles});
}

class AddArticleToFavourites extends ArticlesState{}
class RemoveArticleFromFavourites extends ArticlesState{}
