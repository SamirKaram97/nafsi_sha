import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/login/login_screen.dart';
import 'package:gp_nafsi/screens/preferences/cubit/preferences_states.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';

class PreferencesCubit extends Cubit<PreferencesStates>
{
  PreferencesCubit():super(PreferencesInitialState());
  static PreferencesCubit get(context)=> BlocProvider.of(context);
  List<String> preferencesList=["Work","Hobbies","Family","Breakup","Weather","Wife","Party","Love","Self esteem","Sleep","Social","Food","Self esteem","Sleep","Social","Food","Self esteem","Sleep","Social","Food",];
  List<String> selectedPreferencesList=[];


  selectPreferenceItem(String item)
  {
    if(selectedPreferencesList.contains(item))
      {
        selectedPreferencesList.remove(item);
      }
    else {
      selectedPreferencesList.add(item);
    }
    emit(SelectPreferenceItemState());
  }

  saveAndContinueButton(context)
  {
    showToast(state: ToastState.SUCCESS, text: AppStrings.accountCreatedSuccessfully);
    navToNoBack(context, LoginScreen());
  }

}