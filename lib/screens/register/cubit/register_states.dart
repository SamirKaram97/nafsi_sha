import '../../../models/user_model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}


class ChangePasswordVisibilityState extends RegisterStates{}

class SelectPreferenceItemState extends RegisterStates{}

class CompleteUserInfoLoadingState extends RegisterStates{}
class CompleteUserInfoSuccessState extends RegisterStates{
  final UserModel userModel;

  CompleteUserInfoSuccessState({required this.userModel});
}
class CompleteUserInfoErrorState extends RegisterStates{
  final String errorMessage;

  CompleteUserInfoErrorState({required this.errorMessage});
}


class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{

  RegisterSuccessState();
}
class RegisterErrorState extends RegisterStates{
  final String errorMessage;

  RegisterErrorState({required this.errorMessage});
}




//google states
class RegisterGoogleLoadingState extends RegisterStates{}
class RegisterGoogleCancelledState extends RegisterStates{}
class RegisterGoogleSuccessState extends RegisterStates{

  RegisterGoogleSuccessState();
}
class RegisterGoogleErrorState extends RegisterStates{
  final String errorMessage;

  RegisterGoogleErrorState({required this.errorMessage});
}


//facebook states
class RegisterFacebookLoadingState extends RegisterStates{}
class LoginFacebookCancelledState extends RegisterStates{}

class RegisterFacebookSuccessState extends RegisterStates{
  final String token;
  RegisterFacebookSuccessState(this.token);
}
class RegisterFacebookErrorState extends RegisterStates{
  final String errorMessage;

  RegisterFacebookErrorState({required this.errorMessage});
}



