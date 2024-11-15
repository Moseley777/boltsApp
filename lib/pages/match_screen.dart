import 'package:boltsapp/model/match_model.dart';
import 'package:boltsapp/services/firestore.dart';
import 'package:boltsapp/themes/colors.dart';
import 'package:boltsapp/util/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  Firestoreservice firestoreService = Firestoreservice();
  DateTime _selectedDate = DateTime.now();
  late String formattedDate;

  @override
  void initState(){
    super.initState();
    formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOLTS Matches')),
      body: ListView(     //instead of Column wrapped with childscroll
        children: [
          TableCalendar(
            headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
            
            rowHeight: 35,
            focusedDay: _selectedDate,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (selectedDay)=>isSameDay(selectedDay, _selectedDate),//for selected day to be focused wehen we click it
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;   //when we select a day by clicking the calender it changes the selectedDate variable
                formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
                 print('Selected date: $formattedDate');
              });
            },
          ),
           /*     Expanded(
            child:*/ StreamBuilder(
              stream: firestoreService.getMatchesByDate(formattedDate),              
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No matches on this day.'));
                }
               
                final matches = snapshot.data!;
                print('matches is $matches');
      
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false, 
               physics: NeverScrollableScrollPhysics(),
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    final match = matches[index];
                   /* return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                       
                        tileColor:  myprimaryColor,
                        title: Text('${match.homeTeam} vs ${match.awayTeam}'),
                        subtitle: Text('${match.competitionName} at ${match.stadium}'),
                        trailing: Text('${match.homeTeamScore} - ${match.awayTeamScore}'),
                      ),
                    );*/
                    return MatchesCard(match: match);
                  },
                );
              },
            ),
       //   ),
        ],
      ),
    );
  }
}



class MatchesCard extends StatelessWidget {
  final Matches match;
  const MatchesCard({super.key,required this.match});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 455,//width: 400,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/boltsapp-d2b89.appspot.com/o/wallpaper%20football.jpg?alt=media&token=8ac3b87b-644b-4a93-872c-67ffeaf705d0',),
            fit: BoxFit.cover
          )
        ),
        child:Container(   //this contyainerr to make the background image less visible
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4)
          ),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Text(match.stadium,style: TextStyle(color: myprimaryColor,fontSize: 20),),
              SizedBox(height:19),
              
              Text(match.status,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white70
              ),
              ),
          
              //Text('LOL',style: TextStyle(fontSize: 120),),
              //Text('LOL',style: TextStyle(fontSize: 120),),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 115,height: 115,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network('https://firebasestorage.googleapis.com/v0/b/boltsapp-d2b89.appspot.com/o/bolts_app_logo_2.jpg?alt=media&token=e8746db0-ae39-4d05-952e-5f8ec2692a59',))
                          ),
                          SizedBox(height: 5,),
                            Text(match.homeTeam,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            match.homeTeamScore,
                          style: matchScoreTextStyle,),
                        ),
                      
                        //SizedBox(height: 10,),
                        /*Container(//color: Colors.orange,
                          height: 140,
                          child: Column(
                           // shrinkWrap: true,
                        //    primary: false,
                            children: [
                              Text('Moseley',style: myGoalsScorersTextStyle,),
                             Text('Moseley',style: myGoalsScorersTextStyle,),
                             Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),

                            ],
                          ),
                        )*/
                      ],
                    ),
                  
                    
                    //SizedBox(width: 50,),
                   Text(
                    'VS',
                   style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
                    Column(
                      children: [
                        SizedBox(
                          width: 115,height:115,
                          child: ClipRRect(
                            borderRadius:   BorderRadius.circular(20),
                            child: Image.network('https://firebasestorage.googleapis.com/v0/b/boltsapp-d2b89.appspot.com/o/bolts_app_logo_3.jpg?alt=media&token=393b74df-91f6-44ab-9c54-5088ca39f113'))),
                            SizedBox(height: 5,),
                            Text(match.awayTeam,style: TextStyle(fontWeight: FontWeight.bold,color:   Colors.white),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            match.awayTeamScore,
                          style: matchScoreTextStyle
                          ),
                        ),
                        // SizedBox(height: 10,),
                        /*Container(//color: Colors.orange,
                          height: 140,
                          child: Column(
                           // shrinkWrap: true,
                        //    primary: false,
                            children: [
                              Text('Moseley',style: myGoalsScorersTextStyle,),
                             Text('Moseley',style: myGoalsScorersTextStyle,),
                             Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),
                            Text('Moseley',style: myGoalsScorersTextStyle,),

                            ],
                          ),
                        )*/
                        
                        
                        
                      ],
                    ),
                  ],
                ),

                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                 Column(
                  children: 
                    /* /// Text('Moseley',style: myGoalsScorersTextStyle,),
                     Text('Moseley',style: myGoalsScorersTextStyle,),
                     Text('Moseley',style: myGoalsScorersTextStyle,),
                     Text('Moseley',style: myGoalsScorersTextStyle,),
                     Text('Moseley',style: myGoalsScorersTextStyle,),
                     Text('Moseley',style: myGoalsScorersTextStyle,),*/
                    match.homeGoalScorers.map((scorer) => Text(scorer, style: myGoalsScorersTextStyle)).toList(),
                  
                 ),
                 //SizedBox(width: 15,),
                 Column(
                  children: 
                  //  Text('Moseley',style: myGoalsScorersTextStyle,),
                 //   Text('Moseley',style: myGoalsScorersTextStyle,),
                  //  Text('Moseley',style: myGoalsScorersTextStyle,),
                  //  Text('Moseley',style: myGoalsScorersTextStyle,),
                  //  Text('Moseley',style: myGoalsScorersTextStyle,),
                  //  Text('Moseley',style: myGoalsScorersTextStyle,),
                   match.awayGoalScorers!.map((scorer) => Text(scorer, style: myGoalsScorersTextStyle)).toList(),
                  
                 )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}