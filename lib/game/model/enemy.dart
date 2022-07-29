import 'package:flame/components.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_svg/flame_svg.dart';

import 'package:flutter/material.dart';

import '../corsair_game.dart';

class Enemy extends Component with HasGameRef<CorsairGame> {
  Vector2? size;
  Vector2? position;
  Svg? svg1;
  Enemy({
    this.svg1,
    this.position,
    this.size,
  });

  late SvgComponent component1;
  @override
  void onMount() async {
    super.onMount();
    component1 = SvgComponent(
      svg: svg1,
      size: size,
      position: position,
      anchor: Anchor.center,
    );
    SvgComponent component2 = SvgComponent(
      svg: await gameRef.loadSvg('images/enemy2.svg'),
      size: size! * 0.35,
      position: position,
      anchor: Anchor.center,
    );

    CircleComponent blur;
    blur = CircleComponent(
        radius: 45,
        anchor: Anchor.center,
        position: position,
        paint: Paint()
          ..shader = RadialGradient(
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.5),
              Colors.transparent,
              Colors.transparent,
            ],
          ).createShader(Rect.fromCircle(center: const Offset(45, 45), radius: 65)));
    add(blur);
    add(component1);
    add(component2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (GameState.type == GameType.playingGame) {
      component1.angle += dt * .3;
    }
  }
}
