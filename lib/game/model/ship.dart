import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../settings/game_state.dart';
import '../corsair_game.dart';

class Ship extends SvgComponent with CollisionCallbacks, HasGameRef<CorsairGame> {
  double speed = 0.03;
  double radian = -math.pi / 2;
  bool isReverse = false;
  // late AudioPool pool;

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
    if (GameState.type == GameType.playingGame) {
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
      position = Vector2(gameRef.canvasSize.x / 2, gameRef.canvasSize.y / 2 - gameRef.canvasSize.y / 2 * .43);
      angle = 0;
      anchor = Anchor.center;
    }
  }

  @override
  void onMount() async {
    super.onMount();
    // pool = await FlameAudio.createPool(
    //   'explosion.mp3',
    //   minPlayers: 1,
    //   maxPlayers: 4,
    // );
    final shape = CircleHitbox.relative(
      1.0,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );

    final rc = RectangleComponent(paint: Paint()..color = Colors.red.withOpacity(.4), size: size * 1.2, position: size / 2, anchor: Anchor.center);
    add(shape);
    add(rc);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      // pool.start();
      destroy();
      GameState.type = GameType.overGame;

      // removeFromParent();
    }
  }

  void destroy() {
    List<Sprite> aaa = [];
    SpriteSheet ss = SpriteSheet.fromColumnsAndRows(image: gameRef.images.fromCache('destroy8.png'), columns: 7, rows: 1);
    for (int i = 0; i < 7; i++) {
      aaa.add(ss.getSpriteById(i));
    }
    SpriteAnimation a = SpriteAnimation.spriteList(aaa, stepTime: 0.1, loop: false);
    SpriteAnimationComponent sac = SpriteAnimationComponent(animation: a, position: position - (Vector2(100, 100) / 2), size: Vector2(100, 100));

    removeFromParent();
    gameRef.add(sac);
  }
}
