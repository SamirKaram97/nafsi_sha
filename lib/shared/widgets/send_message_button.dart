import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_cubit.dart';
import 'package:gp_nafsi/screens/chat/cubit/chat_states.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import '../styles/images.dart';

class SendMessageButton extends StatelessWidget {
   SendMessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: (ChatCubit.get(context).state is ChatSendMessageLoadingState)?null:(){
        if(ChatCubit.get(context).messageController.text.isNotEmpty)
        ChatCubit.get(context).sendMessage(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child:  ChatCubit.get(context).state is ChatSendMessageLoadingState?const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: Colors.white,),
            ):SvgPicture.asset(Assets.imagesBotIcon),
          ),
        ),
      ),
    );
  }
}