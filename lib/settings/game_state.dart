class GameState {
  static init() {}
  static GameType type = GameType.empty;
  static String userId = '';
  static String email = '';
  static String name = '';
  static int userMaxScore = 0;
  static int level = 0;
  static int score = 0;
  static clickMoment() {}
}

enum GameType { empty, loadingGame, playingGame, nextGame, overGame }
