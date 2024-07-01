import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_states.dart';
import 'package:intl/intl.dart' as intl;

import '../../screens/chat/cubit/chat_cubit.dart';
import '../styles/colors.dart';

class ChatTextFormFiled extends StatefulWidget {
   ChatTextFormFiled({
    super.key,
  });

  @override
  State<ChatTextFormFiled> createState() => _ChatTextFormFiledState();
}

class _ChatTextFormFiledState extends State<ChatTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: ChatCubit.get(context).state is! ChatSendMessageLoadingState,
      textDirection: isRTL(ChatCubit.get(context).messageController.text) ?TextDirection.rtl:TextDirection.ltr,
      maxLines: 5,
      minLines: 1,
      controller: ChatCubit.get(context).messageController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.5),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.5),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      onChanged: (e){
        setState(() {
        });
      },
    );
  }
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }
}