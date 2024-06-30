import 'package:loginapp/model/message.dart';
import 'package:loginapp/model/user.dart';

class ActionShowProgress{
  final bool showProgress;
  ActionShowProgress(this.showProgress);
}

class ActionShowMessage{
  final bool showMessage;
  ActionShowMessage(this.showMessage);
}

class ActionMessageChange{
  final Message message;
  ActionMessageChange(this.message);
}

class ActionUserChange{
  final User user;
  ActionUserChange(this.user);
}

class ActionCheckBoxChange{
  final bool isChecked;
  ActionCheckBoxChange(this.isChecked);
}