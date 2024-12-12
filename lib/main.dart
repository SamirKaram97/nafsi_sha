import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/app/nafsi.dart';
import 'package:gp_nafsi/core/functions/init_music_service.dart';
import 'package:gp_nafsi/core/functions/request_permissions.dart';
import 'package:gp_nafsi/core/service/bloc_observer.dart';
import 'package:gp_nafsi/firebase_options.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await requestPermissions();

  // await SharedHelper.init();
  // await EasyLocalization.ensureInitialized();
  // initMusicBackgroundedServices();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  runApp(Scaffold());
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en','US'), Locale('ar','SA')],
    path: 'assets/translations',
    child: Nafsi(),
  ));
//   !kReleaseMode
}




