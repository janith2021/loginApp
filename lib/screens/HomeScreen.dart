import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loginapp/appAction.dart';
import 'package:loginapp/appState.dart';
import 'package:loginapp/model/user.dart';
import 'package:redux/redux.dart';

Store? reduxStore;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(211, 255, 255, 255),
      body: StoreConnector<AppState,AppState>(converter: (store){
        reduxStore = store;
        return store.state;
      },builder: (context,state){
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 0.2),
              decoration: const BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(blurRadius: 20)]),
              child: Column(
                children: [
                  Text("Hi ${state.user!.name}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800),textAlign: TextAlign.center,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(onTap: ()async {
                        ArtDialogResponse response = await ArtSweetAlert.show(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    artDialogArgs: ArtDialogArgs(
                                                      showCancelBtn: true,
                                                      denyButtonText: "No",
                                                      title: "Are you sure you want to logout?",
                                                      confirmButtonText: "Yes, Log Out",
                                                    )
                                                  );

                                                  if(response==null) {
                                                    return;
                                                  }

                                                  if(response.isTapConfirmButton) {
                                                    Navigator.pushReplacementNamed(context, '/login');
                                                    // ignore: use_build_context_synchronously
                                                    ArtSweetAlert.show(
                                                      context: context,
                                                      artDialogArgs: ArtDialogArgs(
                                                        type: ArtSweetAlertType.success,
                                                        title: "You Logged out Successfully"
                                                      )
                                                    );
                                                    User user = new User();
                                                    reduxStore!.dispatch(ActionUserChange(user));
                                                    return;
                                                  }

                                                  if(response.isTapDenyButton) {
                                                    return;
                                                  }
                      },child: Image.asset("assets/logout.png",width: 20,height: 20,)),
                    ],
                  )
                ],
              ),
            ),Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2,left: MediaQuery.of(context).size.width * 0.02,right: MediaQuery.of(context).size.width * 0.02),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.amberAccent,boxShadow: const [BoxShadow(blurRadius: 10)]),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("User Id: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.userID.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                  Row(
                    children: [
                      const Text("email: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.email.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                  Row(
                    children: [
                      const Text("userType: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.userType.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                  Row(
                    children: [
                      const Text("supplierID: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.supplierID.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                  Row(
                    children: [
                      const Text("supplierName: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.supplierName.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                  Row(
                    children: [
                      const Text("supplierEmail: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.supplierEmail.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                   Row(
                    children: [
                      const Text("contactNumber: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.contactNumber.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                  Row(
                    children: [
                      const Text("supplierContact: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text(state.user!.supplierContact.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                    ],
                  ),
                ],
              ),
            )
            
          ],
        );
      },),
      ),
    );
  }
}