import 'package:flame/components.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_svg/flame_svg.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

class BulletController extends Component with HasGameRef<CorsairGame> {
  late Timer timer;
  int type = 0;
  BulletController() {
    timer = Timer(.5, onTick: generateBullet, repeat: true);
  }
  generateBullet() async {
    if (GameState.type == GameType.playingGame) {
      double radian = 0;
      if (type == 0) {
        //todo
        if (gameRef.ship.isReverse) {
          radian = -(gameRef.ship.speed + 250) / 2 + gameRef.ship.angle - gameRef.ship.speed;
        } else {
          radian = (gameRef.ship.speed + 250) / 2 + gameRef.ship.angle + gameRef.ship.speed;
        }

        type = 1;
      } else if (type == 1) {
        double rrrrr = math.Random().nextDouble() * 2 * (math.pi / 3) - (math.pi / 3);
        radian = gameRef.ship.angle + rrrrr;
        type = 2;
      } else {
        // double rrrrr = math.Random().nextDouble() * (math.pi / 3) - (math.pi / 6);
        if (gameRef.ship.isReverse) {
          radian = gameRef.ship.angle - math.pi * 6;
        } else {
          radian = gameRef.ship.angle - math.pi / 3;
        }

        type = 0;
      }
      // double radian = gameRef.ship.angle - (math.pi / 2);

      Bullet bullet = Bullet(bulletSprite: Sprite(gameRef.images.fromCache('bullet.png')), radian: radian, centerPosition: gameRef.canvasSize / 2);
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
