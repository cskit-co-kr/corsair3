import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/model/ship.dart';
import 'package:flame_game/game/util/utils.dart';
import 'package:flame_game/settings/game_state.dart';
import 'dart:math' as math;

import '../corsair_game.dart';

class Bullet extends SpriteComponent with CollisionCallbacks, HasGameRef<CorsairGame> {
  double gradus;
  Vector2? chiglel;
  double distanse = 0;
  Bullet({
    Sprite? bulletSprite,
    Vector2? centerPosition,
    required this.gradus,
  }) : super(
          sprite: bulletSprite,
          size: Vector2(20, 20),
          position: centerPosition,
          anchor: Anchor.center,
        ) {
    // chiglel = Vector2(math.cos(radian!), math.sin(radian!));
  }
  @override
  void update(double dt) {
    super.update(dt);
    distanse += GameState.bulletSpeed * dt;
    position = Utils.getPosition(gameRef.centerPosition, gradus, distanse);
    if (position.y > gameRef.size.y || position.x > gameRef.size.x || position.y < 0 || position.x < 0) {
      removeFromParent();
    }
  }

  @override
  void onMount() {
    super.onMount();
    // angle = Utils.getRadian(gradus) + math.pi / 2;
    angle = -Utils.getRadian(gradus) + math.pi / 2;
    CircleHitbox shape = CircleHitbox.relative(
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
    if (other is Ship) {
      // print('STAR');
      removeFromParent();
    }
  }
}
