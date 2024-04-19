import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/register/cubit/register_states.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import '../../../models/register_request_model.dart';
import '../../../shared/network/remote/api Services.dart';
import '../../../shared/styles/components.dart';
import '../../../shared/utils/strings.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordShown = false;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(ChangePasswordVisibilityState());
  }

  void register(context) async {
    emit(RegisterLoadingState());
    if (await _internetConnectionChecker.hasConnection) {
      try {
        // RegisterRequestModel requestModel=RegisterRequestModel(firstname: "Mohamed",age: "40",lastname: "gmomma",email: emailController.text,gender:"male",password: passwordController.text);
        bool response = await ApiServices.register(
            emailController.text, passwordController.text);
        if (response) {
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState(
              errorMessage: ApiServices.getErrorMessage("", context)));
        }
      } catch (error) {
        emit(RegisterErrorState(
            errorMessage: ApiServices.getErrorMessage(error, context)));
      }
    } else {
      emit(RegisterErrorState(errorMessage: S.of(context).networkError));
    }
  }
}
