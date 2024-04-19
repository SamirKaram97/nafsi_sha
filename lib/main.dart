import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/layout_screen.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/home/cubit/home_cubit.dart';
import 'package:gp_nafsi/screens/login/login_screen.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_states.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/utils/bloc_observer.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'generated/l10n.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await ApiServices.initDio();
  await SharedHelper.init();
  initBackgroundedServices();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(Phoenix(
    child: DevicePreview(
      builder: (context) => const Nafsi(),
      enabled: false,
    ),
  ));
//   !kReleaseMode
}

class Nafsi extends StatelessWidget {
  const Nafsi({super.key});
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getToken()..getLanguage(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => ArticlesCubit()..getArticles(context)..getSavedArticles(),
        ),
        BlocProvider(
          create: (context) => VideosCubit()
            ..getVideos(context)
        ),
        BlocProvider(
          create: (context) => SoundsCubit()..init(context),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(
            locale: Locale(AppCubit.get(context).language),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: 'Nafsi',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0XFF80542F)),
              useMaterial3: true,
            ),
            home: const StartingScreen(),
          );
        },
        listener: (BuildContext context, AppStates state) {},
      ),
    );
  }
}

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    if (AppCubit.get(context).token == null) {
      return LoginScreen();
    }
    return const LayoutScreen();
  }
}

void initBackgroundedServices() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
}
