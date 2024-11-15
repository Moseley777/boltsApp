

import 'package:boltsapp/model/player_model.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerDetailsPage extends StatelessWidget {
   final Player player; 
  const PlayerDetailsPage({super.key,required this.player});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(209, 186, 142, 1.0),
      body:SingleChildScrollView(  // with childscroll it pushes all widgets upward leaving space below
            child: ConstrainedBox(//constrained box provides additional constraints so the column takes at least(minheight) the height of the screen.... ensures the layout doent take less than screen height
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height
              ),
              child: //IntrinsicHeight( //intrinsic height makes the content in the column are laid out according to their normal sizes..keeping the layout compact so the column doesnt stretch unneccessarily
                /*child:*/ SafeArea(
                  child:Column(
                        children: [
                          //first child
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                               bottomLeft:  Radius.circular(55),
                          bottomRight: Radius.circular(55)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:3.0,right: 3,),
                              child: Container(
                              
                                height:400,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  
                                  image: DecorationImage(
                                    image: NetworkImage(player.imgAsset),
                                    fit: BoxFit.contain
                                  )
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 10,),
                              
                          Row(                         
                            children: [
                              const SizedBox(width: 7,),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                   'About ${player.name}',
                                    style:  GoogleFonts.dmSerifDisplay(
                                     fontSize: 30,
                                      fontWeight: FontWeight.bold,                                
                                   ),
                                ),
                                ),
                              ),
                            //  SizedBox(width: 20,),
                           //   Text('rrff')
                            ],
                          ),
                              
                              
                        SizedBox(height: 600,
                       //   fit: FlexFit.tight, //expanded worked but we use flexible with flexFit.tight to replace it
                            child: Padding(
                              padding: const EdgeInsets.only(right:7,left: 7,top: 7),
                              child: Container(
                           //     color: Colors.blue,
                                child: Text(
                                  player.playerInfo,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                           
                           const SizedBox(height: 10,),
                              //use for stats
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10,right: 5,left: 5),
                            child: Container(
                             //   height: 
                            //    120,
                               // color: Colors.orange,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        color: Colors.black87,// Colors.white,
                                        height: 100,
                                        width: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                'goals',
                                                style: TextStyle(
                                                  color:Colors.white,//Color.fromRGBO(209, 186, 142, 1.0),// Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              Text(
                                                player.goals,
                                                style: const TextStyle(
                                                  color:Color.fromRGBO(209, 186, 142, 1.0),
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                             
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                      
                                        color:  Colors.black87,
                                        height: 100,
                                        width: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                'assists',
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                
                                              ),
                                              Text(
                                               player.assists,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                  color: Color.fromRGBO(209, 186, 142, 1.0),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                         
                              
                              
                        ],
                      ),
               ),
               //),
             ),
           ),
    );
  }
}

/*StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('players').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Text('{$snapshot.error}');
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:  CircularProgressIndicator());
          }else{ //the stream has started having data

         }
       }
      )
    );
  }
}*/
