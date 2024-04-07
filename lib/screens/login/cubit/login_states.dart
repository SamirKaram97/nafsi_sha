import 'package:gp_nafsi/models/user_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class ChangePasswordVisibilityState extends LoginStates{}


class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}
class LoginErrorState extends LoginStates{
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}
class LoginInternetErrorState extends LoginStates{}