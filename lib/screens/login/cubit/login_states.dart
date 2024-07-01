import 'package:gp_nafsi/models/user_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class ChangePasswordVisibilityState extends LoginStates{}

//login api states
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}
class LoginErrorState extends LoginStates{
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}


//google states
class LoginGoogleLoadingState extends LoginStates{}
class LoginGoogleCancelledState extends LoginStates{}
class LoginGoogleSuccessState extends LoginStates{
  final UserModel userModel;
  LoginGoogleSuccessState(this.userModel);
}
class LoginGoogleErrorState extends LoginStates{
  final String errorMessage;

  LoginGoogleErrorState({required this.errorMessage});
}


//facebook states
class LoginFacebookLoadingState extends LoginStates{}
class LoginFacBookCancelledState extends LoginStates{}

class LoginFacebookSuccessState extends LoginStates{
  LoginFacebookSuccessState();
}
class LoginFacebookErrorState extends LoginStates{
  final String errorMessage;

  LoginFacebookErrorState({required this.errorMessage});
}


class LoginGetFaceIdSuccessState extends LoginStates{
  final String faceId;

  LoginGetFaceIdSuccessState({required this.faceId});
}

class LoginGetFaceIdCanceledState extends LoginStates{}

class LoginGetFaceIdErrorState extends LoginStates{}


class GetFaceIdSuccess extends LoginStates{}


class LoginInternetErrorState extends LoginStates{}


