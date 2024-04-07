import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/articles/articles_screen.dart';
import 'package:gp_nafsi/screens/chat/chat_screen.dart';
import 'package:gp_nafsi/screens/favorites/favorites%20_screen.dart';
import 'package:gp_nafsi/screens/home/home_screen.dart';
import 'package:gp_nafsi/screens/profile/profile_screen.dart';
import 'package:gp_nafsi/screens/sounds/sounds_screen.dart';
import 'package:gp_nafsi/screens/tests/tests_screen.dart';
import 'package:gp_nafsi/screens/videos/videos_screen.dart';
import 'package:gp_nafsi/shared/styles/components.dart';

import '../../models/custom_nav_bar_item_model.dart';
import '../../shared/styles/images.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  bool isSoundPlaying=false;

  int currentIndex = 0;
  final List<BottomNavBarItemModel> items = [
    BottomNavBarItemModel(title: "Home", iconPath: Assets.imagesHomeIcon),
    BottomNavBarItemModel(title: "Sounds", iconPath: Assets.imagesSoundsIcon),
    BottomNavBarItemModel(
        title: "Favorites ", iconPath: Assets.imagesFavoritesIcon),
    BottomNavBarItemModel(title: "Profile", iconPath: Assets.imagesProfileIcon),
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

  void changeAppSoundPlay(bool isPlay)
  {
    isSoundPlaying=isPlay;
    emit(LayoutChangeAppSoundPlayState());
  }

  void backButtonClicked(context) {
    if (currentIndex == 4 || currentIndex == 5 || currentIndex == 6) {
      LayoutCubit.get(context).changeBottomNavBarIndex(0, context);
    } else {
      Navigator.pop(context);
    }
  }


}