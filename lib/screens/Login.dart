import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loginapp/ApiRepository/loginApiService.dart';
import 'package:loginapp/appAction.dart';
import 'package:loginapp/appState.dart';
import 'package:redux/redux.dart';

Store? reduxStore;
TextEditingController? userNameController = TextEditingController();
TextEditingController? passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: StoreConnector<AppState,AppState>(converter: (store){
          reduxStore = store;
          return store.state;
      
        },builder: (context,state){
          return Stack(
            children: [Stack(
              fit: StackFit.expand,
                children: [
                  Image.asset("assets/login_background.png",fit: BoxFit.cover,),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.2,left: MediaQuery.of(context).size.width * 0.1),
                    child: const Text("Login",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500),),
                  ),Stack(
                  
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height *0.65,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255,156,205,202),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08,top: MediaQuery.of(context).size.height * 0.04),
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: const BoxDecoration(color: Color.fromARGB(255,213,235,230),borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(50))),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(padding: const EdgeInsets.only(top: 15),child: Text("Username",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),textAlign: TextAlign.start,),width: MediaQuery.of(context).size.width),
                                  TextField(controller: userNameController,decoration: const InputDecoration(hintText: "Enter User ID or Email")),
                                  Container(padding: const EdgeInsets.only(top: 15),child: Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),textAlign: TextAlign.start,),width: MediaQuery.of(context).size.width),
                                  TextField(controller:  passwordController,decoration: InputDecoration(hintText: "Enter Password"),obscureText: true,),
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.w800,color: const Color.fromARGB(255, 0, 105, 54)),textAlign: TextAlign.end,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 40),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                              children: [
                                                Checkbox(value: state.isChecked ?? false, onChanged: (value){
                                                  if(state.isChecked == true){
                                                    value = false;
                                                    reduxStore!.dispatch(ActionCheckBoxChange(false));
                                                  }else{
                                                    value = true;
                                                    reduxStore!.dispatch(ActionCheckBoxChange(true));
                                                  }
                                            
                                          }),
                                          Text("Remember Me",style:TextStyle(fontWeight: FontWeight.w800,color: const Color.fromARGB(255, 0, 105, 54)),),
                                              ],
                                          ),
                                        ),
                                          GestureDetector(
                                            onTap: (){
                                              reduxStore!.dispatch(ActionShowProgress(true));
                                              LoginApiService loginApiService = new LoginApiService();
                                              loginApiService.loginUser(reduxStore, userNameController!.text, passwordController!.text,context);
                                              userNameController!.text = "";
                                              passwordController!.text = "";
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 2),
                                              child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 105, 54),borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
                                              padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 20),
                                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
                                        width: 150,
                                        child: Row( 
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              child: Image.asset('assets/google.png'),
                                              height: 40,
                                              width:  40,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15),),border: Border.all(color: Color.fromARGB(255, 0, 105, 54))),
                                              padding: EdgeInsets.all(5),
                                            ),
                                            Text("or"),
                                            Container(
                                              child: Image.asset('assets/apple.png'),
                                              height: 40,
                                              width:  40,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15),),border: Border.all(color: Color.fromARGB(255, 0, 105, 54))),
                                              padding: EdgeInsets.all(5),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        
                        ],
                      ),
                      ),
                    
                    ],
                  )
                ],
            ),Stack(
              children: [
                state.isLoading == true ? Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Color.fromARGB(141, 20, 1, 1),child: Center(child: CircularProgressIndicator(color: Colors.red,))) : Container(),
              ],
            )],
          );
        }),
      ),
    );
  }
}