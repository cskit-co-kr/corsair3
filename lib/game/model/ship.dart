import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/game/model/star.dart';
import 'package:flame_svg/flame_svg.dart';
import 'dart:math' as math;

import '../corsair_game.dart';

class Ship extends SvgComponent with CollisionCallbacks, HasGameRef<CorsairGame> {
  double speed = 0.03;
  double radian = 0;
  bool isPlaying = true;
  bool isReverse = false;

  Ship({
    Svg? shipSvg,
    Vector2? position,
  }) : super(
          svg: shipSvg,
          size: Vector2(33, 33),
          position: position,
          anchor: Anchor.center,
        );
  @override
  void update(double dt) {
    super.update(dt);
    if (isPlaying) {
      if (isReverse) {
        radian -= speed;
      } else {
        radian += speed;
      }
      x = gameRef.canvasSize.x * .43 * math.cos(radian);
      y = gameRef.canvasSize.x * .43 * math.sin(radian);
      position = Vector2(gameRef.canvasSize.x / 2 + x, gameRef.canvasSize.y / 2 + y);

      angle = isReverse ? -math.pi / 2 + radian : math.pi / 2 + radian;
    } else {
      position = Vector2(gameRef.canvasSize.x / 2, gameRef.canvasSize.y / 2 - gameRef.canvasSize.y / 2 * .47);
      angle = 0;
      anchor = Anchor.center;
    }
  }

  @override
  void onMount() {
    super.onMount();
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      removeFromParent();
    }
  }

  void clickAction() {
    isReverse = !isReverse;
  }
}
