part of 'login_bloc.dart';

class LoginState extends Equatable {
  final APIStatus loginApiStatus;
  final String? loginApiMessage;
  final UserDataModel? userDataModel;
  final bool? isPasswordShown;

  const LoginState({
    required this.loginApiStatus,
    required this.userDataModel,
    required this.isPasswordShown,
    required this.loginApiMessage,
  });

  const LoginState.init()
      : loginApiStatus = APIStatus.none,
        userDataModel = null,
        loginApiMessage = null,
        isPasswordShown = false;

  @override
  List<Object?> get props => [loginApiStatus, userDataModel, isPasswordShown];


  LoginState copyWith({
    APIStatus? loginApiStatus,
    UserDataModel? userDataModel,
    bool? isPasswordShown,
    String? loginApiMessage,
  }) {
    return LoginState(
      loginApiStatus: loginApiStatus ?? this.loginApiStatus,
      loginApiMessage: loginApiMessage ?? this.loginApiMessage,
      userDataModel: userDataModel ?? this.userDataModel,
      isPasswordShown: isPasswordShown ?? this.isPasswordShown,
    );
  }
}
