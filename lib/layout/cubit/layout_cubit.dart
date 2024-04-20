import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import 'package:gp_nafsi/screens/articles/articles_screen.dart';
import 'package:gp_nafsi/screens/chat/chat_screen.dart';
import 'package:gp_nafsi/screens/favorites/favorites%20_screen.dart';
import 'package:gp_nafsi/screens/home/home_screen.dart';
import 'package:gp_nafsi/screens/profile/profile_screen.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/sounds/sounds_screen.dart';
import 'package:gp_nafsi/screens/tests/tests_screen.dart';
import 'package:gp_nafsi/screens/videos/videos_screen.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/utils/constants.dart';
import '../../models/article_models.dart';
import '../../models/custom_nav_bar_item_model.dart';
import '../../screens/login/login_screen.dart';
import '../../shared/network/local/shared_helper.dart';
import '../../shared/styles/images.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  bool isSoundPlaying = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;
  List<BottomNavBarItemModel> items(context) => [
        BottomNavBarItemModel(
            title: S.of(context).home, iconPath: Assets.imagesHomeIcon),
        BottomNavBarItemModel(
            title: S.of(context).sounds, iconPath: Assets.imagesSoundsIcon),
        BottomNavBarItemModel(
            title: S.of(context).favorites, iconPath: Assets.imagesFavoritesIcon),
        BottomNavBarItemModel(
            title: S.of(context).profile, iconPath: Assets.imagesProfileIcon),
      ];

  final List<Widget> layoutBodyWidgets = const [
    HomeScreen(),
    SoundsScreen(),
    FavoritesScreen(),
    ProfileScreen(),
    VideosScreen(),
    ArticlesScreen(),
    TestsScreen(),
  ];

  void changeBottomNavBarIndex(int index, context) {
    if (index == 7) {
      navTo(context, const ChatScreen());
    } else {
      if (currentIndex != index) {
        currentIndex = index;
        emit(LayoutChangeBottomNavBarIndexState());
      }
    }
  }

  void changeAppSoundPlay(bool isPlay) {
    isSoundPlaying = isPlay;
    emit(LayoutChangeAppSoundPlayState());
  }

  void backButtonClicked(context, {bool? deep}) {
    if (deep == true) {
      Navigator.pop(context);
    } else {
      if (currentIndex == 4 || currentIndex == 5 || currentIndex == 6) {
        LayoutCubit.get(context).changeBottomNavBarIndex(0, context);
      } else {
        print("must exit");
        // exit(0);
      }
    }
  }


  void logOut(context) {
    SharedHelper.removeKey(Constants.tokenSharedKey);
    currentIndex = 0;
    GoogleSignIn().signOut();
    navToNoBack(context, LoginScreen());
  }
}
