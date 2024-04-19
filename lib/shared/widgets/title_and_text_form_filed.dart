import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../utils/strings.dart';
import 'custom_text_form_filed.dart';
import 'package:gp_nafsi/generated/l10n.dart';

class TitleAndTextFormFiled extends StatelessWidget {
  const TitleAndTextFormFiled({
    super.key,
    required this.title,
    required this.controller,
    required this.cubit,
  });

  final TextEditingController controller;
  final String title;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.mSemiBold18(context),
        ),
        title == S.of(context).password
            ? CustomPasswordTextFormFiled(controller: controller, cubit: cubit)
            : CustomTextFormFiled(
                controller: controller,
              ),
      ],
    );
  }
}
