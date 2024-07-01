import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../utils/strings.dart';
import 'custom_text_form_filed.dart';


class TitleAndTextFormFiled extends StatelessWidget {
  const TitleAndTextFormFiled({
    super.key,
    required this.title,
    required this.controller,
    this.value, this.textInputType,
  });

  final TextEditingController controller;
  final String title;
  final TextInputType? textInputType;

  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.mSemiBold18(context),
        ),
        title == AppStrings.password.tr()||title == AppStrings.confirmPassword.tr()||title==AppStrings.newPassword .tr()
            ? CustomPasswordTextFormFiled(controller: controller,value: value,textInputType: textInputType,title: title,)
            : CustomTextFormFiled(
          textInputType: textInputType,title: title,
          value: value,
                controller: controller,
              ),
      ],
    );
  }
}
