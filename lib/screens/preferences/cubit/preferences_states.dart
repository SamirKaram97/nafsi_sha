import 'package:gp_nafsi/models/user_model.dart';

abstract class PreferencesStates {}

class PreferencesInitialState extends PreferencesStates{}

class SelectPreferenceItemState extends PreferencesStates{}

class UpdatePreferencesLoadingState extends PreferencesStates{}
class UpdatePreferencesErrorState extends PreferencesStates{
  final String errorMessage;

  UpdatePreferencesErrorState({required this.errorMessage});
}
class UpdatePreferencesSuccessState extends PreferencesStates{
  final UserModel userModel;

  UpdatePreferencesSuccessState({required this.userModel});
}

