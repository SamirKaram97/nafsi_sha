import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';

abstract class ChangeInfoState{}

class ChangeInfoInitialState extends ChangeInfoState{}

class ChangePasswordVisibilityState extends ChangeInfoState{}

class ChangeUserInfoLoadingState extends ChangeInfoState{}
class ChangeUserInfoSuccessState extends ChangeInfoState{
  final UserDataModel userModel;

  ChangeUserInfoSuccessState({required this.userModel});
}
class ChangeUserInfoErrorState extends ChangeInfoState{
  final String errorMessage;

  ChangeUserInfoErrorState({required this.errorMessage});
}



