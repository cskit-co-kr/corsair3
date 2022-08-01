import 'package:flame/components.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/settings/game_state.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

class BulletController extends Component with HasGameRef<CorsairGame> {
  late Timer timer;
  int fireMode = 0;
  BulletController() {
    timer = Timer(GameState.bulletFrac, onTick: generateBullet, repeat: true);
  }
  generateBullet() async {
    print('BulletController() ::${GameState.bulletFrac}');
    // type = math.Random().nextInt(4);
    if (GameState.type == GameType.playingGame) {
      double shipDistance = gameRef.mainDistanse;
      double a = 0;
      double calcAngle = (GameState.shipSpeed * shipDistance) / GameState.bulletSpeed;
      // if (type == 0) {
      //   a = gameRef.ship.gradus + (gameRef.ship.isReverse ? calcAngle : -calcAngle);
      //   type = 1;
      // } else if (type == 1) {
      //   a = gameRef.ship.gradus;
      //   type = 2;
      // } else if (type == 2) {
      //   a = gameRef.ship.gradus + (math.Random().nextDouble() * 30 - 45);
      //   type = 3;
      // } else {
      //   a = gameRef.ship.gradus + (gameRef.ship.isReverse ? calcAngle : -calcAngle);
      //   a += math.Random().nextDouble() * 60 - 30;
      //   type = 0;
      // }
      if (fireMode == 4) {
        fireMode = 0;

        a = gameRef.ship.gradus + (math.Random().nextDouble() * 90 - 45);
      } else if (fireMode == 3) {
        a = gameRef.ship.gradus;
      } else if (fireMode == 2) {
        fireMode = 0;
        a = gameRef.ship.gradus + (gameRef.ship.isReverse ? calcAngle : -calcAngle);
      } else {
        a = gameRef.ship.gradus + (gameRef.ship.isReverse ? calcAngle : -calcAngle);
        a += (math.Random().nextDouble() * 60 - 30);
      }

      Bullet bullet = Bullet(
        // bulletSprite: Sprite(gameRef.images.fromCache('bullet.png')),
        bulletSize: 26,
        gradus: a,
        centerPosition: gameRef.centerPosition,
      );
      add(bullet);

      fireMode++;
    }
  }
  //0.0 :: 1.0
  //-45 :: 45

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
