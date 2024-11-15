import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:boltsapp/model/match_model.dart';

class Firestoreservice{
  
  final fireStore = FirebaseFirestore.instance;
  

  final TextEditingController nameController = TextEditingController();
   final TextEditingController playerPositionController = TextEditingController();
    final TextEditingController imgAssetController = TextEditingController();
     final TextEditingController favFootController = TextEditingController();
      final TextEditingController jerseyNumberController = TextEditingController();
       final TextEditingController flagController = TextEditingController();
        final TextEditingController playerInfoController = TextEditingController();
         final TextEditingController goalsController = TextEditingController();
          final TextEditingController assistsController = TextEditingController();


//ADMIN PANEL METHODS
//add new player
void addNewPlayer()async{
  try{
  final QuerySnapshot snapshot = await fireStore.collection('players')
  .where('name',isEqualTo: nameController.text)
  .limit(1)
  .get();
   final playerExists = snapshot.docs.isNotEmpty; 
   if(!playerExists){
   await fireStore.collection('players').add({
    'name': nameController.text,
    'flag': flagController.text,
    'imgAsset': imgAssetController.text,
    'jerseyNumber': jerseyNumberController.text.toString(),
    'playerPosition': playerPositionController.text,
    'favFoot': favFootController.text,
    'playerInfo': playerInfoController.text,
    'goals': goalsController.text,
    'assists': assistsController.text,
   });
   print('${nameController.text} successfully added');
  }else{ //if ther player exists
   final playerDoc = snapshot.docs.first;//retrives the first document matching the condition //Where((element) => element['name']== nameController.text); //firstwhere not only retrives a document but makes it possible to perform other actions on it
  await fireStore.collection('players').doc(playerDoc.id).update(
    {
  if (nameController.text.isNotEmpty ) 'name': nameController.text,
  if (flagController.text.isNotEmpty )  'flag': flagController.text,
  if (imgAssetController.text.isNotEmpty )  'imgAsset': imgAssetController.text,
  if (jerseyNumberController.text.isNotEmpty )  'jerseyNumber': jerseyNumberController.text,
  if (playerPositionController.text.isNotEmpty )'playerPosition': playerPositionController.text,
  if (favFootController.text.isNotEmpty )  'favFoot': favFootController.text,
  if (playerInfoController.text.isNotEmpty ) 'playerInfo': playerInfoController.text,
  if (goalsController.text.isNotEmpty ) 'goals': goalsController.text,
  if (assistsController.text.isNotEmpty ) 'assists': assistsController.text,

    } 
   );
   print('${nameController.text} successfully updated');
  }
}catch(e){
  print('Error adding ${nameController.text}');
}
}


//delete players
void deletePlayer()async{
  try{
    final QuerySnapshot snapshot = await fireStore.collection('players')
    .where('name',isEqualTo: nameController.text)   //if the name inputed to the name field is equal to the name in a document then it exists
    .limit(1)
    .get();
    final playerExists = snapshot.docs.isNotEmpty; 
    final playerDoc = snapshot.docs.first; 
    if(playerExists){
      await fireStore.collection('players').doc(playerDoc.id).delete();
      print('${nameController.text} deleted successfully');
    }else{
      print('player not found');
    }
  }catch(e){ print('Error deleting ${nameController.text}'); 
  }
 }


 
Stream<List<Matches>> getMatchesByDate(String formattedDate) {
  return fireStore
      .collection('matches')
      .where('matchDate', isEqualTo: formattedDate)
      .snapshots()
      .map((snapshot) {
        final matches = snapshot.docs.map((doc) {
          print("Document data: ${doc.data()}"); // Debug each document data
          return Matches.fromDocument1(doc);
        }).toList();
        print("Matches retrieved: $matches"); // Final debug for retrieved matches
        return matches;
      });
}



  
}


//}




//
 