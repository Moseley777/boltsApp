import 'package:boltsapp/pages/goals_ranking.dart';
import 'package:boltsapp/pages/match_screen.dart';
import 'package:boltsapp/services/auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        backgroundColor:Colors.white,//Colors.black,//Color.fromRGBO(209, 186, 142, 1.0),  //Colors.grey[850] ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10,vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
               
                   Container(
                    height: 220,
                    width: 220,
                    child: Center(
                      child: ClipOval(                  
                        child: Image.asset('lib/images/bolts_logo.png',                  
                        ),
                      ),
                    )
                  ),
                
                const SizedBox(height: 100),
                const ListTile(
                  leading: Icon(Icons.home,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('DASHBOARD',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold  ),),
                
                ),
                 ListTile(
                  leading: Icon(Icons.calendar_month,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('SCHEDULE',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchesPage()));},
                  
                  
                ),
                  ListTile(
                  leading: Icon(Icons.show_chart, color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('GOALS',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                  onTap: (){
                     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => GoalsRankingPage(),
                    ),
                   );
                  },
                 ),
                 
               /* const ListTile(
                  leading: Icon(Icons.settings,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('SETTINGS',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                  
                ),
                const ListTile(
                  leading: Icon(Icons.info,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('ABOUT US',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                ),   */        
             //         const Spacer(),
                ListTile(
                  leading: Icon(Icons.logout,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('LOGOUT',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                  onTap: (){
                    AuthService authService = AuthService();
                    authService.logOut(context);
                  },
                )
              ],
            ),
          ),
        ),
      );
  }
}