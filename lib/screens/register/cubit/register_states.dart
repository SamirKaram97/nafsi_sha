abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}


class ChangePasswordVisibilityState extends RegisterStates{}


class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
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
class LoginFacBookCancelledState extends RegisterStates{}

class RegisterFacebookSuccessState extends RegisterStates{
  RegisterFacebookSuccessState();
}
class RegisterFacebookErrorState extends RegisterStates{
  final String errorMessage;

  RegisterFacebookErrorState({required this.errorMessage});
}
