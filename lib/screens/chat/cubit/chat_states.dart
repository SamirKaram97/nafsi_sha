abstract class ChatState{}
class ChatInitialState extends ChatState{}

class ChatGetMessagesLoadingState extends ChatState{

}
class ChatGetMessagesSuccessState extends ChatState{

}
class ChatGetMessagesErrorState extends ChatState{
  final String errorMessage;

  ChatGetMessagesErrorState({required this.errorMessage});
}

class ChatSendMessageLoadingState extends ChatState{

}
class ChatSendMessageSuccessState extends ChatState{

}
class ChatSendMessageErrorState extends ChatState{
  final String errorMessage;

  ChatSendMessageErrorState({required this.errorMessage});
}