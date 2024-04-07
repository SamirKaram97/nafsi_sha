import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/message_model.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatState>
{
  ChatCubit():super(ChatInitialState());
  static ChatCubit get(context)=>BlocProvider.of(context);

  TextEditingController messageController=TextEditingController();

  List<MessageModel> messages=[
    MessageModel(id: "id1",content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Utenim ad minim veniam",senderId: "0"),
    MessageModel(id: "id2",content: "Lorem ipsum dolor sit amet, consectetur amet ",senderId: "123"),
    MessageModel(id: "id3",content: "Lorem ipsum dolor sit am ",senderId: "123"),
    MessageModel(id: "id4",content: "Lorem ipsum dolor sit am",senderId: "123"),
    MessageModel(id: "id5",content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Utenim ad minim veniam",senderId: "0"),
    MessageModel(id: "id6",content: "Lorem ipsum dolor sit amet, consectetur amet ",senderId: "123"),
    MessageModel(id: "id7",content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Utenim ad minim veniam",senderId: "0"),
    MessageModel(id: "id8",content: "Lorem ipsum dolor sit amet, consectetur amet ",senderId: "123"),
    MessageModel(id: "id9",content: "Lorem ipsum dolor sit am ",senderId: "123"),
    MessageModel(id: "id10",content: "Lorem ipsum dolor sit am",senderId: "123"),
    MessageModel(id: "id11",content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Utenim ad minim veniam",senderId: "0"),
    MessageModel(id: "id12",content: "Lorem ipsum dolor sit amet, consectetur amet ",senderId: "123"),
  ];

}