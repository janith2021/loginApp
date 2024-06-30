import 'package:loginapp/constants/enumConstants.dart';

class Message{
  String? title;
  MessageTypes? messageTypes;
  String? message;

  Message({
    this.message,
    this.messageTypes,
    this.title
  });
}