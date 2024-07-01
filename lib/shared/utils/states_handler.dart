

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp_nafsi/layout/layout_screen.dart';
import 'package:gp_nafsi/main.dart';
import 'package:gp_nafsi/screens/Register_info/register_info_screen.dart';
import 'package:gp_nafsi/screens/forget_password/cubit/forget_password_states.dart';
import 'package:gp_nafsi/screens/login/cubit/login_cubit.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/screens/preferences/cubit/preferences_states.dart';
import 'package:gp_nafsi/screens/preferences/preferences_screen.dart';
import 'package:gp_nafsi/screens/register/cubit/register_cubit.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';

import '../../layout/cubit/layout_cubit.dart';
import '../../models/user_model.dart';
import '../../screens/change_info/cubit/change_info_states.dart';
import '../../screens/register/cubit/register_states.dart';
import '../network/local/shared_helper.dart';
import '../styles/components.dart';

class StatesHandler
{
  static void _registerSuccessMethod(context)
  {
    RegisterCubit.get(context).passwordController.clear();
    RegisterCubit.get(context).cPasswordController.clear();
    RegisterCubit.get(context).emailController.clear();
    showToast(state: ToastState.SUCCESS, text: AppStrings.accountCreatedSuccessfully.tr());
  }

  static void _registerFailedMethod(RegisterErrorState state)
  {
    GoogleSignIn().signOut();
    showToast(state: ToastState.EROOR, text: state.errorMessage);
  }

  static void handleRegisterStates(RegisterStates state,context)
  {
    if(state is RegisterSuccessState)
    {
      _registerSuccessMethod(context);
    }
    else if(state is RegisterGoogleSuccessState)
      {
        _registerSuccessMethod(context);
      }
    else if(state is RegisterFacebookSuccessState)
      {
        _registerSuccessMethod(context);
      }
    else if(state is RegisterErrorState)
    {
      _registerFailedMethod(state);
    }
    else if(state is CompleteUserInfoSuccessState)
      {
        LayoutCubit.get(context).userModel=state.userModel;
        SharedHelper.saveIsDataCompleted();
        navToNoBack(context, const LayoutScreen());
      }
    else if(state is CompleteUserInfoErrorState)
    {
      showToast(state: ToastState.EROOR, text: state.errorMessage);
    }

  }



  static void _loginSuccessMethod(UserModel userModel,context)async
  {
    SharedHelper.saveToken(userModel.token);
    AppCubit.get(context).token=userModel.token;
    // await ApiServices.addTokenToDio(userModel.token!);
    print(userModel.age);
    if(userModel.age==null)
      {
        navToNoBack(context, RegisterInfoScreen());
      }
    else
    {navToNoBack(context, const LayoutScreen());}
  }

  static void _getMeSuccessMethod(UserModel userModel,context)async
  {
    SharedHelper.saveToken(userModel.token);
    AppCubit.get(context).token=userModel.token;
  }


  static void _loginFailedMethod(LoginErrorState state)
  {
    GoogleSignIn().signOut();
    showToast(state: ToastState.EROOR, text: state.errorMessage);
  }

  static void handleLoginStates(LoginStates state,context)
  {
    if(state is GetFaceIdSuccess)
      {
        LoginCubit.get(context).userLoginFaceId(context);
      }
    if(state is LoginSuccessState)
    {
      _loginSuccessMethod(state.userModel,context);
    }
    else if(state is LoginErrorState)
    {
      _loginFailedMethod(state);
    }
  }


  static void handleResetPasswordStates(ResetPasswordStates state,context)
  {
    if(state is ResetPasswordSuccessState)
    {
      _resetPasswordSuccessMethod(state);
    }
    else if(state is ResetPasswordErrorState)
    {
      _resetPasswordFailedMethod(state);
    }
  }


  static void _resetPasswordSuccessMethod(ResetPasswordSuccessState state)
  {
    showToast(state: ToastState.SUCCESS, text: state.message);
  }

  static void _resetPasswordFailedMethod(ResetPasswordErrorState state)
  {
    showToast(state: ToastState.EROOR, text: state.errorMessage);
  }


  static void handleUpdatePreferencesStates(PreferencesStates state,context)
  {
    if(state is UpdatePreferencesSuccessState)
    {
      _updatePreferencesSuccessMethod(state);
    }
    else if(state is UpdatePreferencesErrorState)
    {
      _updatePreferencesErrorMethod(state);
    }
  }

  static void handleUpdateUserDateStates(ChangeInfoState state,context)
  {
    if(state is ChangeUserInfoSuccessState)
    {
      _handleUpdateUserDateSuccessMethod(state,context);
    }
    else if(state is ChangeUserInfoErrorState)
    {
      _handleUpdateUserDateErrorMethod(state);
    }
  }

  static void _handleUpdateUserDateSuccessMethod(ChangeUserInfoSuccessState state,context)
  {
    LayoutCubit.get(context).userModel=state.userModel;
    showToast(state: ToastState.SUCCESS, text: AppStrings.dataUpdatedSuccessfully.tr());
  }
  static void _handleUpdateUserDateErrorMethod(ChangeUserInfoErrorState state)
  {
    showToast(state: ToastState.EROOR, text: state.errorMessage);
  }

  static void _updatePreferencesSuccessMethod(UpdatePreferencesSuccessState state)
  {
    showToast(state: ToastState.SUCCESS, text: "Success Updated ... to re factor!!");
  }

  static void _updatePreferencesErrorMethod(UpdatePreferencesErrorState state)
  {
    showToast(state: ToastState.EROOR, text: state.errorMessage);
  }

}