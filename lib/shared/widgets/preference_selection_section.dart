import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/register/cubit/register_cubit.dart';
import 'package:gp_nafsi/shared/widgets/preference_selection_item.dart';

import '../../screens/preferences/cubit/preferences_cubit.dart';

class PreferenceSelectionSection extends StatelessWidget {
  const PreferenceSelectionSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var registerCubit=RegisterCubit.get(context);
    return  SingleChildScrollView(
      child: Wrap(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        spacing: 10,
        runSpacing: 10,
        children: registerCubit.preferencesList.map((e) => PreferenceSelectionItem(text: e,)).toList(),
      ),
    );
  }
}