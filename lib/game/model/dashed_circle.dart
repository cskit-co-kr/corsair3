import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DashedCircle extends Component {
  Paint paint;
  Vector2 center;
  double radius;
  int dashes;
  double gapSize;
  DashedCircle({
    required this.center,
    this.radius = 10,
    required this.paint,
    this.dashes = 20,
    this.gapSize = 3.0,
  });
  @override
  void render(Canvas canvas) {
    double gap = math.pi / 180 * gapSize;
    double singleAngle = (math.pi * 2) / dashes;
    for (int i = 0; i < dashes; i++) {
      canvas.drawArc(
        Rect.fromCenter(center: Offset(center.x, center.y), width: 2 * radius, height: 2 * radius),
        gap + singleAngle * i,
        singleAngle - gap * 2,
        false,
        paint,
      );
    }
  }
}
