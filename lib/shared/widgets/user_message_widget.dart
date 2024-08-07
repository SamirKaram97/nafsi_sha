import 'package:flutter/material.dart';

import '../../models/message_model.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';

class UserMessageWidget extends StatelessWidget {
  final MessageModel messageModel;
  const UserMessageWidget({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsetsDirectional.all(16),
        decoration: const ShapeDecoration(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(27.50),
              topRight: Radius.circular(27.50),
              bottomLeft: Radius.circular(28),
            ),
          ),
        ),
        child: Text(
          // messageModel.content,
          messageModel.content,
          style: AppStyles.aLight16(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
