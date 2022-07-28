import 'package:flame/components.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/settings/game_state.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

class BulletController extends Component with HasGameRef<CorsairGame> {
  late Timer timer;
  int type = 0;
  BulletController() {
    timer = Timer(.4, onTick: generateBullet, repeat: true);
  }
  generateBullet() async {
    if (GameState.type == GameType.playingGame) {
      double shipDistanse = gameRef.mainDistanse;
      double a;
      double calcAngle = (GameState.shipSpeed * shipDistanse) / GameState.bulletSpeed;
      if (type == 0) {
        a = gameRef.ship.gradus + (gameRef.ship.isReverse ? calcAngle : -calcAngle);
        type = 1;
      } else if (type == 1) {
        a = gameRef.ship.gradus;
        type = 2;
      } else if (type == 2) {
        a = gameRef.ship.gradus + (math.Random().nextDouble() * 90 - 45);
        type = 3;
      } else {
        a = gameRef.ship.gradus + (gameRef.ship.isReverse ? calcAngle : -calcAngle);
        a += math.Random().nextDouble() * 60 - 30;
        type = 0;
      }
      Bullet bullet = Bullet(
        bulletSprite: Sprite(gameRef.images.fromCache('bullet.png')),
        gradus: a,
        centerPosition: gameRef.centerPosition,
      );
      add(bullet);
    }
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
