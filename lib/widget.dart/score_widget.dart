import 'package:flutter/cupertino.dart';

class ScoreWidget extends StatelessWidget {
  List<Score>? listScore;
  String name;
  bool isResult;
  ScoreWidget({Key? key, this.listScore, this.name = '', this.isResult = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF4DEDA),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 19),
      child: Column(
        children: [
          Text(
            isResult ? 'You scored' : 'Welcome',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF722F2F)),
          ),
          const SizedBox(height: 40),
          if (isResult)
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/star.png',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    '${name}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
                  ),
                ],
              ),
            ),
          ...List.generate(listScore!.length, (index) => scoreItem(listScore![index])),
        ],
      ),
    );
  }

  Widget scoreItem(Score scr) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE7C7C7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            scr.name ?? 'NULL',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
          ),
          Text(
            '${scr.point ?? 0}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
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
  List<Score> get defaultList => [
        Score(name: 'hasess', point: 100),
        Score(name: 'byamba', point: 80),
        Score(name: 'nymba', point: 150),
        Score(name: 'davaa', point: 200),
        Score(name: 'myagmr', point: 40),
      ];
}
