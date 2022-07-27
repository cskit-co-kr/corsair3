import 'package:flame/components.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_svg/flame_svg.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

class BulletController extends Component with HasGameRef<CorsairGame> {
  late Timer timer;

  BulletController() {
    timer = Timer(.5, onTick: generateBullet, repeat: true);
  }
  generateBullet() async {
    if (GameState.type == GameType.playingGame) {
      double radian = math.Random().nextDouble() * math.pi * 2;
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
