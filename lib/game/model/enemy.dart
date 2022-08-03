import 'package:flame/components.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flutter/material.dart';
import '../corsair_game.dart';
import 'dart:math' as math;

class Enemy extends PositionComponent with HasGameRef<CorsairGame> {
  double enemySize;
  double enemyRadian = 90;
  Enemy({
    this.enemySize = 100,
    Vector2? position,
  }) : super(position: position, anchor: Anchor.center);

  @override
  void update(double dt) {
    super.update(dt);
    if (GameState.type == GameType.playingGame) {
      enemyRadian += .5;
    }
  }

  @override
  void render(Canvas canvas) {
    Offset center = const Offset(0.0, 0.0);

    Paint paintShader = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.5),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: const Offset(0, 0), radius: enemySize * .65));
    canvas.drawCircle(center, enemySize * .65, paintShader);
    Paint paint = Paint()..color = const Color(0xFF2D68C1);
    canvas.drawCircle(center, enemySize * .5, paint);
    paint = Paint()..color = Colors.red; //const Color(0xFF36FF6E);
    canvas.drawCircle(center, enemySize * .28, paint..color = const Color(0xFF08080A));

    // canvas.drawPath(pathLight(center, enemySize), paint..color = Colors.red);
    canvas.drawPath(pathLight(center, enemySize), paint..color = const Color(0xFF43403A));
    for (int i = 0; i < 8; i++) {
      drawRotated(
        canvas,
        center,
        enemyRadian + (i * 45) + 22.5,
        () => canvas.drawCircle(
          Offset(center.dx, center.dy - enemySize * .425),
          enemySize * .035,
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
              center: Offset(center.dx, center.dy - enemySize * .395),
              width: enemySize * .028,
              height: enemySize * .165,
            ),
            Radius.circular(enemySize * .014),
          ),
          paint..color = const Color(0xFF3D7BD8),
        ),
      );
    }
  }

  Path pathLight(Offset offset, double size) {
    Path path_5 = Path();
    double x = -size * .525;
    double y = x;
    path_5.moveTo(x + size * 0.4126469, y + size * 0.3996662);
    path_5.cubicTo(x + size * 0.3799131, y + size * 0.4242162, x + size * 0.3717300, y + size * 0.4733162, x + size * 0.3553631, y + size * 0.4651323);
    path_5.cubicTo(x + size * 0.3389962, y + size * 0.4569485, x + size * 0.3512715, y + size * 0.4037577, x + size * 0.3889469, y + size * 0.3719354);
    path_5.cubicTo(x + size * 0.4266223, y + size * 0.3401123, x + size * 0.4921854, y + size * 0.3373808, x + size * 0.4944800, y + size * 0.3546585);
    path_5.cubicTo(x + size * 0.4967746, y + size * 0.3719354, x + size * 0.4453800, y + size * 0.3751169, x + size * 0.4126469, y + size * 0.3996662);
    path_5.close();
    return path_5;
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
