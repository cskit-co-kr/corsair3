import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_svg/flame_svg.dart';

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
    // TODO: implement onMount
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
