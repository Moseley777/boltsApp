//import 'package:boltsapp/main.dart';
import 'package:boltsapp/model/player_model.dart';
import 'package:boltsapp/pages/goals_ranking.dart';
import 'package:boltsapp/pages/match_screen.dart';
/*import 'package:boltsapp/model/player_provider.dart';
import 'package:boltsapp/model/player_provider.dart';
import 'package:boltsapp/model/player_provider.dart';*/
import 'package:boltsapp/pages/player_details_page.dart';
import 'package:boltsapp/services/auth.dart';
import 'package:boltsapp/themes/colors.dart';
import 'package:boltsapp/util/drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';

class PlayerScreenPage extends StatefulWidget {
  const PlayerScreenPage({super.key});

  @override
  State<PlayerScreenPage> createState() => _PlayerScreenPageState();
}

class _PlayerScreenPageState extends State<PlayerScreenPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black//Color.fromRGBO(209, 186, 142, 1.0),
        ),
         elevation: 0,
        backgroundColor: Colors.transparent,
        title: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> GoalsRankingPage()
              ),
            );
          },
        icon:Icon(Icons.sports_soccer_outlined),            
       color: myprimaryColor //Color.fromRGBO(209, 186, 142, 1.0), 
       ),   
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesPage()));},
            icon: Icon(Icons.calendar_month)
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('players').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Text('{$snapshot.error}');
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:  CircularProgressIndicator());
          }else{ //the stream has started having data
            // Convert the documents to a list of Player objects
            final players = snapshot.data!.docs.map((doc)=> Player.fromDocument(doc)).toList(); //players is the name of the list of all documents
             print('${players.length}');

          return GridView.builder(            
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: width> 900? 5: width > 550? 3: 2,
               childAspectRatio: 0.75
              ), 
            itemCount: players.length,     //all elements in the list
            itemBuilder: (context,index){   

              final player = players[index];
                 print(player); 

   

                  //  to inspect the data structure
              return PlayerCard(player: players[index]);                            
             }
           );
         }
       }
      )
    );
  }
}


class PlayerCard extends StatelessWidget{
     final Player player; 
     const PlayerCard({super.key,required this.player});
      @override
  Widget build(BuildContext context){
 //   final screenWidth = MediaQuery.of(context).size.width;
 return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
               padding: const EdgeInsets.only(top:2,left: 1.5,right: 1.5,),
               child: Container(                    
                  decoration:  BoxDecoration(gradient: LinearGradient(colors: Colors.accents,),
                  color:mySecondaryColor,//Color.fromRGBO(0, 0, 0, 1),// Color.fromRGBO(209, 186, 142, 1.0), 
                   ),
                 child: GestureDetector(
                     onTap: () {
                        Navigator.push(
                             context,
                             MaterialPageRoute(
                             builder: (context) => PlayerDetailsPage(player: player),
                          ),
                        );
                      },
                   child: Card( 
                       color: myprimaryColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Padding(
                             padding: const EdgeInsets.only(right:7.0),
                             child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:7.0),
                                        child: Text(player.flag,
                                      style: const TextStyle(
                                          fontSize: 21,
                                         ),                                      
                                       ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(player.jerseyNumber,
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: mySecondaryColor, // Color.fromRGBO(209, 186, 142, 1.0)// Colors.white// Color.fromRGBO(209, 186, 142, 1.0) 
                                      ),
                                     ),
                                      Text(
                                        player.playerPosition,
                                         style: TextStyle(
                                         fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 18,
                                        color: mySecondaryColor,
                                       ),
                                     ),
                                    ],
                                  )
                                ],
                               ),
                             ),
                                                    
                            CachedNetworkImage(   //wrapped the circular avator to cache the image
                              imageUrl: player.imgAsset,
                              imageBuilder: (context,imageProvider)=> CircleAvatar(
                               backgroundImage: imageProvider,               
                               radius:  63,               
                              ),
                              placeholder: (context, url) => Container(color: Colors.black,),//i dint want to use a progress indicator
                              errorWidget: (context, url, error) =>  CircleAvatar(backgroundColor: Colors.black12,radius:63,), //we could add a child
                            ),
                             const SizedBox(height: 1,),
                             
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                player.name,
                                                       
                                style:  GoogleFonts.dmMono(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color:  Color.fromRGBO(0, 0, 0, 1),// Color.fromRGBO(209, 186, 142, 1.0)                        
                                ),
                              ),
                            ),                      
                            const Text('________________________________',
                               style: TextStyle(
                                fontSize: 2,
                                fontWeight: FontWeight.bold
                              ),
                            ),
        
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1.0),
                              child: Text(player.favFoot,
                              style:  TextStyle(                      
                                color:  mySecondaryColor,
                                fontSize: 11
                               ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
  //    );
  }
}    
