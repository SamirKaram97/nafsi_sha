import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/core/routes/routes_manager.dart';
import 'package:gp_nafsi/features/auth/presentation/controllers/old_login/login_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/layout_screen.dart';
import 'package:gp_nafsi/screens/articles/cubit/article_cubit.dart';
import 'package:gp_nafsi/screens/home/cubit/home_cubit.dart';
import 'package:gp_nafsi/features/auth/presentation/screens/login/login_screen.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_states.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/locale.dart';

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
        // BlocProvider(
        //   create: (context) => LayoutCubit()..getUserData(context)..getUserSessionData(context),
        // ),
        // BlocProvider(
        //   create: (context) => TestsCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => HomeCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => ArticlesCubit()..getArticles(context)..getFavouriteArticles(),
        // ),
        // BlocProvider(
        //     create: (context) => VideosCubit()..getFavouriteVideos()
        //       ..getVideos(context)
        // ),
        // BlocProvider(
        //   create: (context) => SoundsCubit()..getSounds(LayoutCubit.get(context).userModel!.keywords, context),
        // ),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.loginViewRoute,
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
          );
        },
        listener: (BuildContext context, AppStates state) {},
      ),
    );
  }
}


// class StartingScreen extends StatelessWidget {
//   const StartingScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     if (AppCubit.get(context).token == null) {
//       return LoginScreen();
//     }
//     return const LayoutScreen();
//   }
// }

