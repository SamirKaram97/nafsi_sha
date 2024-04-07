import 'package:flutter/material.dart';

import '../../screens/chat/cubit/chat_cubit.dart';
import '../styles/colors.dart';

class ChatTextFormFiled extends StatelessWidget {
  const ChatTextFormFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      minLines: 1,
      controller: ChatCubit.get(context).messageController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.5),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14,horizontal: 10),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.5),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),

    );
  }
}