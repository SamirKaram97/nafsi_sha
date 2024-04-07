import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_cubit.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_states.dart';
import 'package:gp_nafsi/shared/widgets/chat_messages_list.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';

import '../../shared/widgets/chat_input_message_section.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit,ChatState>(
        builder: (context, state) {
          return const Scaffold(
          body: SafeArea(child: Column(
            children: [
              CustomAppBar(backButton: true,),

              //messages list
              Expanded(child: ChatMessagesList()),


              ChatInputMessageSection(),

            ],
          )),
        );
        },
        listener: (context, state) {},
      ),
    );
  }
}







