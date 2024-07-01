
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp_nafsi/shared/network/remote/api%20Services.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../shared/utils/strings.dart';
import 'forget_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker _internetConnectionChecker =
  InternetConnectionChecker();
  TextEditingController emailController=TextEditingController();



  void resetPassword(context)async
  {
    emit(ResetPasswordLoadingState());

    if (await _internetConnectionChecker.hasConnection) {
      try {
        String message=await ApiServices.forgetPassword(emailController.text);
        emit(ResetPasswordSuccessState(message: message));
        showToast(state: ToastState.SUCCESS, text: message);
      } catch (error) {
        emit(ResetPasswordErrorState(errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(ResetPasswordErrorState(errorMessage: AppStrings.networkError.tr()));
    }
  }

}
