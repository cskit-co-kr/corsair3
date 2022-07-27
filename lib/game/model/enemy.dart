import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_svg/flame_svg.dart';

import '../corsair_game.dart';

class Enemy extends SvgComponent with HasGameRef<CorsairGame> {
  Enemy({
    Svg? enemySvg,
    Vector2? position,
  }) : super(
          svg: enemySvg,
          size: Vector2(78, 78),
          position: position,
          anchor: Anchor.center,
        );
  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
    add(RotateEffect.by(2 * pi, EffectController(duration: 15, repeatCount: 20)));
  }
}
