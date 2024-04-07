import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/user_model.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=> BlocProvider.of(context);

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isPasswordShown=false;



  void changePasswordVisibility()
  {
    isPasswordShown=!isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }


  void login()async
  {
    emit(LoginLoadingState());
    try
        {
          late UserModel userModel;
          print(emailController.text);
          print(passwordController.text);
          userModel=await ApiServices.login(emailController.text, passwordController.text);
          emit(LoginSuccessState(userModel: userModel));
        }
        catch (error) {
      emit(LoginErrorState(errorMessage: ApiServices.getErrorMessage(error)));
    }
  }

}


