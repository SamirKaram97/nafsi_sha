import 'package:flutter/material.dart';
import 'package:gp_nafsi/models/message_model.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_cubit.dart';
import 'package:gp_nafsi/shared/widgets/user_message_widget.dart';

import 'bot_message_widget.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({super.key, required this.messages});
  final List<MessageModel > messages;

  @override
  Widget build(BuildContext context) {
    final List<MessageModel> messages=ChatCubit.get(context).messages!;

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.separated(reverse: true,itemBuilder: (context, index) {
        if(messages[index].type=="ai") {
          return BotMessageWidget(messageModel: messages[index]);
        }
        return UserMessageWidget(messageModel: messages[index]);
      }, separatorBuilder: (context, index) => const SizedBox(height: 10,), itemCount: messages.length),
    );
  }
}



