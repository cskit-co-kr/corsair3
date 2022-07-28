import 'dart:math' as math;

import 'package:flame/components.dart';

class Utils {
  static double rotateAngle = math.pi;
  static double getRadian(double gradus) {
    return ((gradus * math.pi) / 180) - rotateAngle;
  }

  static Vector2 getPosition(Vector2 centerPosition, double gradus, double distanse) {
    Vector2 pos = Vector2(
      distanse * math.sin(getRadian(gradus)) + centerPosition.x,
      distanse * math.cos(getRadian(gradus)) + centerPosition.y,
    );
    return pos;
  }
}
