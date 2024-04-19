import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/user_model.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:gp_nafsi/generated/l10n.dart';
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

  void login(context) async {
    emit(LoginLoadingState());

    if (await _internetConnectionChecker.hasConnection) {
      try {
        late UserModel userModel;
        print(emailController.text);
        print(passwordController.text);
        userModel = await ApiServices.login(
            emailController.text, passwordController.text);
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
}
