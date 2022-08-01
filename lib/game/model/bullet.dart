import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/model/ship.dart';
import 'package:flame_game/game/util/utils.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import '../corsair_game.dart';

class Bullet extends PositionComponent with HasGameRef<CorsairGame>, CollisionCallbacks {
  double bulletSize;
  double gradus;

  double distanse = 0;
  Bullet({
    required this.gradus,
    Vector2? centerPosition,
    required this.bulletSize,
  }) : super(position: centerPosition, anchor: Anchor.center, size: Vector2(bulletSize, bulletSize * .8), angle: -math.pi / 2 - (((gradus) * math.pi) / 180));
  @override
  void onMount() async {
    super.onMount();
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: Vector2(bulletSize, bulletSize * .8) / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  void update(double dt) {
    super.update(dt);
    distanse += GameState.bulletSpeed * dt;
    position = Utils.getPosition(gameRef.centerPosition, gradus, distanse);
    if (position.y > gameRef.size.y || position.x > gameRef.size.x || position.y < 0 || position.x < 0) {
      removeFromParent();
      print('remove');
    }
  }

  @override
  void render(Canvas canvas) {
    Size size = Size(
      bulletSize,
      bulletSize * .8,
    );
    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_0_stroke.shader = ui.Gradient.linear(Offset(size.width * 0.9983667, size.height * 0.4812013), Offset(size.width * 0.3370178, size.height * 0.4878438),
        [Colors.white.withOpacity(1), Color(0xff39E6F1).withOpacity(1), Color(0xff2562FF).withOpacity(1)], [0.0057145, 0.068468, 1]);
    canvas.drawPath(path0(size), paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width * 0.9856889, size.height * 0.4883244), Offset(size.width * 0.3370267, size.height * 0.4878438),
        [Colors.white.withOpacity(1), Color(0xff39E6F1).withOpacity(1), Color(0xff2562FF).withOpacity(1)], [0.0102039, 0.0677083, 1]);
    canvas.drawPath(path0(size), paint_0_fill);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_1_stroke.shader =
        ui.Gradient.linear(Offset(size.width * 0.9223111, size.height * 0.4882950), Offset(size.width * 0.3963000, size.height * 0.4809081), [Color(0xff39E6F1).withOpacity(1), Color(0xff0047FD).withOpacity(1)], [0, 1]);
    canvas.drawPath(path1(size), paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader =
        ui.Gradient.linear(Offset(size.width * 0.9223111, size.height * 0.4882950), Offset(size.width * 0.3836222, size.height * 0.4880313), [Color(0xff39E6F1).withOpacity(1), Color(0xff2562FF).withOpacity(1)], [0, 1]);
    canvas.drawPath(path1(size), paint_1_fill);

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_2_stroke.color = Color(0xff39E6F1).withOpacity(1.0);
    canvas.drawPath(path2(size), paint_2_stroke);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff39E6F1).withOpacity(1.0);
    canvas.drawPath(path2(size), paint_2_fill);

    Paint paint_3_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02777778;
    paint_3_stroke.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path3(size), paint_3_stroke);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path3(size), paint_3_fill);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Ship) {
      // print('STAR');
      removeFromParent();
    }
  }

  Path path0(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6904500, size.height * 0.2712456);
    path_0.cubicTo(size.width * 0.6668944, size.height * 0.2611106, size.width * 0.6297611, size.height * 0.2464187, size.width * 0.6297611, size.height * 0.2464187);
    path_0.lineTo(size.width * 0.6352778, size.height * 0.3022794);
    path_0.lineTo(size.width * 0.3787306, size.height * 0.2805556);
    path_0.lineTo(size.width * 0.4697628, size.height * 0.3829675);
    path_0.lineTo(size.width * 0.1111111, size.height * 0.4807663);
    path_0.lineTo(size.width * 0.4725217, size.height * 0.6033069);
    path_0.lineTo(size.width * 0.3732133, size.height * 0.7088188);
    path_0.lineTo(size.width * 0.6352778, size.height * 0.6871000);
    path_0.lineTo(size.width * 0.6325167, size.height * 0.7398562);
    path_0.cubicTo(size.width * 0.6325167, size.height * 0.7398562, size.width * 0.6697611, size.height * 0.7254750, size.width * 0.6932056, size.height * 0.7150250);
    path_0.cubicTo(size.width * 0.7160889, size.height * 0.7048313, size.width * 0.7288111, size.height * 0.6987562, size.width * 0.7511333, size.height * 0.6871000);
    path_0.cubicTo(size.width * 0.7729833, size.height * 0.6756875, size.width * 0.7854222, size.height * 0.6695688, size.width * 0.8063056, size.height * 0.6560625);
    path_0.cubicTo(size.width * 0.8252167, size.height * 0.6438312, size.width * 0.8353111, size.height * 0.6359687, size.width * 0.8532000, size.height * 0.6219269);
    path_0.cubicTo(size.width * 0.8708722, size.height * 0.6080587, size.width * 0.8810333, size.height * 0.6005294, size.width * 0.8973389, size.height * 0.5846862);
    path_0.cubicTo(size.width * 0.9146333, size.height * 0.5678825, size.width * 0.9240944, size.height * 0.5578950, size.width * 0.9387167, size.height * 0.5381356);
    path_0.cubicTo(size.width * 0.9505722, size.height * 0.5221106, size.width * 0.9663000, size.height * 0.4946888, size.width * 0.9663000, size.height * 0.4946888);
    path_0.lineTo(size.width * 0.9359611, size.height * 0.4481381);
    path_0.lineTo(size.width * 0.9194056, size.height * 0.4295181);
    path_0.cubicTo(size.width * 0.9194056, size.height * 0.4295181, size.width * 0.9012278, size.height * 0.4069262, size.width * 0.8863056, size.height * 0.3922775);
    path_0.cubicTo(size.width * 0.8700722, size.height * 0.3763413, size.width * 0.8601056, size.height * 0.3684600, size.width * 0.8421667, size.height * 0.3550369);
    path_0.cubicTo(size.width * 0.8224722, size.height * 0.3403019, size.width * 0.8069944, size.height * 0.3305950, size.width * 0.7897556, size.height * 0.3209000);
    path_0.lineTo(size.width * 0.7456167, size.height * 0.2960725);
    path_0.cubicTo(size.width * 0.7283833, size.height * 0.2863775, size.width * 0.7121222, size.height * 0.2805719, size.width * 0.6904500, size.height * 0.2712456);
    path_0.close();
    return path_0;
  }

  Path path1(Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.8035500, size.height * 0.3984850);
    path_1.cubicTo(size.width * 0.7820056, size.height * 0.3839419, size.width * 0.7761278, size.height * 0.3806181, size.width * 0.7538944, size.height * 0.3674513);
    path_1.cubicTo(size.width * 0.7308556, size.height * 0.3538094, size.width * 0.6932056, size.height * 0.3364175, size.width * 0.6932056, size.height * 0.3364175);
    path_1.lineTo(size.width * 0.6932056, size.height * 0.3612444);
    path_1.lineTo(size.width * 0.5194178, size.height * 0.3519344);
    path_1.lineTo(size.width * 0.5773500, size.height * 0.4171050);
    path_1.lineTo(size.width * 0.4835567, size.height * 0.4419319);
    path_1.lineTo(size.width * 0.5442444, size.height * 0.4729662);
    path_1.lineTo(size.width * 0.4311439, size.height * 0.5319300);
    path_1.lineTo(size.width * 0.5801056, size.height * 0.5691706);
    path_1.lineTo(size.width * 0.5221761, size.height * 0.6343437);
    path_1.lineTo(size.width * 0.6959667, size.height * 0.6250313);
    path_1.lineTo(size.width * 0.6932056, size.height * 0.6529625);
    path_1.cubicTo(size.width * 0.6932056, size.height * 0.6529625, size.width * 0.7325778, size.height * 0.6336937, size.width * 0.7566556, size.height * 0.6188244);
    path_1.cubicTo(size.width * 0.7731722, size.height * 0.6086225, size.width * 0.7820833, size.height * 0.6021856, size.width * 0.7980333, size.height * 0.5908944);
    path_1.cubicTo(size.width * 0.8177556, size.height * 0.5769294, size.width * 0.8299722, size.height * 0.5706925, size.width * 0.8476833, size.height * 0.5536537);
    path_1.cubicTo(size.width * 0.8592667, size.height * 0.5425150, size.width * 0.8752722, size.height * 0.5226200, size.width * 0.8752722, size.height * 0.5226200);
    path_1.lineTo(size.width * 0.9001000, size.height * 0.4946894);
    path_1.lineTo(size.width * 0.8669944, size.height * 0.4574494);
    path_1.cubicTo(size.width * 0.8669944, size.height * 0.4574494, size.width * 0.8441167, size.height * 0.4309719, size.width * 0.8394111, size.height * 0.4264156);
    path_1.cubicTo(size.width * 0.8334778, size.height * 0.4206750, size.width * 0.8173389, size.height * 0.4077950, size.width * 0.8035500, size.height * 0.3984850);
    path_1.close();
    return path_1;
  }

  Path path2(Size size) {
    Path path_2 = Path();
    path_2.moveTo(size.width * 0.8228556, size.height * 0.5195144);
    path_2.cubicTo(size.width * 0.8334056, size.height * 0.5096612, size.width * 0.8476833, size.height * 0.4915844, size.width * 0.8476833, size.height * 0.4915844);
    path_2.cubicTo(size.width * 0.8476833, size.height * 0.4915844, size.width * 0.8294611, size.height * 0.4686356, size.width * 0.8201000, size.height * 0.4605506);
    path_2.cubicTo(size.width * 0.8139389, size.height * 0.4552294, size.width * 0.8035500, size.height * 0.4481369, size.width * 0.8035500, size.height * 0.4481369);
    path_2.cubicTo(size.width * 0.8035500, size.height * 0.4481369, size.width * 0.7888278, size.height * 0.4377531, size.width * 0.7787222, size.height * 0.4326200);
    path_2.cubicTo(size.width * 0.7663000, size.height * 0.4263137, size.width * 0.7587333, size.height * 0.4243775, size.width * 0.7456167, size.height * 0.4202063);
    path_2.cubicTo(size.width * 0.7317889, size.height * 0.4158075, size.width * 0.7097556, size.height * 0.4108963, size.width * 0.7097556, size.height * 0.4108963);
    path_2.cubicTo(size.width * 0.7097556, size.height * 0.4108963, size.width * 0.6840667, size.height * 0.4046894, size.width * 0.6711389, size.height * 0.4046894);
    path_2.cubicTo(size.width * 0.6582111, size.height * 0.4046894, size.width * 0.6543056, size.height * 0.4028294, size.width * 0.6435500, size.height * 0.4108963);
    path_2.cubicTo(size.width * 0.6397500, size.height * 0.4137487, size.width * 0.6373222, size.height * 0.4156075, size.width * 0.6352778, size.height * 0.4202063);
    path_2.cubicTo(size.width * 0.6297611, size.height * 0.4326200, size.width * 0.6242444, size.height * 0.4698606, size.width * 0.6242444, size.height * 0.4698606);
    path_2.cubicTo(size.width * 0.6242444, size.height * 0.4698606, size.width * 0.6221167, size.height * 0.5002719, size.width * 0.6242444, size.height * 0.5195144);
    path_2.cubicTo(size.width * 0.6260167, size.height * 0.5355600, size.width * 0.6297000, size.height * 0.5535212, size.width * 0.6325167, size.height * 0.5598581);
    path_2.cubicTo(size.width * 0.6353333, size.height * 0.5661956, size.width * 0.6380333, size.height * 0.5722719, size.width * 0.6463111, size.height * 0.5753750);
    path_2.cubicTo(size.width * 0.6545833, size.height * 0.5784788, size.width * 0.6698500, size.height * 0.5753750, size.width * 0.6849278, size.height * 0.5753750);
    path_2.cubicTo(size.width * 0.6978556, size.height * 0.5753750, size.width * 0.7079667, size.height * 0.5740944, size.width * 0.7207889, size.height * 0.5722719);
    path_2.cubicTo(size.width * 0.7363556, size.height * 0.5700606, size.width * 0.7475556, size.height * 0.5669863, size.width * 0.7566500, size.height * 0.5629619);
    path_2.cubicTo(size.width * 0.7701000, size.height * 0.5570094, size.width * 0.7772389, size.height * 0.5524712, size.width * 0.7897556, size.height * 0.5443412);
    path_2.cubicTo(size.width * 0.8032111, size.height * 0.5356025, size.width * 0.8123056, size.height * 0.5293675, size.width * 0.8228556, size.height * 0.5195144);
    path_2.close();
    return path_2;
  }

  Path path3(Size size) {
    Path path_3 = Path();
    path_3.moveTo(size.width * 0.6851167, size.height * 0.4439850);
    path_3.cubicTo(size.width * 0.6851167, size.height * 0.4439850, size.width * 0.6865389, size.height * 0.4417494, size.width * 0.6885222, size.height * 0.4401525);
    path_3.cubicTo(size.width * 0.6905111, size.height * 0.4385556, size.width * 0.6989167, size.height * 0.4397181, size.width * 0.7055611, size.height * 0.4401525);
    path_3.cubicTo(size.width * 0.7115722, size.height * 0.4405456, size.width * 0.7208889, size.height * 0.4420688, size.width * 0.7208889, size.height * 0.4420688);
    path_3.lineTo(size.width * 0.7345167, size.height * 0.4459019);
    path_3.cubicTo(size.width * 0.7398389, size.height * 0.4473981, size.width * 0.7430333, size.height * 0.4478181, size.width * 0.7481444, size.height * 0.4497344);
    path_3.cubicTo(size.width * 0.7532556, size.height * 0.4516506, size.width * 0.7616444, size.height * 0.4572575, size.width * 0.7633500, size.height * 0.4591737);
    path_3.lineTo(size.width * 0.7702889, size.height * 0.4669813);
    path_3.lineTo(size.width * 0.7532556, size.height * 0.4631487);
    path_3.cubicTo(size.width * 0.7532556, size.height * 0.4631487, size.width * 0.7429333, size.height * 0.4604275, size.width * 0.7362222, size.height * 0.4593162);
    path_3.cubicTo(size.width * 0.7289500, size.height * 0.4581119, size.width * 0.7248111, size.height * 0.4580256, size.width * 0.7174833, size.height * 0.4574000);
    path_3.cubicTo(size.width * 0.7035389, size.height * 0.4562081, size.width * 0.6834167, size.height * 0.4574000, size.width * 0.6817111, size.height * 0.4554831);
    path_3.cubicTo(size.width * 0.6787333, size.height * 0.4521363, size.width * 0.6851167, size.height * 0.4439850, size.width * 0.6851167, size.height * 0.4439850);
    path_3.close();
    return path_3;
  }
}
