import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/widgets/article_image_and_icon.dart';

import '../../models/article_models.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/custom_app_bar.dart';

class ArticleContentScreen extends StatelessWidget {
  const ArticleContentScreen({super.key, required this.articleModel});
  final ArticleModel articleModel;

  static const String _dummy="Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo vel cum. Fermentum laoreet est morbi pulvinar sodales venenatis nulla. Amet risus vivamus semper est volutpat cras vulputate orci. Posuere purus rutrum tristique feugiat nunc lectus lacus consectetur tempus. Non ultrices maecenas ullamcorper adipiscing molestie nisi nullam. Ac vitae neque tincidunt orci. Elementum neque scelerisque arcu habitasse.";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
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
                    ArticleImageAndIcon(tag: articleModel.sId!,articleModel: articleModel),
                    const SizedBox(height: 10,),
                    Text(articleModel.title??"",style: AppStyles.mBold14(context).copyWith(color: Colors.black),),
                    Text(articleModel.content??"",style: AppStyles.mMedium12(context).copyWith(color:AppColors.blackWith75),),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

}


