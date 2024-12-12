import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'forget_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker _internetConnectionChecker =
  InternetConnectionChecker.instance;
  TextEditingController emailController=TextEditingController();



  void resetPassword(context)async
  {
    // emit(ResetPasswordLoadingState());
    //
    // if (await _internetConnectionChecker.hasConnection) {
    //   try {
    //     String message=await ApiServices.forgetPassword(emailController.text);
    //     emit(ResetPasswordSuccessState(message: message));
    //     showToast(state: ToastState.SUCCESS, text: message);
    //   } catch (error) {
    //     emit(ResetPasswordErrorState(errorMessage: ApiServices.getErrorMessage(error, context)));
    //   }
    // } else {
    //   emit(ResetPasswordErrorState(errorMessage: AppStrings.networkError.tr()));
    // }
  }

}
