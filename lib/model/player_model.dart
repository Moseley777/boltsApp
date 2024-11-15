import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String name;
  final String flag;
  final String imgAsset;
  final String jerseyNumber;
  final String playerPosition;
  final String favFoot;
  final String playerInfo;
  final String goals; 
  final String assists;

  Player({
    required this.name,
    required this.flag,
    required this.imgAsset,
    required this.jerseyNumber,
    required this.playerPosition,
    required this.favFoot,
    required this.playerInfo,
    required this.goals,
    required this.assists,
  });

  // A factory method to create a Player object from a Firestore document
  factory Player.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Player(
      name: data['name'],
      flag: data['flag'],
      imgAsset: data['imgAsset'],
      jerseyNumber: data['jerseyNumber'],
      playerPosition: data['playerPosition'],
      favFoot: data['favFoot'],
      playerInfo: data['playerInfo'],
      goals: data['goals'],
      assists: data['assists']
    );
  }
}
