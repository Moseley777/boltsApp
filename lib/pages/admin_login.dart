// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:boltsapp/login_page.dart';
import 'package:boltsapp/services/auth.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatelessWidget {
   AdminLoginPage({super.key});

  final AuthService authService = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          height: 840,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white70,Color.fromRGBO(209, 186, 142, 1.0),],begin: Alignment.topLeft,end: Alignment.bottomRight)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:10,horizontal: 30),
            child: Container(
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      height: 290,
                      width: 290,
                      child: ClipOval(child: Image.asset('lib/images/bolts_logo.png',fit: BoxFit.contain,
                      )
                     )
                    ),
                  ),
                  Text('Enter the admin Code',
                  style: TextStyle(
                    color: Color.fromRGBO(209, 186, 142, 1.0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 15,),
                  Column(
                    children: [
                      TextField(
                        obscureText: true,
                    controller: authService.adminPassCodeController,
                    decoration:  InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                    ),
                  ),
                  SizedBox(height: 10,),
               /*   TextField(
                    obscureText: true,
                    controller: authService.adminPasswordController,
                    decoration:  InputDecoration(
                      labelText:'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                    ),
                  ),*/
                    ],
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      backgroundColor: Colors.blueGrey
                      ),
                    onPressed:(){
                      if(authService.adminPassCodeController != "" ){
                       authService.adminLogin(context);
                      }
                    }, 
                    child: Text('login',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),),)
                  ),
                   SizedBox(height: 10,),
                   TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    }, 
                    child: Text('Not an Admin?',style: TextStyle(color: Colors.white,),),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}