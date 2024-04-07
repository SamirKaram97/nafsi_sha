
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



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

