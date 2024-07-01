import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_state.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/widgets/article_image_and_icon.dart';


import '../../models/article_models.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import '../../shared/widgets/custom_app_bar.dart';

class ArticleContentScreen extends StatefulWidget {
   const ArticleContentScreen({super.key, required this.articleModel});
  final ArticleModel articleModel;

  static const String _dummy="Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.";

  @override
  State<ArticleContentScreen> createState() => _ArticleContentScreenState();
}

class _ArticleContentScreenState extends State<ArticleContentScreen> {

  @override
  void initState() {
    var list=LayoutCubit.get(context).userSession?.articles.toList();
    if(!list!.contains(widget.articleModel.sId))
      {
    list.add(widget.articleModel.sId!);
    LayoutCubit.get(context).userSession=LayoutCubit.get(context).userSession?.copyWith(articles: list);}
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<ArticlesCubit,ArticlesState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        bool isFavouritesContainArticle=ArticlesCubit.get(context).isFavouritesContainArticle(widget.articleModel);

        return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(
                    deep: true,
                    backButton: true,
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          ArticleImageAndIcon(tag: widget.articleModel.sId!,articleModel: widget.articleModel,inContentPage: true),
                          const SizedBox(height: 10,),
                          Text(widget.articleModel.title??"",style: AppStyles.mBold14(context).copyWith(color: Colors.black),),
                          Text(widget.articleModel.content??"",style: AppStyles.mMedium12(context).copyWith(color:AppColors.blackWith75),),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: GestureDetector(
                  onTap: () {
                    ArticlesCubit.get(context).addOrRemoveArticleFavourites(widget.articleModel);
                  },
                  child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 32,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ]),
                    child: Padding(
                      padding:   const EdgeInsets.all(14.0),
                      child: CircleAvatar(backgroundColor: isFavouritesContainArticle?AppColors.primaryColor:  const Color(0XFFFEFEFE).withOpacity(.2),child: SvgPicture.asset(Assets.imagesBookMarkIcon,color: isFavouritesContainArticle?AppColors.whiteColor:null,)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
      },
    );
  }
}


