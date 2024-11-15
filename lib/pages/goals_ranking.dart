import 'package:boltsapp/pages/player_details_page.dart';
import 'package:boltsapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:boltsapp/model/player_model.dart';

class GoalsRankingPage extends StatelessWidget {
  const GoalsRankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals Ranking'),
        elevation: 0,
        //backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('players')
            .orderBy('goals', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // Map documents to Player objects
            final players = snapshot.data!.docs
                .map((doc) => Player.fromDocument(doc))
                .toList();

            return ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return ListTile(
                  tileColor: myprimaryColor,
                  title: Text(player.name,),
                  subtitle: Text("Goals: ${player.goals}"),
                  trailing: Text("#${index + 1}",style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerDetailsPage(player: player),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

