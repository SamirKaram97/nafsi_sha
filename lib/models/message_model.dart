class MessageModel
{
  final String content;
  final String type;

  MessageModel({required this.content, required this.type});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        content: json['data']["content"],
        type: json["type"]);
  }


}