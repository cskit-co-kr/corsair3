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
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Expanded(child: ScoreWidget(isResult: true)),
          const SizedBox(height: 25),
          InkWell(
            onTap: () {
              GameState.type = GameType.loadingGame;
              GameState.score = 0;
              GameState.level = 1;
              widget.setStates();
            },
            child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Restart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
                  ),
                )),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
