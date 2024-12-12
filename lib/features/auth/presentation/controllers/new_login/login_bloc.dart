import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gp_nafsi/core/database/api/api_status.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';
import 'package:gp_nafsi/features/auth/domain/params/login_params.dart';
import 'package:gp_nafsi/features/auth/domain/use_cases/login_facebook_use_case.dart';
import 'package:gp_nafsi/features/auth/domain/use_cases/login_faceid_use_case.dart';
import 'package:gp_nafsi/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:gp_nafsi/features/auth/domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LoginFacebookUseCase loginFacebookUseCase;
  final LoginGoogleUseCase loginGoogleUseCase;
  final LoginFaceIdUseCase loginFaceIdUseCase;

  LoginBloc(this.loginUseCase, this.loginFacebookUseCase, this.loginGoogleUseCase, this.loginFaceIdUseCase) : super(LoginState.init()) {
    on<LoginEmailPasswordEvent>(_loginEmailPasswordEvent);
    on<LoginFacebookEvent>(_loginFacebookEvent);
    on<LoginGoogleEvent>(_loginGoogleEvent);
    on<LoginFaceIdEvent>(_loginFaceIdEvent);
  }

  Future<void> _loginEmailPasswordEvent(
      LoginEmailPasswordEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginApiStatus: APIStatus.loading));
    var result = await loginUseCase(
        LoginParams(email: event.email, password: event.password));
    result.fold(
      (l) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.error, loginApiMessage: l.errMessage));
      },
      (useData) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.success, userDataModel: useData));
      },
    );
  }

  Future<void> _loginFacebookEvent(
      LoginFacebookEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginApiStatus: APIStatus.loading));
    var result = await loginFacebookUseCase();
    result.fold(
      (l) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.error, loginApiMessage: l.errMessage));
      },
      (r) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.success, userDataModel: r));
      },
    );
  }

  Future<void> _loginGoogleEvent(LoginGoogleEvent event, Emitter<LoginState> emit) async {

    emit(state.copyWith(loginApiStatus: APIStatus.loading));
    var result = await loginGoogleUseCase();
    result.fold(
          (l) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.error, loginApiMessage: l.errMessage));
      },
          (r) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.success, userDataModel: r));
      },
    );
  }

  Future<void> _loginFaceIdEvent(LoginFaceIdEvent event, Emitter<LoginState> emit) async {

    emit(state.copyWith(loginApiStatus: APIStatus.loading));
    var result = await loginFaceIdUseCase();
    result.fold(
          (l) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.error, loginApiMessage: l.errMessage));
      },
          (r) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.success, userDataModel: r));
      },
    );

  }
}
