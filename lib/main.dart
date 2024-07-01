import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/layout_screen.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/home/cubit/home_cubit.dart';
import 'package:gp_nafsi/screens/login/cubit/login_cubit.dart';
import 'package:gp_nafsi/screens/login/login_screen.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/web_view_page.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_states.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/locale.dart';
import 'package:gp_nafsi/shared/utils/bloc_observer.dart';
import 'package:gp_nafsi/shared/utils/methods.dart';


void main() async {
  await mainInitMethod();
  runApp(Phoenix(
    child: EasyLocalization(
      supportedLocales: const [Locale('en','US'), Locale('ar','SA')],
      path: 'assets/translations',
      child: Nafsi(),
    ),
  ));
//   !kReleaseMode
}

class Nafsi extends StatefulWidget {

  const Nafsi._internal();
  static const Nafsi _instance=Nafsi._internal();
  factory Nafsi()=>_instance;

  @override
  State<Nafsi> createState() => _NafsiState();

}

class _NafsiState extends State<Nafsi> {
  @override
  void didChangeDependencies() {
      context.setLocale(LocaleHelper.getLocale());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => AppCubit()..getToken(),
),
    BlocProvider(
      create: (context) => LoginCubit(),
),
    BlocProvider(
      create: (context) => LayoutCubit()..getUserData(context)..getUserSessionData(context),
    ),
    BlocProvider(
      create: (context) => TestsCubit(),
    ),
    BlocProvider(
      create: (context) => HomeCubit(),
    ),
    BlocProvider(
      create: (context) => ArticlesCubit()..getArticles(context)..getFavouriteArticles(),
    ),
    BlocProvider(
        create: (context) => VideosCubit()..getFavouriteVideos()
          ..getVideos(context)
    ),
    BlocProvider(
      create: (context) => SoundsCubit()..getSounds(LayoutCubit.get(context).userModel!.keywords, context),
    ),

  ],
  child: BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, AppStates state) {
        return MaterialApp(
          builder: DevicePreview.appBuilder,

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Nafsi',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0XFF80542F)),
            useMaterial3: true,
          ),
          home:  const StartingScreen(),
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


