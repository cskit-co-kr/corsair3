import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/game/model/star.dart';
import 'package:flame_game/game/util/utils.dart';
import 'package:flame_svg/flame_svg.dart';
import 'dart:math' as math;

import '../../settings/game_state.dart';
import '../corsair_game.dart';

class Ship extends SvgComponent with CollisionCallbacks, HasGameRef<CorsairGame> {
  bool isReverse = false;
  Function setStates;
  Function nextlevel;
  int coinCount = 0;
  double gradus = 0;

  Ship({
    required this.setStates,
    required this.nextlevel,
    Svg? shipSvg,
    double? gradusa,
  }) : super(
          svg: shipSvg,
          size: Vector2(33, 33),
          anchor: Anchor.center,
        ) {
    coinCount = 29;
    gradus = gradusa ?? 0;
  }
  @override
  void update(double dt) {
    super.update(dt);
    if (GameState.type == GameType.playingGame) {
      var add = (dt * GameState.shipSpeed);

      if (isReverse) {
        gradus += add;
      } else {
        gradus -= add;
      }
      position = Utils.getPosition(gameRef.centerPosition, gradus, gameRef.mainDistanse);

      angle = isReverse ? -Utils.getRadian(gradus) : math.pi - Utils.getRadian(gradus);
    } else {}
  }

  @override
  void onMount() async {
    super.onMount();
    position = Utils.getPosition(gameRef.centerPosition, gradus, gameRef.mainDistanse);
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

    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      // pool.start();
      destroy();

      // removeFromParent();
    } else if (other is Star) {
      coinCount--;
      if (coinCount < 2) {
        nextlevel();
      }
    }
  }

  void destroy() async {
    List<Sprite> aaa = [];
    SpriteSheet ss = SpriteSheet.fromColumnsAndRows(image: gameRef.images.fromCache('destroy8.png'), columns: 7, rows: 1);
    for (int i = 0; i < 7; i++) {
      aaa.add(ss.getSpriteById(i));
    }
    SpriteAnimation a = SpriteAnimation.spriteList(aaa, stepTime: 0.1, loop: false);
    SpriteAnimationComponent sac = SpriteAnimationComponent(
      animation: a,
      position: position - (Vector2(100, 100) / 2),
      size: Vector2(100, 100),
    );

    removeFromParent();
    gameRef.add(sac);
    GameState.type = GameType.overGame;
    await Future.delayed(const Duration(seconds: 2), () {
      setStates();
      // gameRef.endGame();
      print('endshipaa');
    });
  }
}
