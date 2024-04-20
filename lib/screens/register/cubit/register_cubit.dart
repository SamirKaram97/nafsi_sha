import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/register/cubit/register_states.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import '../../../models/register_request_model.dart';
import '../../../shared/network/remote/api Services.dart';
import '../../../shared/network/remote/firebase_services.dart';
import '../../../shared/styles/components.dart';
import '../../../shared/utils/strings.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordShown = false;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }

  void register(context,String email,String password) async {
    emit(RegisterLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        // RegisterRequestModel requestModel=RegisterRequestModel(firstname: "Mohamed",age: "40",lastname: "gmomma",email: emailController.text,gender:"male",password: passwordController.text);
        bool response = await ApiServices.register(
            email, password);
        if (response) {
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState(
              errorMessage: ApiServices.getErrorMessage("", context)));
        }
      } catch (error) {
        log(error.toString());
        emit(RegisterErrorState(
            errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(RegisterErrorState(errorMessage: S.of(context).networkError));
    }
  }


  void userRegisterGoogle(context)async
  {
    if (await _internetConnectionChecker.hasConnection)
    {
      try
      {
        UserCredential? userCredential=await FirebaseServices.signInWithGoogle();
        if(userCredential!=null)
        {
          register(context,userCredential.user!.email!,"P@${userCredential.user!.uid}");
        }
        else
        {
          emit(RegisterGoogleCancelledState());
        }
      }
      catch (e)
      {
        log(e.toString());
        showToast(state: ToastState.EROOR, text: "something went wrong please try again.");
        print(e.toString());
        emit(RegisterGoogleErrorState(errorMessage: "something went wrong please try again."));
      }
    }
    else
    {
      emit(RegisterGoogleErrorState(errorMessage: S.of(context).networkError));
      showToast(state: ToastState.EROOR, text: S.of(context).networkError);
    }
    /*
  }
  void userRegisterFace()async
  {
    emit(RegisterSocialLoadingState());
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
            await userCreateFireStore(RegisterModelFirebase(image: "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",registerMethod: "facebook",date: Timestamp.fromDate(DateTime.now()), name: userCredential.user!.displayName!, email: userCredential.user!.email!, password: ''), userCredential.user!.uid);
          }
          else{
            print("existed");
          }
          emit(RegisterSocialSuccessState(userCredential.user!.uid));
        }
        else
        {
          emit(RegisterSocialCancelState());
        }
      }
      on FirebaseAuthException catch  (error) {
        showToast(state: ToastState.EROOR, text: getRegisterMessageFromErrorCode(error.code));
        emit(RegisterSocialErrorState(getRegisterMessageFromErrorCode(error.code)));
      }
      catch (e)
      {
        showToast(state: ToastState.EROOR, text: AppStrings.errorSomething);
        emit(RegisterSocialErrorState(AppStrings.errorSomething));
      }

    }
    else
    {
      emit(RegisterSocialErrorState(AppStrings.networkError));
      showToast(state: ToastState.EROOR, text: AppStrings.networkError);
    }
  }*/
}}
