import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/core/utils/app_strings.dart';
import 'package:upstash_redis/upstash_redis.dart';

import '../../../layout/cubit/layout_cubit.dart';
import '../../../models/message_model.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatState>
{
  ChatCubit():super(ChatInitialState());
  static ChatCubit get(context)=>BlocProvider.of(context);

  TextEditingController messageController=TextEditingController();

  List<MessageModel>? messages;

  void getUserMessages(context)async
  {
    emit(ChatGetMessagesLoadingState());

      try {
        ///to avoid the error
        // messages=await ApiServices.getMessages(context);
        emit(ChatGetMessagesSuccessState());
      }  catch (e) {
        log(e.toString());
        emit(ChatGetMessagesErrorState(
          errorMessage: AppStrings.someThingWentWrong
        ));
      }

  }

  void sendMessage(context)async
  {
      try {
        emit(ChatSendMessageLoadingState());
        ///to avoid the error
        // MessageModel messageModel=await ApiServices.sendMessage(context,messageController.text);
        messages!.insert(0, MessageModel(content: messageController.text, type: "human"));
        ///to avoid the error
        //messages!.insert(0, messageModel);
        messageController.clear();
        emit(ChatSendMessageSuccessState());
      }  catch (e) {
        log(e.toString());
        showToast(state: ToastState.EROOR, text: AppStrings.someThingWentWrongWhileSendingYourMessagePleaseTryAgain.tr());
        emit(ChatSendMessageErrorState(
            errorMessage: AppStrings.someThingWentWrong.tr()
        ));
      }
  }
}

