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
    for (var item in defaultPointList) {
      drawRandomPoint(canvas, item, size);
    }
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

  void drawRandomPoint(Canvas canvas, PointModel point, Size size) {
    double x = point.position.dx * size.width;
    double y = point.position.dy * size.height;

    Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(.5);
    Paint paintShader = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        colors: [
          point.color.withOpacity(0.5),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(x + 2, y + 2), radius: point.size * 2));
    canvas.drawCircle(Offset(x + size.width, y + size.height), point.size * 2, paintShader);
    canvas.drawCircle(Offset(x, y), point.size, paint2);
  }

  double rand(double min, double max) => math.Random().nextDouble() * (max - min) + min;

  List<StarModel> defaultStarModel = [
    StarModel(position: const Offset(0.1240000, 0.1822660), size: 11),
    StarModel(position: const Offset(0.5253333, 0.0911330), size: 18),
    StarModel(position: const Offset(0.1733333, 0.5061576), size: 18),
    StarModel(position: const Offset(0.8760000, 0.5775862), size: 11),
    StarModel(position: const Offset(0.8946667, 0.1625616), size: 11),
    StarModel(position: const Offset(0.2866667, 0.7167488), size: 11),
    StarModel(position: const Offset(0.6840000, 0.3768473), size: 11),
    StarModel(position: const Offset(0.6920000, 0.6847291), size: 11),
    StarModel(position: const Offset(0.1960000, 0.8608374), size: 19),
    StarModel(position: const Offset(0.8066667, 0.9137931), size: 19),
    StarModel(position: const Offset(0.4093333, 0.2586207), size: 11),
  ];

  List<PointModel> defaultPointList = [
    PointModel(position: const Offset(0.3106667, 0.3035714), size: 375 * 0.004000000, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.2160000, 0.1391626), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.2346667, 0.4199507), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.3920000, 0.1034483), size: 375 * 0.002666667, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.5053333, 0.2038177), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.5706667, 0.3054187), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.09600000, 0.2512315), size: 375 * 0.002666667, color: const Color.fromRGBO(226, 211, 75, 0.25)),
    PointModel(position: const Offset(0.2933333, 0.4519704), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 230, 0, 0.25)),
    PointModel(position: const Offset(0.5653333, 0.4125616), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 230, 0, 0.25)),
    PointModel(position: const Offset(0.2493333, 0.6644089), size: 375 * 0.004000000, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.5186667, 0.4895320), size: 375 * 0.004000000, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.2200000, 0.9242611), size: 375 * 0.004000000, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.6093333, 0.7678571), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.7600000, 0.9802956), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.3360000, 0.9581281), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.07466667, 0.9605911), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.9066667, 0.9568966), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.4000000, 0.8066502), size: 375 * 0.002666667, color: const Color.fromRGBO(250, 255, 0, 0.25)),
    PointModel(position: const Offset(0.8120000, 0.1213054), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.09200000, 0.1447044), size: 375 * 0.004000000, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.3346667, 0.08066502), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.9413333, 0.1194581), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 230, 0, 0.25)),
    PointModel(position: const Offset(0.6693333, 0.06650246), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.07200000, 0.04433498), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.5253333, 0.01970443), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.2266667, 0.01354680), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.8906667, 0.05172414), size: 375 * 0.002666667, color: const Color.fromRGBO(251, 75, 0, 0.25)),
    PointModel(position: const Offset(0.2666667, 0.02463054), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.07600000, 0.3318966), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.2786667, 0.4649015), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.2826667, 0.5172414), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.5066667, 0.5985222), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.8693333, 0.5184729), size: 375 * 0.002666667, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.09333333, 0.5320197), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.2880000, 0.3719212), size: 375 * 0.002666667, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.8826667, 0.4113300), size: 375 * 0.002666667, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.5066667, 0.3891626), size: 375 * 0.002666667, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.8533333, 0.2179803), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.2186667, 0.6391626), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.7906667, 0.6262315), size: 375 * 0.004000000, color: const Color.fromRGBO(250, 255, 0, 0.25)),
    PointModel(position: const Offset(0.4613333, 0.6958128), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.1160000, 0.6976601), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.5320000, 0.6114532), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.7546667, 0.7413793), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.3333333, 0.8041872), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.6826667, 0.8312808), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.1226667, 0.8288177), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.8466667, 0.8146552), size: 375 * 0.004000000, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.9306667, 0.7081281), size: 375 * 0.002666667, color: const Color.fromRGBO(0, 209, 255, 0.25)),
    PointModel(position: const Offset(0.9306667, 0.7290640), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.5120000, 0.8854680), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.8933333, 0.8916256), size: 375 * 0.002666667, color: const Color.fromRGBO(251, 75, 0, 0.25)),
    PointModel(position: const Offset(0.3946667, 0.5197044), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.6933333, 0.5295567), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 230, 0, 0.25)),
    PointModel(position: const Offset(0.7320000, 0.4525862), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.3306667, 0.1773399), size: 375 * 0.002666667, color: const Color.fromRGBO(251, 75, 0, 0.25)),
    PointModel(position: const Offset(0.5400000, 0.1422414), size: 375 * 0.004000000, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.7146667, 0.1798030), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 173, 173, 0.25)),
    PointModel(position: const Offset(0.2293333, 0.2253695), size: 375 * 0.002666667, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.3746667, 0.2998768), size: 375 * 0.001333333, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.9266667, 0.3355911), size: 375 * 0.004000000, color: const Color.fromRGBO(255, 255, 255, 0.25)),
    PointModel(position: const Offset(0.7200000, 0.3399015), size: 375 * 0.002666667, color: const Color.fromRGBO(251, 75, 0, 0.25)),
  ];
}

class StarModel {
  late Offset position;
  late double size;
  StarModel({this.position = const Offset(0.0, 0.0), this.size = 10});
}

class PointModel {
  late Offset position;
  late double size;
  late Color color;
  PointModel({this.position = const Offset(0.0, 0.0), this.size = 10, this.color = Colors.white});
}
