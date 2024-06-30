import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loginapp/screens/HomeScreen.dart';
import 'package:loginapp/screens/Login.dart';
import 'package:loginapp/appReducer.dart';
import 'package:loginapp/appState.dart';
import 'package:redux/redux.dart';

void main(){

  final initialState = Store<AppState>(
    reducer,
    initialState: AppState(),
  );

  runApp(loginapp(store: initialState));
}


class loginapp extends StatefulWidget {
  final Store<AppState>? store;
  const loginapp({this.store});

  @override
  State<loginapp> createState() => _loginappState();
}

class _loginappState extends State<loginapp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store!,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login' : (context) =>  const LoginScreen(),
          '/home' : (context) => const HomeScreen(),
        },
      ),
    );
  }
}