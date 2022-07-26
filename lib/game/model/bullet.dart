import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/model/ship.dart';
import 'package:flame_svg/flame_svg.dart';
import 'dart:math' as math;

import '../corsair_game.dart';

class Bullet extends SvgComponent with CollisionCallbacks, HasGameRef<CorsairGame> {
  double speed = 250;
  double? radian;
  Vector2? chiglel;
  Bullet({
    Svg? bulletSvg,
    Vector2? centerPosition,
    this.radian,
  }) : super(
          svg: bulletSvg,
          size: Vector2(20, 20),
          position: centerPosition,
          anchor: Anchor.center,
          angle: radian,
        ) {
    chiglel = Vector2(math.cos(radian!), math.sin(radian!));
  }
  @override
  void update(double dt) {
    super.update(dt);
    position += chiglel! * speed * dt;
    // if(position.y>200){
    //   removeFromParent();
    // }
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
    if (other is Ship) {
      // print('STAR');
      removeFromParent();
    }
  }
}
