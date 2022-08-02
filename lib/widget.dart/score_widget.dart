import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../settings/game_state.dart';

class ScoreWidget extends StatelessWidget {
  String name;
  bool isResult;
  ScoreWidget({Key? key, this.name = '', this.isResult = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance.collection('users').orderBy('score', descending: true).limit(5).snapshots();
    return Container(
      height: isResult ? MediaQuery.of(context).size.height * 0.62 : MediaQuery.of(context).size.height * 0.52,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      child: Column(
        children: [
          Text(
            isResult ? 'You scored' : 'Welcome',
            style: const TextStyle(fontSize: 20, color: Color(0xFF722F2F)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          if (isResult)
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/star.png',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 3),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      '${GameState.score}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.37,
            child: StreamBuilder(
              stream: snapshot,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("Empty"),
                  );
                }
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                    return scoreItem(Score(name: doc['name'], point: doc['score']));
                  }).toList(),
                );
              },
            ),
          ))
          // ...List.generate(listScore!.length, (index) => scoreItem(listScore![index])),
        ],
      ),
    );
  }

  Widget scoreItem(Score scr) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9D8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            scr.name ?? 'NULL',
            style: const TextStyle(fontSize: 15, color: Color(0xFF2A2A2A)),
          ),
          Text(
            '${scr.point ?? 0}',
            style: const TextStyle(fontSize: 15, color: Color(0xFF722F2F)),
          ),
        ],
      ),
    );
  }
}

class Score {
  String? name;
  int? point;
  Score({this.name, this.point});
}
