import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';

import '../styles/colors.dart';
import '../styles/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.backButton});

  final bool? backButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: backButton==true?SvgPicture.asset(Assets.imagesBackIcon,height: 16,width: 9,):SvgPicture.asset(Assets.imagesDrawerIcon,height: 22.5,width: 22.5,), onPressed: () {
                    if(backButton==true)
                    {
                      LayoutCubit.get(context).backButtonClicked(context);
                    }

                },),
                SvgPicture.asset(Assets.imagesSmallLogoIcon),
                IconButton(icon: SvgPicture.asset(Assets.imagesNotificationIcon,height: 25,width: 25,),onPressed: (){
                }),
              ],
            ),
          ),
        ),
        Divider(
          color: AppColors.dividerColor,
        )
      ],
    );
  }
}


//todo
/*
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar( title: Text("Sample App Bar") );
  }
}*/