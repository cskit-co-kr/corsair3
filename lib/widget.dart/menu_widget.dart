import 'package:flame_game/settings/game_state.dart';
import 'package:flame_game/widget.dart/score_widget.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  Function setStates;
  MenuWidget({Key? key, required this.setStates}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Tradingram',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ScoreWidget(isResult: false, listScore: Score().defaultList, name: 'byambaa'),
          const SizedBox(height: 20),
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
                  color: const Color(0xFFE7C7C7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Play',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
