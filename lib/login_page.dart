// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:boltsapp/pages/admin_login.dart';
import 'package:boltsapp/register_page.dart';
import 'package:boltsapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

 final AuthService authService = AuthService();
  
  @override
  Widget build(BuildContext context) {
    final screenheight= MediaQuery.of(context).size.height;
    final screenwidth= MediaQuery.of(context).size.width;
 //   final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

  return Scaffold(            
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromRGBO(209, 186, 142, 1.0), Colors.white],begin: Alignment.topLeft,end: Alignment.bottomRight)
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(  //instead of sizedBox for more flexibility
            constraints: BoxConstraints(
              minHeight: screenheight//MediaQuery.of(context).size.height,// the minimum height is the cpadded column shouldtake...even if its not up to it it should take it(normally childscroll takes all the widgets to the top)...for landscape where tescreen is small it will scrollif more          
            ),    
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 60),
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Container(
                        //color: Colors.red,
                      //  height: 250, //screenheight * 0.30, 
                       // width: screenheight * 0.30,
                        child: ClipOval(
                          child: Image.asset(
                            'lib/images/bolts_app_logo.jpg',                            
                            height:  230//screenheight*0.3    // 250,/*fit: BoxFit.contain,*/
                        )
                       )
                      ),
              
                    SizedBox(height: 10,),

                    Text('Login to your Account',
                    style: GoogleFonts.dmMono(
                      color:Color.fromRGBO(0, 0, 0, 1), //Color.fromRGBO(209, 186, 142, 1.0) , 
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                     ),
                    ),                

                  SizedBox(height: 10,),

                   Column(
                    children: [
                      TextField(
                          obscureText: false,
                      controller: authService.emailController,
                      decoration:  InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),                                 
                        ),                        
                      ),
                    ),

                   SizedBox(height: 12),

                    TextField(
                      obscureText: true,
                      controller: authService.passwordController,
                      decoration:  InputDecoration(
                        labelText:'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        
                      ),
                    ),
                    ],
                   ),
         
                   SizedBox(height: 10,),

                    ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: screenwidth*0.05),
                        backgroundColor: Colors.grey[800],// Color.fromRGBO(209, 186, 142, 1.0), 
                        foregroundColor: Color.fromRGBO(209, 186, 142, 1.0),  //Color.fromRGBO(0, 0, 0, 1),
                      ),
                      onPressed:(){
                        if(authService.emailController != "" && authService.passwordController != ""){
                          authService.loginUser(context);
                        }
                      }, 
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19
                        ),
                        )
                    ),
             
                    SizedBox(height: 10,),

                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Dont have an account?',
                           style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18
                           ),
                           ),
                           SizedBox(width: 8,),
                           TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Color.fromRGBO(209, 186, 142, 1.0) ,                                       
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage(screenheight: screenheight,)));
                            }, 
                            child: Text('Register',
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          );
        }
      }