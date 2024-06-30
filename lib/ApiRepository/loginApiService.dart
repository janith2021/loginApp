import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/appAction.dart';
import 'package:loginapp/model/message.dart';
import 'package:loginapp/constants/enumConstants.dart';
import 'package:loginapp/model/user.dart';
import 'package:loginapp/screens/Login.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

class LoginApiService{
  loginUser(Store? reduxStore,String username,String password,BuildContext context) async{

    final response = await http.post(Uri.parse("https://podijobs.cmit.lk/api/login_user.php"),body: jsonEncode(<String,String>{
      'username' : username,
      'password' : password,
      'userType': 'SUPPLIER'
    }),headers: <String,String> {
      'Content-Type' : 'application/json'
    });

    final body = jsonDecode(response.body);
    if(response.statusCode == 200){
      if(body['status'] == 'success'){
        reduxStore!.dispatch(ActionShowProgress(false));
        
        User user = new User();
        user.name = body['user']['name'];
        user.areaID = body['user']['areaID'];
        user.contactNumber = body['user']['contactNumber'];
        user.createdDate = body['user']['contactNumber'];
        user.supplierCode = body['user']['supplierCode'];
        user.supplierContact = body['user']['supplierContact'];
        user.supplierEmail = body['user']['supplierEmail'];
        user.supplierName = body['user']['supplierName'];
        user.userID = body['user']['userID'];
        user.userType = body['user']['userType'];
        user.supplierID = body['user']['supplierID'];
        user.email = body['user']['email'];
        debugPrint(user.email);
        reduxStore.dispatch(ActionUserChange(user));

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
        
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type:  ArtSweetAlertType.success,
          title: "Success",
          text: "You Logged in Successfully")
        );

      }else{
        reduxStore!.dispatch(ActionShowProgress(false));
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type:  ArtSweetAlertType.warning,
          title: "Error",
          text: "Server Error")
        );
      }
    }else{
      reduxStore!.dispatch(ActionShowProgress(false));
      // ignore: use_build_context_synchronously
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type:  ArtSweetAlertType.warning,
          title: "Error",
          text: body['message'])
        );
    }

  }
}