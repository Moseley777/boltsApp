import 'package:boltsapp/login_page.dart';
import 'package:boltsapp/pages/admin_login.dart';
import 'package:boltsapp/pages/admin_panel.dart';
import 'package:boltsapp/pages/player_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController adminPassCodeController = TextEditingController();
 
  //login method
  void loginUser(context)async{
    try{
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Center(
            child: CircularProgressIndicator(),
           ),
         );
       });
      await auth.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      ).then((value) async{ //sign in completes
        final userDoc = await fireStore.collection('user').doc(auth.currentUser!.uid).get();
        final userRole = userDoc.data()?['role'];
        print(auth.currentUser!.uid);
        print(userDoc.data());
        
         if(userRole == 'admin'){
          print('this is an admin');
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()), (route) => false);
         }else{
          print('this is not an admin');
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const PlayerScreenPage()), (route) => false);
         }

       } 
     );
    }catch(e){
      print(e);
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error Message'),
          content:Text(e.toString()),
        );
      });
    }
  }



  void adminLogin(context)async{   
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }); //as the dialog is loading,we are awiting the result from the database
     await FirebaseFirestore.instance.collection('admin').doc('adminLogin').snapshots().forEach((element) {
       if(element.data()?['adminPassCode']==adminPassCodeController.text){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> AdminPanel()), (route) => false);
       }else{  //if the admin code is incorrect..instead of the dialog to keep running
        Navigator.pop(context);
        showDialog(context: context, builder: (context){
            return const AlertDialog(
              title: Text('Incorrect Code'),
              content: Text('Yor admin code was incorrect...Enter the correct code or are you really an admin. If not get the fuck'),
            );
        });
       }
     }).catchError((e){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error Message'),
          content:Text(e.toString()),
        );
       }
      );
     }
    );    
  }

   //register method
  void registerUser(context)async{
    try{
      showDialog(context: context, builder: (context){ //show circular indicator while registration is going
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.createUserWithEmailAndPassword( //creates a new user in the authentication
        email: emailController.text, 
        password: passwordController.text,
      ).then((value) {
        print('User is Registered');
        fireStore.collection('user').doc(auth.currentUser!.uid).set({  //adding the created users to a collection
          'email': emailController.text,
          'password': passwordController.text,
          'uid': auth.currentUser!.uid, //////////////
          'role': 'user',
        });
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PlayerScreenPage()));           
       }
     );
    }catch(e){
      print(e);
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error Message'),
          content:Text(e.toString()),
        );
      });
    }
  }

  //
  void logOut(context) async{
    await auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
  }
}