import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gp_nafsi/shared/cubit/app_states.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(InitialAppState());
  static AppCubit get(context)=>BlocProvider.of(context);
  late String? token;
  late String language;


  void getToken()
  {
    token=SharedHelper.getToken();
  }

  void getLanguage()
  {
    language=SharedHelper.getLanguage();
    print(language);
  }

  void changeLanguage(String language,context)
  {
    SharedHelper.saveLanguage(language);
    language=language;
    emit(AppChangeLanguage());
    Phoenix.rebirth(context);
  }

}