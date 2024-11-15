
import 'package:boltsapp/pages/player_screen.dart';
import 'package:boltsapp/pages/team_home_page.dart';
import 'package:boltsapp/services/auth.dart';
import 'package:boltsapp/services/firestore.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
   AuthService authService = AuthService();
   Firestoreservice firestoreService = Firestoreservice();
  final TextEditingController nameController = TextEditingController();
   final TextEditingController playerPositionController = TextEditingController();
    final TextEditingController imgAssetController = TextEditingController();
     final TextEditingController favFootController = TextEditingController();
      final TextEditingController jerseyNumberController = TextEditingController();
       final TextEditingController flagController = TextEditingController();
       final TextEditingController playerInfoController = TextEditingController();
        final TextEditingController goalsController = TextEditingController();
          final TextEditingController assistsController = TextEditingController();

 /*void clearControllers(){
  nameController.clear();
  playerPositionController.clear();
  imgAssetController.clear();
  jerseyNumberController.clear();
 }
  void dispose(){
    super.dispose();
    nameController.dispose();
  playerPositionController.dispose();
  imgAssetController.dispose();
  jerseyNumberController.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      drawer:  Drawer(
        backgroundColor:Colors.white,//Colors.black,//Color.fromRGBO(209, 186, 142, 1.0),  //Colors.grey[850] ,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 50),
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
                const ListTile(
                  leading: Icon(Icons.calendar_month,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('SCHEDULE',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                  
          
                ),
                
                 GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> TeamHomePage()), (route) => false);
                  },
                   child: const ListTile(
                    leading: Icon(Icons.info,color: Color.fromRGBO(209, 186, 142, 1.0),),
                    title: Text('....',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                               ),
                 ),           
                const ListTile(
                  leading: Icon(Icons.settings,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('SETTINGS',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                  
                ),
                const ListTile(
                  leading: Icon(Icons.info,color: Color.fromRGBO(209, 186, 142, 1.0),),
                  title: Text('ABOUT US',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                ),           
             //         const Spacer(),
                GestureDetector(
                  onTap: () {
                    AuthService authService = AuthService();
                authService.logOut(context);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.logout,color: Color.fromRGBO(209, 186, 142, 1.0),),
                    title: Text('LOGOUT',style: TextStyle(color: Color.fromRGBO(209, 186, 142, 1.0),fontSize: 17,fontWeight: FontWeight.bold )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('admin panel'),
        actions: [
          IconButton(
            onPressed: () {
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const PlayerScreenPage()), (route) => false);
            },
            icon: const Icon(Icons.logout,
          ))
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context,
           builder: (context) => AlertDialog(
            content: Container(
              width: double.maxFinite,  //take maximum width
              child: ListView(//instead of column 
                shrinkWrap: true,  //prevents the listView from taking infinite height height   //qanother option was to use Column instead of luistview and a single child scroll for keyboad pop up renderflex errors
                children: [
                  TextField(
                    controller:  firestoreService.nameController,
                    decoration: const InputDecoration(
                     labelText: 'Enter the name you want to ADD,UPDATE OR DELETE',
                     
                     

                       
                    ),
                  ),                
                  TextField(
                    controller: firestoreService.flagController,
                    decoration: const InputDecoration(
                     labelText: 'flag'
                       
                    ),
                  ),
                  TextField(
                    controller: firestoreService.imgAssetController,
                    decoration: const InputDecoration(
                     labelText: 'imgAsset'
                       
                    ),
                  ),
                  TextField(
                     controller: firestoreService.jerseyNumberController,
                     decoration: const InputDecoration(
                     labelText: 'jerseyNumber'
                       
                    ),
                  ),            
                  TextField(
                      controller: firestoreService.playerPositionController,
                      decoration: const InputDecoration(
                     labelText: 'playerPosition'
                       
                    ),
                  ),
                  TextField(
                      controller: firestoreService.favFootController,
                      decoration: const InputDecoration(
                     labelText: 'favFoot'
                       
                    ),
                  ),
                   TextField(
                      controller: firestoreService.playerInfoController,
                      decoration: const InputDecoration(
                     labelText: 'playerInfo'
                       
                    ),
                  ),
                  TextField(
                      controller: firestoreService.goalsController,
                      decoration: const InputDecoration(
                     labelText: 'number of goals'
                       
                    ),
                  ),
                  TextField(
                      controller: firestoreService.assistsController,
                      decoration: const InputDecoration(
                     labelText: 'number of assists'
                       
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: (){
                       firestoreService.deletePlayer();
                       Navigator.pop(context);
                   
                    }, 
                    child: const Text('DELETE')
                  ),
           //       SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: (){
                       firestoreService.addNewPlayer();
                       Navigator.pop(context);
                    //   clearControllers();
                    }, 
                    child: const Text('ADD NEW PLAYER')
                  ),
                ],
              )
            ],
           )
          );
        }, 
        child: const Icon(Icons.add))
    );
  }
}