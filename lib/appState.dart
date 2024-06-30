import 'package:loginapp/model/message.dart';
import 'package:loginapp/model/user.dart';

class AppState{
  bool? isLoading;
  User? user;
  Message? message;
  bool? showMessage;
  bool? isChecked;

  AppState({
    this.isLoading,
    this.user,
    this.message,
    this.showMessage,
    this.isChecked,
  });

  AppState.fromAppState(AppState another){
    isLoading = another.isLoading;
    user = another.user;
    message = another.message;
    showMessage = another.showMessage;
    isChecked = another.isChecked;
  }
    
  }
  