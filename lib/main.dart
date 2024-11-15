import 'package:boltsapp/firebase_options.dart';
import 'package:boltsapp/login_page.dart';
//import 'package:boltsapp/model/player_provider.dart';
import 'package:boltsapp/pages/player_screen.dart';
//import 'package:boltsapp/pages/team_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

final auth = FirebaseAuth.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
   const MyApp()
   // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  auth.currentUser == null? LoginPage():PlayerScreenPage()  //if current user is null,automatically navigate  to login screeen else playerscreen
    );
  }
}