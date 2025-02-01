import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastMessage(
  BuildContext context, {
  required String msg,
  MessageType type = MessageType.error,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(type),
      textColor: Colors.white,
      fontSize: 18.0);
}

getColor(MessageType type) {
  switch (type) {
    case MessageType.success:
      return Colors.green[900];
    case MessageType.error:
      return Colors.red[900];
    case MessageType.warning:
      return Colors.yellow[700];
    case MessageType.info:
      return Colors.blue[900];
  }
}

enum MessageType { success, error, warning, info }
