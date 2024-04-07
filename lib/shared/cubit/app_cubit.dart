import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/shared/cubit/app_states.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(InitialAppState());
  static AppCubit get(context)=>BlocProvider.of(context);
  late String? token;


  void getToken()
  {
    token=SharedHelper.getToken();
  }
}