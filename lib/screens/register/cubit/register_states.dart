abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}


class ChangePasswordVisibilityState extends RegisterStates{}


class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String errorMessage;

  RegisterErrorState({required this.errorMessage});
}