import 'package:flutter/material.dart';

import '../styles/styles.dart';

class LoginAndRegisterTitle extends StatelessWidget {
  const LoginAndRegisterTitle({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        title,
        style: AppStyles.mSemiBold38(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}