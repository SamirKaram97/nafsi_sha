import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/register/cubit/register_states.dart';

import '../../../models/register_request_model.dart';
import '../../../shared/network/remote/api Services.dart';



class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context)=> BlocProvider.of(context);

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isPasswordShown=false;

  void changePasswordVisibility()
  {
    isPasswordShown=!isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }



  void register()async
  {
    emit(RegisterLoadingState());
    try
    {
       // RegisterRequestModel requestModel=RegisterRequestModel(firstname: "Mohamed",age: "40",lastname: "gmomma",email: emailController.text,gender:"male",password: passwordController.text);

      bool response=await ApiServices.register(emailController.text,passwordController.text);
      if(response)
        {
          emit(RegisterSuccessState());
        }
      else{
        emit(RegisterErrorState(errorMessage: ApiServices.getErrorMessage("")));
      }

    }
    catch (error) {
      emit(RegisterErrorState(errorMessage: ApiServices.getErrorMessage(error)));
    }
  }
}