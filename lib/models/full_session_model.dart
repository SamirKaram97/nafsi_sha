import 'package:easy_localization/easy_localization.dart';

class CustomUISessionModel
{
  final String id;
  final String date;
  final String time;
  final String appTime;
  final String? videosTime;

  CustomUISessionModel( {required this.date, required this.time, required this.appTime, required this.videosTime, required this.id});

  factory CustomUISessionModel.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = DateTime.parse(json["createdAt"]);

    return CustomUISessionModel(
        id: json['_id'],
        date: DateFormat('yyyy-MM-dd').format(dateTime),
        time: DateFormat('HH:mm').format(dateTime),
        appTime: json['appTime'],
        videosTime: json['videostime']??"0");
  }

}