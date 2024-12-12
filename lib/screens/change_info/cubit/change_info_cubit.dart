
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';
import 'package:gp_nafsi/core/utils/app_strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../shared/network/remote/old_api_service.dart';
import 'change_info_states.dart';


class ChangeInfoCubit extends Cubit<ChangeInfoState> {
  ChangeInfoCubit() : super(ChangeInfoInitialState());

  static ChangeInfoCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker _internetConnectionChecker =
  InternetConnectionChecker.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isPasswordShown = false;
  final formKey = GlobalKey<FormState>();
  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }

  void fillTextForms(UserDataModel userModel)
  {
    emailController.text=userModel.email!;
    firstNameController.text=userModel.firstName!;
    secondNameController.text=userModel.lastName!;
    ageController.text=userModel.age!.toString();
  }

  Future<void> changeUserInfo(context)
  async {
    emit(ChangeUserInfoLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {

        // RegisterRequestModel requestModel=RegisterRequestModel(firstname: "Mohamed",age: "40",lastname: "gmomma",email: emailController.text,gender:"male",password: passwordController.text);
        UserUpdateModel userUpdateModel=UserUpdateModel(fName: firstNameController.text, lName: secondNameController.text, age: int.parse(ageController.text));
        ///to avoid the error
        // UserDataModel userModel = await ApiServices.updateMe(userUpdateModel.toJson(),context);
        // emit(ChangeUserInfoSuccessState(userModel: userModel));
      }
      catch (error) {
        ///to avoid the error
        // log(ApiServices.getErrorMessage(error, context));
        // emit(ChangeUserInfoErrorState(errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(ChangeUserInfoErrorState(errorMessage: AppStrings.networkError.tr()));

    }}

  var picker = ImagePicker();
  File? profileImage;

  Future<void> getProfileImage(context) async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      if (await _internetConnectionChecker.hasConnection) {
        try {
          ///to avoid the error
         // ApiServices.updateImage(profileImage!, context);
        }
        catch (error) {
          ///to avoid the error
          // log(ApiServices.getErrorMessage(error, context));
          // emit(ChangeUserInfoErrorState(errorMessage: ApiServices.getErrorMessage(error, context)));
        }
      } else {
        emit(ChangeUserInfoErrorState(errorMessage: AppStrings.networkError.tr()));

      }}
    else {
      print('error picked file or canceled');
    }
  }

}



  


