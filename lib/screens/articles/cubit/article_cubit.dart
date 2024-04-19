import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:gp_nafsi/shared/styles/components.dart';

import '../../../generated/l10n.dart';
import '../../../models/article_models.dart';
import '../../../shared/network/local/shared_helper.dart';
import 'article_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesInitState());

  static ArticlesCubit get(context) => BlocProvider.of(context);
  List<ArticleModel?>? localArticles = [
    const ArticleModel(title: "Article 1",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id1"),
    const ArticleModel(title: "Article 2",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id2"),
    const ArticleModel(title: "Article 3",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id3"),
    const ArticleModel(title: "Article 4",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id4"),
    const ArticleModel(title: "Article 5",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id5"),
    const ArticleModel(title: "Article 6",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id6"),
    const ArticleModel(title: "Article 7",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id7"),
    const ArticleModel(title: "Article 8",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id8"),
    const ArticleModel(title: "Article 9",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id9"),
    const ArticleModel(title: "Article 10",
        content: "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.",
        sId: "id10"),
  ];

  List<ArticleModel?>? articles;

  void getArticles(context) async {
    if (await ApiServices.internetConnectionChecker.hasConnection) {
      emit(GetArticlesLoadingState());
      try {
        articles =
            (await ApiServices.getArticle()).articleModelList;
        emit(GetArticlesSuccessState(articles: articles));
      } catch (e) {
        showToast(state: ToastState.WARNING,
            text: "Error while loading articles.. loading the local articles");
        emit(GetArticlesErrorState(errorMessage: ApiServices.getErrorMessage(e, context)));
      }
    }
    else {
      emit(GetArticlesErrorState(errorMessage: S.of(context).networkError));
    }
    }


  late List<ArticleModel> favouriteArticles;


  void getSavedArticles()
  {
    favouriteArticles=SharedHelper.getFavouriteArticles();
    print(favouriteArticles.length);
  }

  void _addArticleToFavourites(ArticleModel articleModel)async
  {
    favouriteArticles.add(articleModel);
    await SharedHelper.saveFavouriteArticles(favouriteArticles);
    emit(AddArticleToFavourites());
  }

  void _removeArticleFromFavourites(ArticleModel articleModel)async
  {
    favouriteArticles.removeWhere((element) => element.sId==articleModel.sId);
    await SharedHelper.saveFavouriteArticles(favouriteArticles);
    emit(RemoveArticleFromFavourites());
  }



  void addOrRemoveArticleFavourites(ArticleModel articleModel)
  {
    if(isFavouritesContainArticle(articleModel))
    {
      _removeArticleFromFavourites(articleModel);
    }
    else
    {
      _addArticleToFavourites(articleModel);
    }
  }

  bool isFavouritesContainArticle(ArticleModel articleModel)
  {
    for(int i=0;i<favouriteArticles.length;i++)
    {
      if(favouriteArticles[i].sId==articleModel.sId)
      {
        return true;
      }
    }
    return false;
  }


}
  String dummy = "Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.";
