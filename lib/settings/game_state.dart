import 'package:flutter/cupertino.dart';

class GameState {
  static init() {}
  static GameType type = GameType.empty;
  static String userId = '';
  static String email = '';
  static String name = '';
  static int userMaxScore = 0;
  static int level = 1;
  static int score = 0;
  static double shipSpeed = 100;
  static double bulletSpeed = 150;
  static int coinCount = 26;

  static clickMoment() {}
}

enum GameType { empty, loadingGame, playingGame, nextGame, overGame }

// class GameSettings with ChangeNotifier {
//   GameType _type = GameType.empty;
//   GameType get type => _type;
//   bool get isPlaying => _type == GameType.playingGame;
//   void play() {
//     _type = GameType.playingGame;
//     notifyListeners();
//   }

//   void empty() {
//     _type = GameType.empty;
//     notifyListeners();
//   }

//   void over() {
//     _type = GameType.overGame;
//     notifyListeners();
//   }

//   void next() {
//     _type = GameType.nextGame;
//     notifyListeners();
//   }

//   void load() {
//     _type = GameType.loadingGame;
//     notifyListeners();
//   }
// }
