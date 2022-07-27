import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_game/game/model/ship.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

import '../corsair_game.dart';

class Star extends SpriteComponent with CollisionCallbacks {
  // late AudioPool pool;
  Star({
    Sprite? starSprite,
    Vector2? position,
  }) : super(
          sprite: starSprite,
          size: Vector2(20, 20),
          position: position,
          anchor: Anchor.center,
        );
  @override
  void onMount() async {
    super.onMount();
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    // pool = await FlameAudio.createPool(
    //   'coin2.mp3',
    //   minPlayers: 3,
    //   maxPlayers: 4,
    // );
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Ship) {
      // pool.start();
      // print('hfdjhfdjshfkdshfks');
      removeFromParent();
      // add(
      //   OpacityEffect.by(
      //     0.0,
      //     EffectController(duration: 0.01, repeatCount: 1),
      //     onComplete: () => removeFromParent(),
      //   ),
      // );
      GameState.score++;

      // GameState.level = int.parse(GameState.score / 10) + 1;
    }
  }
}
