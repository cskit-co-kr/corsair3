import 'package:flame/components.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_svg/flame_svg.dart';

import 'package:flutter/material.dart';

import '../corsair_game.dart';
import 'dart:math' as math;

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
        radius: 40,
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
          ).createShader(Rect.fromCircle(center: const Offset(40, 40), radius: 50)));
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

class EnemyShape extends Component with HasGameRef<CorsairGame> {
  double enemySize;
  Vector2 enemyPosition;
  double enemyRadian = 0;
  EnemyShape({
    this.enemySize = 100,
    required this.enemyPosition,
  });

  @override
  void update(double dt) {
    super.update(dt);
    enemyRadian += .01;
  }

  @override
  void render(Canvas canvas) {
    double shipSize = enemySize;
    Offset center = Offset(enemyPosition.x, enemyPosition.y);
    Paint paint = Paint()..color = const Color(0xFF2D68C1);
    canvas.drawCircle(center, shipSize * .5, paint);
    paint = Paint()..color = Colors.red; //const Color(0xFF36FF6E);
    canvas.drawCircle(center, shipSize * .28, paint..color = const Color(0xFF08080A));
    double x = center.dx;
    double y = center.dy - shipSize * .15;
    double a = 1;
    Path path0 = Path();
    path0.moveTo(x - 25, y);
    path0.quadraticBezierTo(x - 40 * a, y + 10 * a, x - 25 * a, y - 10 * a);
    path0.quadraticBezierTo(x, y - 35 * a, x + 25 * a, y - 10 * a);
    path0.quadraticBezierTo(x + 40 * a, y + 10 * a, x + 25 * a, y);
    path0.quadraticBezierTo(x, y - 10 * a, x - 25 * a, y);
    path0.close();
    drawRotated(
      canvas,
      center,
      -45,
      () => canvas.drawPath(path0, paint..color = const Color(0xFF43403A)),
    );
    for (int i = 0; i < 8; i++) {
      drawRotated(
        canvas,
        center,
        enemyRadian + (i * 45) + 22.5,
        () => canvas.drawCircle(
          Offset(center.dx, center.dy - shipSize * .425),
          shipSize * .035,
          paint..color = const Color(0xFF36FF6E),
        ),
      );
      drawRotated(
        canvas,
        center,
        enemyRadian + (i * 45),
        () => canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: Offset(center.dx, center.dy - shipSize * .395),
              width: shipSize * .028,
              height: shipSize * .165,
            ),
            Radius.circular(shipSize * .014),
          ),
          paint..color = const Color(0xFF3D7BD8),
        ),
      );
    }
  }
}

void drawRotated(
  Canvas canvas,
  Offset center,
  double gradus,
  VoidCallback drawFunction,
) {
  canvas.save();
  canvas.translate(center.dx, center.dy);
  canvas.rotate(toRadian(gradus));
  canvas.translate(-center.dx, -center.dy);
  drawFunction();
  canvas.restore();
}

double toRadian(double gradus) {
  return ((gradus * math.pi) / 180);
}
