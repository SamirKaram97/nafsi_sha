import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_nafsi/models/session_model.dart';
import 'package:gp_nafsi/models/user_model.dart';
import 'package:gp_nafsi/screens/articles/articles_screen.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/chat/chat_screen.dart';
import 'package:gp_nafsi/screens/favorites/favorites%20_screen.dart';
import 'package:gp_nafsi/screens/home/home_screen.dart';
import 'package:gp_nafsi/screens/profile/profile_screen.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/sounds/sounds_screen.dart';
import 'package:gp_nafsi/screens/tests/tests_screen.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/videos_screen.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pausable_timer/pausable_timer.dart';

import '../../models/custom_nav_bar_item_model.dart';
import '../../models/full_session_model.dart';
import '../../screens/login/login_screen.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/network/local/shared_helper.dart';
import '../../shared/network/remote/api Services.dart';
import '../../shared/styles/images.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  bool isSoundPlaying = false;
  late int sessionTimerInSeconds;
  late int chatTimerInSeconds;
  late int videosTimerInSeconds;
  PausableTimer? sessionTimer;
  PausableTimer? chatTimer;
  PausableTimer? videosTimer;
  SessionModel? userSession;
  late Map<String,int> videoWithIntTime;
  String? sessionId;
  int selectedFavouriteIndex=0;


  var scaffoldKey = GlobalKey<ScaffoldState>();
  final InternetConnectionChecker _internetConnectionChecker =
  InternetConnectionChecker();

  UserModel? userModel;
  int currentIndex = 0;
  List<BottomNavBarItemModel> items(context) => [
        BottomNavBarItemModel(
            title: AppStrings.home.tr(), iconPath: Assets.imagesHomeIcon),
        BottomNavBarItemModel(
            title: AppStrings.sounds.tr(), iconPath: Assets.imagesSoundsIcon),
        BottomNavBarItemModel(
            title: AppStrings.favorites.tr(), iconPath: Assets.imagesFavoritesIcon),
        BottomNavBarItemModel(
            title: AppStrings.profile.tr(), iconPath: Assets.imagesProfileIcon),
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

  void changeFavouriteIndex(int index, context) {
    selectedFavouriteIndex=index;
    emit(LayoutChangeFavouriteIndexState());
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

  bool isLogout=false;
  void logOut(context) {
    isLogout=true;
    navToNoBack(context, LoginScreen());
    SharedHelper.removeShared();
    currentIndex = 0;
    GoogleSignIn().signOut();
    // SoundsCubit.get(context).audioPlayer.dispose();
    VideosCubit.get(context).videos=null;
    VideosCubit.get(context).favouriteVideos=[];
    ArticlesCubit.get(context).articles=null;
    AppCubit.get(context).token=null;
    ArticlesCubit.get(context).favouriteArticles=[];

    createSession(context).then((value) {
      emit(LogoutState());
      isLogout=false;
    });

  }

  // void logOutAndCreateSession(context,bool? isFromLogout)
  // {
  //   if(isFromLogout==true)
  //     {
  //   _createSession(context).then((value) {
  //     emit(LogoutState());
  //   });
  // }
  //   else{
  //     _createSession(context);
  //   }
  // }

  void getUserData(context)async
  {
    emit(GetUserDataLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        // RegisterRequestModel requestModel=RegisterRequestModel(firstname: "Mohamed",age: "40",lastname: "gmomma",email: emailController.text,gender:"male",password: passwordController.text);
        userModel = await ApiServices.getMe(context);
          emit(GetUserDataSuccessState());
        print(userModel?.age);
      }
      catch (error) {
        log(error.toString());
        emit(GetUserDataErrorState());

      }
    } else {
      log("Internet Problem");
      emit(GetUserDataErrorState());

  }}


  List<CustomUISessionModel> userSessions=[];
  void getUserSessionData(context)async
  {
    emit(GetUserSessionsLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        userSessions= await ApiServices.getSessions(context);
        emit(GetUserSessionsSuccessState());
      }
      catch (error) {
        print(error.toString());
        emit(GetUserSessionsErrorState());
      }
    } else {
      emit(GetUserDataErrorState());
    }}


  Future<void> createOrUpdateSession(context)async
  {
    createSession(context);
    // if(sessionId==null)
    //   {
    //     _createSession(context);
    //   }
    // else
    //   {
    //     _updateSession(context);
    //   }
  }

  Future<void> createSession(context)async
  {
    emit(CreateSessionLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        print(userSession?.toJson());
        sessionId=await ApiServices.createSession(userSession!,context);
        
        print("create");
        emit(CreateSessionSuccessState());
      }
      catch (error) {
        print(error.toString());
        log(ApiServices.getErrorMessage(error, context));
        emit(CreateSessionErrorState(sessionModel: userSession!));
      }
    } else {
      emit(CreateSessionErrorState(sessionModel: userSession!));
    }
  }

  void _updateSession(context)async
  {
    emit(UpdateSessionLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        await ApiServices.updateSession(userSession!,sessionId!,context);
        print("update");
        emit(UpdateSessionSuccessState());
      }
      catch (error) {
        print(error.toString());
        emit(UpdateSessionErrorState(sessionModel: userSession!));
      }
    } else {
      emit(UpdateSessionErrorState(sessionModel: userSession!));
    }
  }

  void changeUserPassword(String oldPassword,String newPassword,context)async
  {
    emit(ChangePasswordLoadingStata());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        await ApiServices.updateUserPassword(oldPassword,newPassword,context);
        showToast(state: ToastState.SUCCESS, text: AppStrings.passwordChangedSuccessfully.tr());
        emit(ChangePasswordSuccessStata());
      }
      catch (error) {
        print(error.toString());
        log(ApiServices.getErrorMessage(error, context));
        showToast(state: ToastState.EROOR, text:ApiServices.getErrorMessage(error, context));
        emit(ChangePasswordErrorStata(
          errorMessage: ApiServices.getErrorMessage(error, context)
        ));

      }
    } else {
      emit(ChangePasswordErrorStata(errorMessage: AppStrings.networkError.tr()));
    }
  }

  void getProfileSaveFaceId(String faceId)
  {
    emit(GetProfileFaceIdSuccess(faceId: faceId));
  }

  void updateUserFaceId(String faceId,context)async
  {
    emit(UpdateUserFaceIdLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        UserModel uModel = await ApiServices.updateMeWithFaceId(faceId,context);
        userModel=uModel;
        emit(UpdateUserFaceIdSuccessState());
      }
      catch (error) {
        log(error.toString());
        log(ApiServices.getErrorMessage(error, context));
        emit(UpdateUserFaceIdErrorState(errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(UpdateUserFaceIdErrorState(errorMessage: AppStrings.networkError.tr()));

    }
  }




  void getAll(context)
  {
    SoundsCubit.get(context);
    VideosCubit.get(context).getVideos(context);
    VideosCubit.get(context).getFavouriteVideos();
    ArticlesCubit.get(context).getArticles(context);
    ArticlesCubit.get(context).getFavouriteArticles();
    getUserData(context);
    getUserSessionData(context);
  }

  void startSessionTimer()
  {
    videoWithIntTime={};
    sessionTimerInSeconds=0;
    userSession=const SessionModel();
    sessionTimer=PausableTimer.periodic(const Duration(seconds:1), () {
      sessionTimerInSeconds=sessionTimerInSeconds+1;
      userSession=userSession!.copyWith(appTime: convertSecondsToTime(sessionTimerInSeconds));
      print(userSession?.toJson());
    })..start();
  }



  void _initChatTimer()
  {
    chatTimerInSeconds=0;
    chatTimer=PausableTimer.periodic(const Duration(seconds:1), () {
      chatTimerInSeconds=chatTimerInSeconds+1;
      print("chat timer $chatTimerInSeconds");
    });
  }
  void _initVideosTimer()
  {
    videosTimerInSeconds=0;
    videosTimer=PausableTimer.periodic(const Duration(seconds:1), () {
      videosTimerInSeconds=videosTimerInSeconds+1;
      print("videos timer $videosTimerInSeconds");
    });
  }

  void startChatTimer()
  {
    chatTimer!.start();
  }

  void startVideosTimer()
  {
    videosTimer!.start();
  }

  Future<void> pauseChatTimer()async
  {
    chatTimer!.pause();
  }
  Future<void> pauseVideosTimer()async
  {
    videosTimer!.pause();
  }


  void _disposeAppTimer()
  {
    sessionTimer!.cancel();
  }

  void _disposeChatTimer()
  {
    chatTimer!.cancel();
  }
  void _disposeVideosTimer()
  {
    videosTimer!.cancel();
  }

  void disposeTimers()
  {
    _disposeAppTimer();
    _disposeChatTimer();
    _disposeVideosTimer();

    videoWithIntTime={};
  }


  void layoutInitMethods(context)
  {
    if(LayoutCubit.get(context).state is LogoutState)
    {
      getAll(context);
    }
    startSessionTimer();
    _initChatTimer();
    _initVideosTimer();

  }
}
