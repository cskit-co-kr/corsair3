import 'package:flame_game/settings/game_state.dart';
import 'package:flame_game/widget.dart/score_widget.dart';
import 'package:flutter/material.dart';

class OverWidget extends StatefulWidget {
  Function setStates;
  OverWidget({Key? key, required this.setStates}) : super(key: key);

  @override
  State<OverWidget> createState() => _OverWidgetState();
}

class _OverWidgetState extends State<OverWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'tradingram',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 20),
        ScoreWidget(isResult: true, listScore: Score().defaultList, name: 'byambaa'),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            GameState.type = GameType.loadingGame;
            widget.setStates();
          },
          child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFE7C7C7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Restart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
                ),
              )),
        ),
      ],
    );
  }
}
