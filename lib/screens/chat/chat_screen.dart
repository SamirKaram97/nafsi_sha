import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_cubit.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_states.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/widgets/chat_messages_list.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../layout/cubit/layout_cubit.dart';
import '../../shared/styles/components.dart';
import '../../shared/utils/strings.dart';
import '../../shared/widgets/chat_input_message_section.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    LayoutCubit.get(context).startChatTimer();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getUserMessages(context),
      child: BlocConsumer<ChatCubit,ChatState>(
        builder: (context, state) {
          ChatCubit chatCubit=ChatCubit.get(context);
          return  Scaffold(
          body: SafeArea(child: Column(
            children: [
              const CustomAppBar(backButton: true,deep: true),

              //messages list
              if(chatCubit.messages!=null)...[
                Expanded(child: ChatMessagesList(messages: chatCubit.messages!)),
                ChatInputMessageSection(),
              ],
              if(chatCubit.messages==null)
                  Expanded(child: Center(child: LoadingAnimationWidget.prograssiveDots(
                   color: AppColors.primaryColor, size: 80,
                 )))
            ],
          )),
        );
        },
        listener: (context, state) {
          if(state is ChatSendMessageErrorState)
            {
              showToast(state: ToastState.EROOR, text: state.errorMessage);

            }
        },
      ),
    );
  }

  @override
  void deactivate() {
    LayoutCubit.get(context).pauseChatTimer();
    super.deactivate();
  }

  @override
  void dispose()async {
    super.dispose();
  }
}







