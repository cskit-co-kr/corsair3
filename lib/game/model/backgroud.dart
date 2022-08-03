import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

//Copy this CustomPainter code to the Bottom of the File
class GameBackGround extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..style = PaintingStyle.fill;
    paint0.shader = ui.Gradient.linear(Offset(size.width * 0.5000000, 0), Offset(size.width * 0.5000000, size.height), [Color(0xff30075E).withOpacity(1), Color(0xff0B051B).withOpacity(1)], [0, 1]);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint0);

    for (var item in defaultStarModel) {
      drawRandomStar(canvas, item, size);
    }
    drawPoint(canvas, size);

    // for (int i = 0; i < 100; i++) {
    //   drawRandomPoint(canvas, size);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawRandomStar(Canvas canvas, StarModel str, Size size) {
    double x = str.position.dx * size.width;
    double y = str.position.dy * size.height;
    double height = str.size;
    double width = height * .51;

    Path path_0 = Path();
    path_0.moveTo(x, y - height / 2);
    path_0.lineTo(x + width * .1334435, y - height * 0.1350450);
    path_0.lineTo(x + width * .5, y);
    path_0.lineTo(x + width * .1334435, y + height * 0.1350450);
    path_0.lineTo(x, y + height / 2);
    path_0.lineTo(x - width * .1334435, y + height * 0.1350450);
    path_0.lineTo(x - width / 2, y);
    path_0.lineTo(x - width * .1334435, y - height * 0.1350450);
    path_0.close();

    Paint paint2 = Paint()
      ..shader = RadialGradient(
        colors: [Colors.white.withOpacity(1), Colors.white.withOpacity(0.35)],
        stops: const [0, .5],
      ).createShader(Rect.fromCircle(center: Offset(x, y), radius: height / 2));

    canvas.drawPath(path_0, paint2);
  }

  void drawRandomPoint(Canvas canvas, Size size) {
    double x = rand(0, size.width);
    double y = rand(0, size.height);
    double radius = rand(1, 2);
    Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    canvas.drawCircle(Offset(x, y), radius, paint2);
  }

  void drawPoint(Canvas canvas, Size size) {
    double x = size.width / 2;
    double y = size.height / 2;
    double radius = 50;
    Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(.4);
    Paint paintShader = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..shader = RadialGradient(
        colors: [
          Colors.red.withOpacity(0.5),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(x + 2, y + 2), radius: radius * 3));
    canvas.drawCircle(Offset(x, y), radius * 3, paintShader);
    // canvas.drawCircle(Offset(x, y), radius, paint2);
  }

  double rand(double min, double max) => math.Random().nextDouble() * (max - min) + min;

  List<StarModel> defaultStarModel = [
    StarModel(position: const Offset(0.1240000, 0.1822660), size: 10),
    StarModel(position: const Offset(0.5253333, 0.0911330), size: 10),
    StarModel(position: const Offset(0.1733333, 0.5061576), size: 10),
    StarModel(position: const Offset(0.8760000, 0.5775862), size: 10),
    StarModel(position: const Offset(0.8946667, 0.1625616), size: 10),
    StarModel(position: const Offset(0.2866667, 0.7167488), size: 10),
    StarModel(position: const Offset(0.6840000, 0.3768473), size: 10),
    StarModel(position: const Offset(0.6920000, 0.6847291), size: 10),
    StarModel(position: const Offset(0.1960000, 0.8608374), size: 10),
    StarModel(position: const Offset(0.8066667, 0.9137931), size: 10),
    StarModel(position: const Offset(0.4093333, 0.2586207), size: 10),
  ];
}

class StarModel {
  late Offset position;
  late double size;
  StarModel({this.position = const Offset(0.0, 0.0), this.size = 10});
}
