part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEmailPasswordEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginEmailPasswordEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email,password];
}
class LoginFacebookEvent extends LoginEvent {
  const LoginFacebookEvent();
  @override
  List<Object> get props => [];
}

class LoginGoogleEvent extends LoginEvent {
  const LoginGoogleEvent();
  @override
  List<Object> get props => [];
}


class LoginFaceIdEvent extends LoginEvent {
  const LoginFaceIdEvent();
  @override
  List<Object> get props => [];
}
