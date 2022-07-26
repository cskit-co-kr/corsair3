import 'package:flame/game.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../game/corsair_game.dart';

class MenuWidget extends StatefulWidget {
  Function setStates;
  MenuWidget({Key? key, required this.setStates}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(child: Text('tradingram')),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: InkWell(
            onTap: () {
              GameState.type = GameType.loadingGame;
              widget.setStates();
            },
            child: Center(
                child: Text(
              'play',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ],
    );
  }
}
