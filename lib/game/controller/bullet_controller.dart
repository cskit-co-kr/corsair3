import 'package:flame/components.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_svg/flame_svg.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

class BulletController extends Component with HasGameRef<CorsairGame> {
  late Timer timer;
  Svg? bulletSvg;

  BulletController({this.bulletSvg}) {
    timer = Timer(.05, onTick: generateBullet, repeat: true);
  }
  generateBullet() {
    double radian = math.Random().nextDouble() * math.pi * 2;
    Bullet bullet = Bullet(bulletSvg: bulletSvg, radian: radian, centerPosition: gameRef.canvasSize / 2);
    add(bullet);
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
