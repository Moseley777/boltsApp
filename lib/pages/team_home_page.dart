import 'package:flutter/material.dart';

class TeamHomePage extends StatelessWidget {
  const TeamHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.blue,
       height: double.infinity,
       width: double.infinity,
  //      color: Colors.lightBlueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
           // color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                  
                  width: 150,
                  height: 150,
        //          color: Colors.redAccent,
                  child: ClipOval(child: Container(child: Image.network('https://firebasestorage.googleapis.com/v0/b/boltsapp-d2b89.appspot.com/o/bolts_app_logo_3.jpg?alt=media&token=393b74df-91f6-44ab-9c54-5088ca39f113',))),
                 ),
                 Container(
               //   color: Colors.grey,
                  height: 50,
                  width: 50,
                  child: Center(child: Text('VS',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),)),
                 ),
                 Container(
                  width: 150,
                  height: 150,
          //        color: Colors.redAccent,
                  child: ClipOval(child: Image.network('https://firebasestorage.googleapis.com/v0/b/boltsapp-d2b89.appspot.com/o/mancitylogo.jpeg?alt=media&token=29ff7c02-4530-4240-bd64-82192aaa44b5',)),
                  
                 ),
                
                ],
              ),
            ),

            
          ),
          Container(
            height: 300,
           // color: Colors.pink,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Text('6',style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                     
                      Padding(
                        padding: const EdgeInsets.only(right:70.0),
                        child: Text('1',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      )
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(left:70.0,right: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text('Moseley',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('Moseley',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('Moseley',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('Moseley',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('Moseley',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('Moseley',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          
                          
                        ],
                      ),
                      
                      Column(
                        
                        children: [
                          
                          Text('Haaland',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),),
                        ],
                      ),
                    ],
                  ),
                )
                ],
                
              ),
              
            )
            )




          

        
        ],
        ),
      ),
      
    );
  }
}