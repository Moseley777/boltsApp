
import 'package:cloud_firestore/cloud_firestore.dart';

class Matches {
  final String id;
  final String competitionName;
  final String homeTeam;
  final String awayTeam;
  final String matchDate;
  final String status;
  final String homeTeamScore;
  final String awayTeamScore;
  final String stadium; 
  final List<dynamic> homeGoalScorers; // New field
  final List<dynamic> awayGoalScorers; // New field
  Matches({
    required this.id,
    required this.competitionName,
    required this.homeTeam,
    required this.awayTeam,
    required this.matchDate,
    required this.status,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.stadium,
    required this.homeGoalScorers,
    required this.awayGoalScorers
  });
 
  
  factory Matches.fromDocument1(DocumentSnapshot doc) {

    final data = doc.data() as Map<String, dynamic>;
  //   print("Mapping document with data: $data"); // Debugging line
    return Matches(
      id: data['id'],             //HANDLE NULL VALUES LATER
      competitionName: data['competitionName'], 
      homeTeam: data['homeTeam'], 
      awayTeam: data['awayTeam'], 
      matchDate: data['matchDate'], 
      status: data['status'], 
      homeTeamScore: data['homeTeamScore'], //.toString() will make it still work incase ist null convert to a string format 
      awayTeamScore: data['awayTeamScore'], 
      stadium: data['stadium'],
      homeGoalScorers: data['homeGoalScorers'],
      awayGoalScorers: data['awayGoalScorers']
    );
  }
}
