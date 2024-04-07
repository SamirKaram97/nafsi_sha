import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/send_message_button.dart';

import 'chat_text_form_filed.dart';

class ChatInputMessageSection extends StatelessWidget {
  const ChatInputMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 25),child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: ChatTextFormFiled()),
        SendMessageButton()
      ],
    ),);
  }
}