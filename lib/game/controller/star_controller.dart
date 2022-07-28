import 'package:flame/components.dart';
import 'package:flame_game/game/model/star.dart';
import 'package:flame_game/game/util/utils.dart';
import 'package:flame_game/settings/game_state.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

class StarController extends Component with HasGameRef<CorsairGame> {
  late Timer timer;
  int totalStep = 1;

  StarController() {
    timer = Timer(.02, onTick: generateBullet, repeat: true);
  }
  generateBullet() {
    Vector2 centerPostion = gameRef.centerPosition;
    double distanse = gameRef.mainDistanse;

    if (totalStep < GameState.coinCount) {
      double angle2 = Utils.getRadian((360 / GameState.coinCount) * (GameState.coinCount - totalStep));
      Vector2 position = Vector2(
        centerPostion.x + (distanse * math.sin(angle2)),
        centerPostion.y + (distanse * math.cos(angle2)),
      );
      generateStar(position);
      totalStep++;
    }
  }

  generateStar(Vector2 starPosition) async {
    double radian = math.Random().nextDouble() * math.pi * 2;
    Star star = Star(starSprite: Sprite(gameRef.images.fromCache('star.png')), position: starPosition);
    add(star);
  }

  @override
  void onMount() {
    super.onMount();
    timer.start();
  }

  @override
  void onRemove() {
    super.onRemove();
    timer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer.update(dt);
  }
}
