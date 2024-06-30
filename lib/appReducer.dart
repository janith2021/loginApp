import 'package:flutter/material.dart';
import 'package:loginapp/appAction.dart';
import 'package:loginapp/appState.dart';

AppState reducer(AppState prevState, dynamic action){
  AppState newState = AppState.fromAppState(prevState);

  if(action is ActionShowProgress){
    newState.isLoading = action.showProgress;
  }else if(action is ActionShowMessage){
    newState.showMessage = action.showMessage;
  }else if(action is ActionMessageChange){
    newState.message = action.message;
  }else if(action is ActionUserChange){
    newState.user = action.user;
  }else if(action is ActionCheckBoxChange){
    newState.isChecked = action.isChecked;
  }

  return newState;
}