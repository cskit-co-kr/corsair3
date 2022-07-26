import 'package:flame/components.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/game/model/star.dart';
import 'package:flame_svg/flame_svg.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

// class StarController extends Component with HasGameRef<CorsairGame> {
//   Svg? starSvg;
//   int coinCount = 30;

//   StarController({this.starSvg});
//   generateStar(Vector2 starPosition) {
//     double radian = math.Random().nextDouble() * math.pi * 2;
//     Star star = Star(starSvg: starSvg, position: starPosition);
//     gameRef.add(star);
//   }

//   @override
//   void onMount() {
//     super.onMount();
//     Vector2 centerPostion = gameRef.size / 2;
//     double distanse = gameRef.size.x * .43;

//     for (int i = 1; i < coinCount; i++) {
//       double angle2 = (180 - ((360 / coinCount) * i)) * math.pi / 180;
//       Vector2 position = Vector2(
//         centerPostion.x + (distanse * math.sin(angle2)),
//         centerPostion.y + (distanse * math.cos(angle2)),
//       );
//       generateStar(position);
//     }
//   }
// }

class StarController extends Component with HasGameRef<CorsairGame> {
  late Timer timer;
  Svg? starSvg;
  int coinCount = 30;
  int totalStep = 1;

  StarController({this.starSvg}) {
    timer = Timer(.05, onTick: generateBullet, repeat: true);
  }
  generateBullet() {
    Vector2 centerPostion = gameRef.size / 2;
    double distanse = gameRef.size.x * .43;

    if (totalStep < coinCount) {
      double angle2 = (180 - ((360 / coinCount) * totalStep)) * math.pi / 180;
      Vector2 position = Vector2(
        centerPostion.x + (distanse * math.sin(angle2)),
        centerPostion.y + (distanse * math.cos(angle2)),
      );
      generateStar(position);
      totalStep++;
    }
  }

  generateStar(Vector2 starPosition) {
    double radian = math.Random().nextDouble() * math.pi * 2;
    Star star = Star(starSvg: starSvg, position: starPosition);
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
