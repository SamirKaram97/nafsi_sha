import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/layout_screen.dart';
import 'package:gp_nafsi/screens/login/login_screen.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_states.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/utils/bloc_observer.dart';
import 'package:just_audio_background/just_audio_background.dart';


void main()async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await ApiServices.initDio();
  await SharedHelper.init();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
   runApp(DevicePreview(builder: (context) =>  const Nafsi(),    enabled: kReleaseMode,
   ));
}

class Nafsi extends StatelessWidget {
  const Nafsi({super.key});
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => AppCubit()..getToken(),

        ),
        BlocProvider(
          create: (context) => LayoutCubit(),),

        BlocProvider(
        create: (context) => SoundsCubit()..init(context),),


      ],
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: 'Nafsi',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
              colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF80542F)),
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

    if(AppCubit.get(context).token==null) {
      return LoginScreen();
    }
    return const LayoutScreen();
  }
}





