import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/screens/preferences/cubit/preferences_cubit.dart';
import 'package:gp_nafsi/screens/preferences/cubit/preferences_states.dart';
import 'package:gp_nafsi/shared/styles/images.dart';
import 'package:gp_nafsi/shared/utils/states_handler.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../../shared/utils/strings.dart';
import '../../shared/widgets/preference_selection_section.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PreferencesCubit(),
        child: BlocConsumer<PreferencesCubit, PreferencesStates>(
          listener: (context, state) {
            StatesHandler.handleUpdatePreferencesStates(state, context);
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(Assets.imagesLogo),
                    const Spacer(),
                    Text(
                      AppStrings.selectYourFavourits.tr(),
                      style: AppStyles.mSemiBold38(context),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.44,
                          child: const PreferenceSelectionSection()),
                    ),
                    const Spacer(),
                    CustomButton(
                        title: state is UpdatePreferencesLoadingState
                        ? null:AppStrings.saveAndContinue.tr().toUpperCase(),
                        onPressed: () {
                          PreferencesCubit.get(context)
                              .updatePreferences(context);
                        }),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )),
            );
          },
        ));
  }
}
