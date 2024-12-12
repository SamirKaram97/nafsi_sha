import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/features/auth/presentation/screens/login/login_screen.dart';
import 'package:gp_nafsi/screens/preferences/cubit/preferences_states.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/core/utils/app_strings.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../features/auth/data/models/user_data_model.dart';
import '../../../shared/network/remote/old_api_service.dart';

class PreferencesCubit extends Cubit<PreferencesStates> {
  PreferencesCubit() : super(PreferencesInitialState());
  static PreferencesCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker _internetConnectionChecker =
  InternetConnectionChecker.instance;
  List<String> preferencesList = [
    AppStrings.meditation.tr(),
    AppStrings.stressManagement.tr(),
    AppStrings.anxiety.tr(),
    AppStrings.depression.tr(),
    AppStrings.sleep.tr(),
    AppStrings.emotionalWellBeing.tr(),
    AppStrings.mindfulness.tr(),
    AppStrings.selfEsteem.tr(),
    AppStrings.relationships.tr(),
    AppStrings.productivity.tr(),
    AppStrings.motivation.tr(),
    AppStrings.workLifeBalance.tr(),
    AppStrings.selfImprovement.tr(),
    AppStrings.positiveThinking.tr(),
    AppStrings.digitalDetox.tr(),
  ];
  List<String> selectedPreferencesList = [];

  selectPreferenceItem(String item) {
    if (selectedPreferencesList.contains(item)) {
      selectedPreferencesList.remove(item);
    } else {
      selectedPreferencesList.add(item);
    }
    emit(SelectPreferenceItemState());
  }

  saveAndContinueButton(context) {
    showToast(
        state: ToastState.SUCCESS,
        text: AppStrings.accountCreatedSuccessfully.tr());
    navToNoBack(context, LoginScreen());
  }


  void updatePreferences(context)async
  {
    emit(UpdatePreferencesLoadingState());
      try {
        late UserDataModel userModel;
        ///to avoid the error
        // userModel = await ApiServices.updateMe({"preferance":selectedPreferencesList},context);
        // emit(UpdatePreferencesSuccessState(userModel: userModel));
      } catch (error) {
        print(error.toString());
        ///to avoid the error
        // emit(UpdatePreferencesErrorState(errorMessage: ApiServices.getErrorMessage(error, context)));
      }
  }
}
