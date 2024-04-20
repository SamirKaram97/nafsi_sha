import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/user_model.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import '../../../shared/network/remote/firebase_services.dart';
import '../../../shared/styles/components.dart';
import '../../../shared/utils/strings.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordShown = false;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }

  void login(context,String email,String password) async {
    emit(LoginLoadingState());

    if (await _internetConnectionChecker.hasConnection) {
      try {
        late UserModel userModel;
        userModel = await ApiServices.login(
            email, password);
        emit(LoginSuccessState(userModel: userModel));
      } catch (error) {
        log(error.toString());
        emit(LoginErrorState(
            errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(LoginErrorState(errorMessage: S.of(context).networkError));
    }
  }



  void userLoginGoogle(context)async
  {
    if (await _internetConnectionChecker.hasConnection)
    {
      try
      {
        UserCredential? userCredential=await FirebaseServices.signInWithGoogle();
        if(userCredential!=null)
        {
          log(userCredential.user?.uid??"uid null");
          log(userCredential.user?.uid??"");
          log(userCredential.user?.email??"");
          emit(LoginGoogleSuccessState());
          login(context, userCredential.user!.email!, "P@${userCredential.user!.uid}");
      }
        else
        {
          emit(LoginGoogleCancelledState());
        }
      }
      catch (e)
      {
        log(e.toString());
        showToast(state: ToastState.EROOR, text: S.of(context).someThingWentWrong);
        print(e.toString());
        emit(LoginGoogleErrorState(errorMessage: S.of(context).someThingWentWrong));
      }
    }
    else
    {
      emit(LoginGoogleErrorState(errorMessage:S.of(context).networkError));
      showToast(state: ToastState.EROOR, text: S.of(context).networkError);
    }
  }
/*
  void userLoginFace()async
  {
    emit(LoginLoadingState());
    if (await _internetConnectionChecker.hasConnection)
    {
      try
      {
        UserCredential? userCredential=await FirebaseServices.signInWithFacebook();
        if(userCredential!=null)
        {
          bool userExist=await FirebaseServices.doesDocumentExist("user/${userCredential.user!.uid}");
          if(!userExist) {
            print("new");
            userCreate(RegisterModelFirebase(image: "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",registerMethod: "facebook",date: Timestamp.fromDate(DateTime.now()), name: userCredential.user!.displayName!, email: userCredential.user!.email!, password: ''), userCredential.user!.uid);
          }
          else{
            print("existed");
          }
          emit(LoginSuccessState(userCredential.user!.uid));
        }
        else
        {
          emit(LoginCanceledState());
        }
      }
      on FirebaseAuthException catch  (error) {

        showToast(state: ToastState.EROOR, text: getRegisterMessageFromErrorCode(error.code));
        emit(LoginErrorState(getRegisterMessageFromErrorCode(error.code)));
      }
      catch (e)
      {
        showToast(state: ToastState.EROOR, text: AppStrings.errorSomething);
        emit(LoginErrorState(AppStrings.errorSomething));
      }

    }
    else
    {
      emit(LoginErrorState(AppStrings.networkError));
      showToast(state: ToastState.EROOR, text: AppStrings.networkError);
    }
  }*/
}
