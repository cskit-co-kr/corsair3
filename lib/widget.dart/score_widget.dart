import 'package:flame_game/api/webapi.dart';
import 'package:flutter/cupertino.dart';
import '../settings/game_state.dart';

class ScoreWidget extends StatefulWidget {
  bool isResult;
  ScoreWidget({Key? key, this.isResult = false}) : super(key: key);

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  List<Score> scoreList = [];
  @override
  void initState() {
    super.initState();
    initData().then((value) => setStates());
  }

  @override
  void didUpdateWidget(covariant ScoreWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isResult != oldWidget.isResult) {
      initData().then((value) => setStates());
    }
  }

  Future initData() async {
    await getScoreData().then((value) {
      scoreList = value;
      scoreList.sort((b, a) => a.point!.compareTo(b.point!));
    });
  }

  void setStates() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.isResult ? MediaQuery.of(context).size.height * 0.62 : MediaQuery.of(context).size.height * 0.52,
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.isResult ? 'You scored' : 'Welcome',
              style: const TextStyle(fontSize: 20, color: Color(0xFF722F2F)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            if (widget.isResult)
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
            ...List.generate(scoreList.length, (index) => scoreItem(scoreList[index])),
          ],
        ),
      ),
    );
  }

  Widget scoreItem(Score scr) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scr.name!.toLowerCase() == GameState.name.toLowerCase() ? const Color(0xFFFFE9D8) : const Color(0xFFE7C7C7),
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
