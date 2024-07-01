import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/user_model.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
  String? faceId;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }

  void login(context, String email, String password) async {
    emit(LoginLoadingState());

    if (await _internetConnectionChecker.hasConnection) {
      try {
        late UserModel userModel;
        userModel = await ApiServices.login(email, password);
        emit(LoginSuccessState(userModel: userModel));
      } catch (error) {
        emit(LoginErrorState(
            errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(LoginErrorState(errorMessage: AppStrings.networkError.tr()));
    }
  }

  void userLoginGoogle(context) async {
    emit(LoginLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        UserCredential? userCredential =
            await FirebaseServices.signInWithGoogle();
        if (userCredential != null) {
          UserModel userModel=await ApiServices.loginGoogleFacebook(userCredential.user!.email!,userCredential.user!.uid);
          emit(LoginSuccessState(userModel: userModel));
        } else {
          emit(LoginGoogleCancelledState());
        }
      } on FirebaseAuthException catch (error) {
        showToast(
            state: ToastState.EROOR,
            text: FirebaseServices.getRegisterMessageFromErrorCode(error.code));
        emit(LoginGoogleErrorState(errorMessage:FirebaseServices.getRegisterMessageFromErrorCode(error.code)));
      } catch (e) {
        log(e.toString());
        emit(LoginErrorState(
            errorMessage: ApiServices.getErrorMessage(e, context)));
      }
    } else {
      emit(LoginErrorState(errorMessage: AppStrings.networkError.tr()));

    }
  }

  void userLoginFace(context) async {
    emit(LoginLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        UserCredential? userCredential =
            await FirebaseServices.signInWithFacebook();
        if (userCredential != null) {
          UserModel userModel=await ApiServices.loginGoogleFacebook(userCredential.user!.email!,userCredential.user!.uid);
          emit(LoginSuccessState(userModel: userModel));
        } else {
          emit(LoginFacBookCancelledState());
        }
      } on FirebaseAuthException catch (error) {
        showToast(
            state: ToastState.EROOR,
            text: FirebaseServices.getRegisterMessageFromErrorCode(error.code));
        emit(LoginFacebookErrorState(errorMessage:FirebaseServices.getRegisterMessageFromErrorCode(error.code)));}
      catch (e) {
        log(e.toString());
        emit(LoginErrorState(
            errorMessage: ApiServices.getErrorMessage(e, context)));
      }
    } else {
      emit(LoginErrorState(errorMessage: AppStrings.networkError.tr()));
    }
  }


  void userLoginFaceId(context)async
  {
    emit(LoginLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        late UserModel userModel;
        userModel = await ApiServices.loginFaceId("8c900a1750624e298d018b5ca7150d31fioaa653");
        emit(LoginSuccessState(userModel: userModel));
      } catch (error) {
        emit(LoginErrorState(
            errorMessage: ApiServices.getErrorMessage(error, context)));
        print(error.toString());
      }
    } else {
      emit(LoginErrorState(errorMessage: AppStrings.networkError.tr()));
    }
  }

  void getSaveFaceId(String faceId)
  {
    faceId=faceId;
    emit(GetFaceIdSuccess());
  }


  Future<File> pickImage() async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.camera);
    return File(pickedFile!.path);
  }
}
