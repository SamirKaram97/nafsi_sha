import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gp_nafsi/shared/cubit/app_states.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';
import 'package:gp_nafsi/shared/styles/locale.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(InitialAppState());
  static AppCubit get(context)=>BlocProvider.of(context);
  late String? token;


  void getToken()
  {
    token=SharedHelper.getToken();
  }


  void changeLanguage(String language,context)async
  {
    await SharedHelper.saveLanguage(language);
    emit(AppChangeLanguage());
    Phoenix.rebirth(context);
  }

}