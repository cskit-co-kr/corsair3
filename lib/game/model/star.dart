import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_game/game/corsair_game.dart';
import 'package:flame_game/game/model/ship.dart';
import 'package:flame_game/settings/game_state.dart';

class Star extends SpriteComponent with HasGameRef<CorsairGame>, CollisionCallbacks {
  Star({
    Sprite? starSprite,
    Vector2? position,
  }) : super(
          sprite: starSprite,
          size: Vector2(22, 22),
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

    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Ship) {
      gameRef.pool.start();
      removeFromParent();
      print('dhfjashf lasd asd  ${parent}');
      GameState.score++;
    }
  }
}
