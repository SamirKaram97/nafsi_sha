import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/screens/register/cubit/register_states.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../models/register_request_model.dart';
import '../../../models/user_model.dart';
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
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isPasswordShown = false;
  List<String> preferencesList = [
    AppStrings.meditation.tr(),
    AppStrings.stressManagement.tr(),
    AppStrings.anxiety.tr(),
    AppStrings.depression.tr(),
    AppStrings.sleep.tr(),
    AppStrings.emotionalWellBeing.tr(),
    AppStrings.mindfulness.tr(),
    AppStrings.selfEsteem.tr(),
    AppStrings.relationships.tr(),
    AppStrings.productivity.tr(),
    AppStrings.motivation.tr(),
    AppStrings.workLifeBalance.tr(),
    AppStrings.selfImprovement.tr(),
    AppStrings.positiveThinking.tr(),
    AppStrings.digitalDetox.tr(),
  ];
  List<String> selectedPreferencesList = [];

  selectPreferenceItem(String item) {
    if (selectedPreferencesList.contains(item)) {
      selectedPreferencesList.remove(item);
    } else {
      selectedPreferencesList.add(item);
    }
    emit(SelectPreferenceItemState());
  }

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }

  void register(context,String email,String password) async {
    emit(RegisterLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        // RegisterRequestModel requestModel=RegisterRequestModel(firstname: "Mohamed",age: "40",lastname: "gmomma",email: emailController.text,gender:"male",password: passwordController.text);
          await ApiServices.register(
            email, password);
        //todo
        //need to get the token from zift
          emit(RegisterSuccessState());
        }
       catch (error) {
        log(error.toString());
        emit(RegisterErrorState(
            errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(RegisterErrorState(errorMessage: AppStrings.networkError.tr()));
    }
  }

  void userRegisterGoogle(context)async
  {
    emit(RegisterGoogleLoadingState());
    if (await _internetConnectionChecker.hasConnection)
    {
      try
      {
        UserCredential? userCredential=await FirebaseServices.signInWithGoogle();
        if(userCredential!=null)
        {
           await ApiServices.registerGoogleFacebook(userCredential.user!.email!,userCredential.user!.uid);
          emit(RegisterGoogleSuccessState());
        }
        else
        {
          emit(RegisterGoogleCancelledState());
        }
      }
      on FirebaseAuthException catch (error) {
        showToast(
            state: ToastState.EROOR,
            text: FirebaseServices.getRegisterMessageFromErrorCode(error.code));
        emit(RegisterErrorState(errorMessage:FirebaseServices.getRegisterMessageFromErrorCode(error.code)));
      }catch (e)
      {
        log(e.toString());
        showToast(state: ToastState.EROOR, text: AppStrings.someThingWentWrong.tr());
        print(e.toString());
        emit(RegisterErrorState(errorMessage: ApiServices.getErrorMessage(e, context) ));
      }
    }
    else
    {
      emit(RegisterErrorState(errorMessage: AppStrings.networkError.tr()));
      showToast(state: ToastState.EROOR, text: AppStrings.networkError.tr());
    }

  }
  void userRegisterFace(context)async
  {
    if (await _internetConnectionChecker.hasConnection)
    {
      try
      {
        UserCredential? userCredential=await FirebaseServices.signInWithFacebook();
        if(userCredential!=null)
        {
          register(context,userCredential.user!.email!,"P@${userCredential.user!.uid}");
        }
        else
        {
          emit(LoginFacebookCancelledState());
        }
      }on FirebaseAuthException catch (error) {
        showToast(
            state: ToastState.EROOR,
            text: FirebaseServices.getRegisterMessageFromErrorCode(error.code));
        emit(RegisterFacebookErrorState(errorMessage:FirebaseServices.getRegisterMessageFromErrorCode(error.code)));}
      catch (e)
      {
        showToast(state: ToastState.EROOR, text: AppStrings.someThingWentWrong.tr());
        emit(RegisterFacebookErrorState(errorMessage: AppStrings.someThingWentWrong.tr()));
      }

    }
    else
    {
      emit(RegisterFacebookErrorState(errorMessage: AppStrings.networkError.tr()));
      showToast(state: ToastState.EROOR, text: AppStrings.networkError.tr());
    }
  }

  void completeUserInfo(context)async
  {
    emit(CompleteUserInfoLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        late UserModel userModel;
        userModel = await ApiServices.updateMe({"preferance":selectedPreferencesList,"firstname":firstNameController.text,"lastname":secondNameController.text.isEmpty?"":secondNameController.text,"age":int.parse(ageController.text)},context);
        emit(CompleteUserInfoSuccessState(userModel: userModel));
      } catch (error) {
        print(error.toString());
        print(ApiServices.getErrorMessage(error, context));
        emit(CompleteUserInfoErrorState(errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(CompleteUserInfoErrorState(errorMessage: AppStrings.networkError.tr()));
    }
  }
}
