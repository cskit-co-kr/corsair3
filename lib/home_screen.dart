import 'package:flame/game.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_game/widget.dart/menu_widget.dart';
import 'package:flame_game/widget.dart/over_widget.dart';
import 'package:flutter/material.dart';

import 'game/corsair_game.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void setStates() {
    if (mounted) {
      setState(() {});
    }
  }
  //load

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: GameState.type == GameType.empty
                ?
                //menu widget
                MenuWidget(setStates: setStates)
                : GameState.type == GameType.overGame
                    ? OverWidget(setStates: setStates)
                    : GameWidget(
                        game: CorsairGame(setStates: setStates),
                      )),
      ),
    );
  }
}
