import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/reverse.png',
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
              Container(
                width: 400,
                height: 400,
                child: CustomPaint(
                  painter: ButtonPainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double starSize = size.width;
    double scale = 0.1;
    Offset centerO = Offset(size.width / 2, size.height / 2);

    Paint paint = Paint()..style = PaintingStyle.fill;
    canvas.drawCircle(
      centerO,
      starSize * scale * .5,
      paint..color = const Color(0xffDD8444),
    );
    canvas.drawCircle(
      centerO,
      starSize * 0.4142860 * scale,
      paint..color = const Color(0xffF7B24A),
    );
    Offset startO = Offset((starSize - (starSize * scale)) * .5, (starSize - (starSize * scale)) * .5);

    canvas.drawPath(playPath(startO, starSize, scale), paint..color = const Color(0xff722F2F).withOpacity(0.5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Path switchPath(Offset start, double btnSize, double scale) {
    double x = start.dx, y = start.dy;
    Path path_2 = Path();
    path_2.moveTo(x + btnSize * scale * 0.3025770, y + btnSize * scale * 0.5636560);
    path_2.cubicTo(x + btnSize * scale * 0.2984880, y + btnSize * scale * 0.5675900, x + btnSize * scale * 0.2984880, y + btnSize * scale * 0.5741330, x + btnSize * scale * 0.3025770, y + btnSize * scale * 0.5780670);
    path_2.lineTo(x + btnSize * scale * 0.3670130, y + btnSize * scale * 0.6400710);
    path_2.cubicTo(x + btnSize * scale * 0.3733660, y + btnSize * scale * 0.6461840, x + btnSize * scale * 0.3839470, y + btnSize * scale * 0.6416820, x + btnSize * scale * 0.3839470, y + btnSize * scale * 0.6328650);
    path_2.lineTo(x + btnSize * scale * 0.3839470, y + btnSize * scale * 0.5962500);
    path_2.lineTo(x + btnSize * scale * 0.5207580, y + btnSize * scale * 0.5962500);
    path_2.cubicTo(x + btnSize * scale * 0.5332210, y + btnSize * scale * 0.5962500, x + btnSize * scale * 0.5433250, y + btnSize * scale * 0.5861460, x + btnSize * scale * 0.5433250, y + btnSize * scale * 0.5736830);
    path_2.cubicTo(x + btnSize * scale * 0.5433250, y + btnSize * scale * 0.5612190, x + btnSize * scale * 0.5332210, y + btnSize * scale * 0.5511150, x + btnSize * scale * 0.5207580, y + btnSize * scale * 0.5511150);
    path_2.lineTo(x + btnSize * scale * 0.3839470, y + btnSize * scale * 0.5511150);
    path_2.lineTo(x + btnSize * scale * 0.3839470, y + btnSize * scale * 0.5088580);
    path_2.cubicTo(x + btnSize * scale * 0.3839470, y + btnSize * scale * 0.5000410, x + btnSize * scale * 0.3733660, y + btnSize * scale * 0.4955390, x + btnSize * scale * 0.3670130, y + btnSize * scale * 0.5016520);
    path_2.lineTo(x + btnSize * scale * 0.3025770, y + btnSize * scale * 0.5636560);
    path_2.close();

    path_2.moveTo(x + btnSize * scale * 0.6938050, y + btnSize * scale * 0.4299860);
    path_2.cubicTo(x + btnSize * scale * 0.6978930, y + btnSize * scale * 0.4339200, x + btnSize * scale * 0.6978930, y + btnSize * scale * 0.4404640, x + btnSize * scale * 0.6938050, y + btnSize * scale * 0.4443980);
    path_2.lineTo(x + btnSize * scale * 0.6293690, y + btnSize * scale * 0.5064010);
    path_2.cubicTo(x + btnSize * scale * 0.6230160, y + btnSize * scale * 0.5125150, x + btnSize * scale * 0.6124350, y + btnSize * scale * 0.5080120, x + btnSize * scale * 0.6124350, y + btnSize * scale * 0.4991960);
    path_2.lineTo(x + btnSize * scale * 0.6124350, y + btnSize * scale * 0.4625800);
    path_2.lineTo(x + btnSize * scale * 0.4756240, y + btnSize * scale * 0.4625800);
    path_2.cubicTo(x + btnSize * scale * 0.4631610, y + btnSize * scale * 0.4625800, x + btnSize * scale * 0.4530570, y + btnSize * scale * 0.4524760, x + btnSize * scale * 0.4530570, y + btnSize * scale * 0.4400130);
    path_2.cubicTo(x + btnSize * scale * 0.4530570, y + btnSize * scale * 0.4275490, x + btnSize * scale * 0.4631610, y + btnSize * scale * 0.4174460, x + btnSize * scale * 0.4756240, y + btnSize * scale * 0.4174460);
    path_2.lineTo(x + btnSize * scale * 0.6124350, y + btnSize * scale * 0.4174460);
    path_2.lineTo(x + btnSize * scale * 0.6124350, y + btnSize * scale * 0.3751880);
    path_2.cubicTo(x + btnSize * scale * 0.6124350, y + btnSize * scale * 0.3663720, x + btnSize * scale * 0.6230160, y + btnSize * scale * 0.3618690, x + btnSize * scale * 0.6293690, y + btnSize * scale * 0.3679830);
    path_2.lineTo(x + btnSize * scale * 0.6938050, y + btnSize * scale * 0.4299860);
    path_2.close();

    return path_2;
  }

  Path playPath(Offset start, double btnSize, double scale) {
    double x = start.dx, y = start.dy;
    Path path_2 = Path();
    path_2.moveTo(x + btnSize * scale * 0.6737580, y + btnSize * scale * 0.4831670);
    path_2.cubicTo(x + btnSize * scale * 0.6860260, y + btnSize * scale * 0.4910360, x + btnSize * scale * 0.6860260, y + btnSize * scale * 0.5089650, x + btnSize * scale * 0.6737580, y + btnSize * scale * 0.5168340);
    path_2.lineTo(x + btnSize * scale * 0.4307990, y + btnSize * scale * 0.6726930);
    path_2.cubicTo(x + btnSize * scale * 0.4174880, y + btnSize * scale * 0.6812320, x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.6716740, x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.6558590);
    path_2.lineTo(x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.3441420);
    path_2.cubicTo(x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.3283270, x + btnSize * scale * 0.4174880, y + btnSize * scale * 0.3187690, x + btnSize * scale * 0.4307990, y + btnSize * scale * 0.3273080);
    path_2.lineTo(x + btnSize * scale * 0.6737580, y + btnSize * scale * 0.4831670);
    path_2.close();
    return path_2;
  }
}
