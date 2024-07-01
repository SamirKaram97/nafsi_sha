
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../styles/locale.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          LocaleHelper.toggleLanguage(context);
        },
        child: Text(
          AppStrings.language.tr(),
          style: AppStyles.mSemiBold18(context),
        ));
  }
}