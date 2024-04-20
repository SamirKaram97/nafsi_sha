

import 'package:gp_nafsi/layout/layout_screen.dart';
import 'package:gp_nafsi/main.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/screens/preferences/preferences_screen.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';

import '../../models/user_model.dart';
import '../../screens/register/cubit/register_states.dart';
import '../network/local/shared_helper.dart';
import '../styles/components.dart';

class StatesHandler
{
  static void _registerSuccessMethod(context)
  {
    navToNoBack(context, const PreferencesScreen());
  }

  static void _registerFailedMethod(RegisterErrorState state)
  {
    showToast(state: ToastState.EROOR, text: state.errorMessage);
  }

  static void handleRegisterStates(RegisterStates state,context)
  {
    if(state is RegisterSuccessState)
    {
      _registerSuccessMethod(context);
    }
    else if(state is RegisterErrorState)
    {
      _registerFailedMethod(state);
    }
  }

  static void _loginSuccessMethod(UserModel userModel,context)async
  {
    SharedHelper.saveToken(userModel.token);
    AppCubit.get(context).token=userModel.token;
    // await ApiServices.addTokenToDio(userModel.token!);
    navToNoBack(context, const StartingScreen());
  }

  static void _loginFailedMethod(LoginErrorState state)
  {
    showToast(state: ToastState.EROOR, text: state.errorMessage);
  }

  static void handleLoginStates(LoginStates state,context)
  {
    if(state is LoginSuccessState)
    {
      _loginSuccessMethod(state.userModel,context);
    }
    else if(state is LoginErrorState)
    {
      _loginFailedMethod(state);
    }
  }




}