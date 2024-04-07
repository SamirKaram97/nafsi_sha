import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';

import '../../screens/preferences/cubit/preferences_cubit.dart';
import '../../screens/preferences/cubit/preferences_states.dart';

class PreferenceSelectionItem extends StatelessWidget {
  const PreferenceSelectionItem({
    super.key, required this.text,
  });
  final String text;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreferencesCubit, PreferencesStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        PreferencesCubit preferencesCubit=PreferencesCubit.get(context);
        return GestureDetector(
          onTap: () {
            preferencesCubit.selectPreferenceItem(text);
          },
          child: AnimatedContainer(
            decoration: ShapeDecoration(
              color: preferencesCubit.selectedPreferencesList.contains(text)?AppColors.primaryColor:Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFF100F11),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            duration: const Duration(milliseconds: 500),
            child:  Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(text,style:  preferencesCubit.selectedPreferencesList.contains(text)?AppStyles.mRegular16(context).copyWith(color: Colors.white):AppStyles.mRegular16(context),),
            ),
          ),
        );
      },
    );
  }
}