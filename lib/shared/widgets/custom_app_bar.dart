import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';

import '../styles/colors.dart';
import '../styles/images.dart';
import 'package:dio/dio.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.backButton, this.deep, this.blackIcons});

  final bool? backButton;
  final bool? deep;
  final bool? blackIcons;


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
                IconButton(icon: backButton==true?SvgPicture.asset(Assets.imagesBackIcon,height: 16,width: 9,color: blackIcons==true?Colors.white:null):SvgPicture.asset(Assets.imagesDrawerIcon,height: 22.5,width: 22.5,), onPressed: () {
                    if(backButton==true)
                    {
                      LayoutCubit.get(context).backButtonClicked(context,deep: deep);
                    }
                    else
                      {
                        LayoutCubit.get(context).scaffoldKey.currentState?.openDrawer();
                      }

                },),
                SvgPicture.asset(Assets.imagesSmallLogoIcon,color: blackIcons==true?Colors.white:null,),
                IconButton(icon: SvgPicture.asset(Assets.imagesNotificationIcon,color: blackIcons==true?Colors.white:null,height: 25,width: 25,),onPressed: (){


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