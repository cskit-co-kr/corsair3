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
  static double bulletSpeed = 200;
  static int coinCount = 26;
  static double bulletFrac = .4;

  static clickMoment() {}
}

enum GameType { empty, loadingGame, playingGame, nextGame, overGame }
