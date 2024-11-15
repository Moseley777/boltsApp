// ignore_for_file: prefer_const_constructors

import 'package:boltsapp/login_page.dart';
import 'package:boltsapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  final double screenheight;  //instead of calculating the screenheight again ,we pass the value of the screenheight from the loginpage
 RegisterPage({super.key,required this.screenheight});
final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:1,horizontal: 25),
        child: SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenheight
            ),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                   // height: screenheight * 0.3,
                //    width: screenheight *0.3,
                    child: ClipOval(
                      child: Image.asset('lib/images/bolts_logo.png',
                      height: 230,
                      //fit: BoxFit.contain,
                    )
                   )
                  ),
                ),
                
            
                Column(
                  children: [
                    Text('Register your Account',
                style: GoogleFonts.dmMono(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 15 /*screenheight*0.025,*/),
                    TextField(
                  controller: authService.emailController,
                  decoration:  InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    
                  ),
                ),
                SizedBox(height: screenheight* 0.01),
                TextField(
                //  obscureText: true,
                  controller: authService.passwordController,
                  decoration:  InputDecoration(
                    labelText:'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    
                  ),
                ),
                  ],
                ),
              
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40,),
                    foregroundColor: Color.fromRGBO(209, 186, 142, 1.0),
                    backgroundColor:  Colors.grey[800]
                    ),
                  onPressed:(){
                    if(authService.emailController != "" && authService.passwordController != ""){
                      authService.registerUser(context);
                    }
                  }, 
                  child: Text('Register'),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.dmSans(
                        fontSize: 17
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                       style: TextButton.styleFrom(
                        foregroundColor: Color.fromRGBO(209, 186, 142, 1.0), 
                       ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      }, 
                      child: Text(
                        'Login',
                        style: GoogleFonts.dmMono(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                          
                        ),
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}