abstract class ResetPasswordStates{}

class ResetPasswordInitialState extends ResetPasswordStates{}



class ResetPasswordLoadingState extends ResetPasswordStates{}
class ResetPasswordSuccessState extends ResetPasswordStates{
  final String message;
  ResetPasswordSuccessState({required this.message});
}
class ResetPasswordErrorState extends ResetPasswordStates{
  final String errorMessage;
  ResetPasswordErrorState({required this.errorMessage});
}

