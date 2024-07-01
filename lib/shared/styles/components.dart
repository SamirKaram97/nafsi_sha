
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String convertSecondsToTime(int seconds) {
   if(seconds==0) {
     return "0";
   }
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;

  String hoursStr = hours.toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');
  String result = "";
  if (hours > 0) {
    result = "${result + hours.toString()} h ";
  }
  if (minutes > 0) {
    result = "${result + minutes.toString()} min ";
  }
  if (seconds > 0) {
    result = "${result + remainingSeconds.toString()} sec";
  }
  return result;
}

void navTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navToNoBack(context, Widget widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);


Future<bool?> showToast({required ToastState state, required String text})async {
  await Fluttertoast.cancel();
  return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: color(state),
        textColor: Colors.white,
        fontSize: 16.0);
}

enum ToastState { WARNING, EROOR, SUCCESS }

Color color(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.WARNING:
      color = Colors.amber;
      break;
    case ToastState.EROOR:
      color = Colors.red;
      break;
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
  }
  return color;
}

