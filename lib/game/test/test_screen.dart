import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: ButtonPainter(),
        ),
      ),
    );
  }
}

class ButtonPainter extends CustomPainter {
  Offset centerPosition = const Offset(100, 150);
  double starSize = 50;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..style = PaintingStyle.fill;
    canvas.drawPath(starPath(Offset(centerPosition.dx, centerPosition.dy + 5), starSize), paint0..color = const Color(0xFF722F2F));
    canvas.drawPath(starPath(centerPosition, starSize), paint0..color = const Color(0xFFF7B24A));

    Paint paint1 = Paint()..style = PaintingStyle.fill;
    paint1.color = Colors.white.withOpacity(0.54);
    canvas.drawPath(ligthPath(centerPosition, starSize), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Path starPath(Offset position, double size) {
    double x = position.dx;
    double y = position.dy;
    Path path_0 = Path();
    path_0.moveTo(x + size * 0.3760820, y + size * 0.1694770);
    path_0.cubicTo(x + size * 0.4010720, y + size * 0.1353000, x + size * 0.4135670, y + size * 0.1182110, x + size * 0.4263820, y + size * 0.1081200);
    path_0.cubicTo(x + size * 0.4695700, y + size * 0.07411390, x + size * 0.5304300, y + size * 0.07411390, x + size * 0.5736180, y + size * 0.1081200);
    path_0.cubicTo(x + size * 0.5864330, y + size * 0.1182110, x + size * 0.5989280, y + size * 0.1353000, x + size * 0.6239180, y + size * 0.1694770);
    path_0.lineTo(x + size * 0.6530770, y + size * 0.2093560);
    path_0.cubicTo(x + size * 0.6595570, y + size * 0.2182190, x + size * 0.6627980, y + size * 0.2226510, x + size * 0.6663460, y + size * 0.2266840);
    path_0.cubicTo(x + size * 0.6779700, y + size * 0.2398950, x + size * 0.6923790, y + size * 0.2503640, x + size * 0.7085350, y + size * 0.2573360);
    path_0.cubicTo(x + size * 0.7134680, y + size * 0.2594650, x + size * 0.7186840, y + size * 0.2611770, x + size * 0.7291160, y + size * 0.2646010);
    path_0.lineTo(x + size * 0.7760530, y + size * 0.2800090);
    path_0.cubicTo(x + size * 0.8162800, y + size * 0.2932150, x + size * 0.8363940, y + size * 0.2998180, x + size * 0.8499510, y + size * 0.3088880);
    path_0.cubicTo(x + size * 0.8956380, y + size * 0.3394530, x + size * 0.9144450, y + size * 0.3973350, x + size * 0.8954490, y + size * 0.4489170);
    path_0.cubicTo(x + size * 0.8898120, y + size * 0.4642240, x + size * 0.8774210, y + size * 0.4813880, x + size * 0.8526390, y + size * 0.5157160);
    path_0.lineTo(x + size * 0.8237220, y + size * 0.5557700);
    path_0.cubicTo(x + size * 0.8172960, y + size * 0.5646730, x + size * 0.8140820, y + size * 0.5691240, x + size * 0.8113430, y + size * 0.5737450);
    path_0.cubicTo(x + size * 0.8023700, y + size * 0.5888830, x + size * 0.7968670, y + size * 0.6058210, x + size * 0.7952280, y + size * 0.6233410);
    path_0.cubicTo(x + size * 0.7947280, y + size * 0.6286900, x + size * 0.7947110, y + size * 0.6341800, x + size * 0.7946780, y + size * 0.6451600);
    path_0.lineTo(x + size * 0.7945280, y + size * 0.6945610);
    path_0.cubicTo(x + size * 0.7944000, y + size * 0.7369000, x + size * 0.7943360, y + size * 0.7580700, x + size * 0.7898990, y + size * 0.7737660);
    path_0.cubicTo(x + size * 0.7749480, y + size * 0.8266630, x + size * 0.7257110, y + size * 0.8624350, x + size * 0.6707830, y + size * 0.8603090);
    path_0.cubicTo(x + size * 0.6544840, y + size * 0.8596780, x + size * 0.6343310, y + size * 0.8531970, x + size * 0.5940240, y + size * 0.8402360);
    path_0.lineTo(x + size * 0.5469950, y + size * 0.8251120);
    path_0.cubicTo(x + size * 0.5365420, y + size * 0.8217510, x + size * 0.5313160, y + size * 0.8200700, x + size * 0.5260740, y + size * 0.8188930);
    path_0.cubicTo(x + size * 0.5089050, y + size * 0.8150380, x + size * 0.4910950, y + size * 0.8150380, x + size * 0.4739260, y + size * 0.8188930);
    path_0.cubicTo(x + size * 0.4686840, y + size * 0.8200700, x + size * 0.4634580, y + size * 0.8217510, x + size * 0.4530050, y + size * 0.8251120);
    path_0.lineTo(x + size * 0.4059760, y + size * 0.8402360);
    path_0.cubicTo(x + size * 0.3656690, y + size * 0.8531970, x + size * 0.3455160, y + size * 0.8596780, x + size * 0.3292170, y + size * 0.8603090);
    path_0.cubicTo(x + size * 0.2742890, y + size * 0.8624350, x + size * 0.2250520, y + size * 0.8266630, x + size * 0.2101010, y + size * 0.7737660);
    path_0.cubicTo(x + size * 0.2056640, y + size * 0.7580700, x + size * 0.2056000, y + size * 0.7369000, x + size * 0.2054720, y + size * 0.6945610);
    path_0.lineTo(x + size * 0.2053220, y + size * 0.6451600);
    path_0.cubicTo(x + size * 0.2052890, y + size * 0.6341800, x + size * 0.2052720, y + size * 0.6286900, x + size * 0.2047720, y + size * 0.6233410);
    path_0.cubicTo(x + size * 0.2031330, y + size * 0.6058210, x + size * 0.1976300, y + size * 0.5888830, x + size * 0.1886570, y + size * 0.5737450);
    path_0.cubicTo(x + size * 0.1859180, y + size * 0.5691240, x + size * 0.1827040, y + size * 0.5646730, x + size * 0.1762780, y + size * 0.5557710);
    path_0.lineTo(x + size * 0.1473610, y + size * 0.5157160);
    path_0.cubicTo(x + size * 0.1225790, y + size * 0.4813880, x + size * 0.1101880, y + size * 0.4642240, x + size * 0.1045510, y + size * 0.4489170);
    path_0.cubicTo(x + size * 0.08555490, y + size * 0.3973350, x + size * 0.1043620, y + size * 0.3394530, x + size * 0.1500490, y + size * 0.3088880);
    path_0.cubicTo(x + size * 0.1636060, y + size * 0.2998180, x + size * 0.1837200, y + size * 0.2932150, x + size * 0.2239470, y + size * 0.2800090);
    path_0.lineTo(x + size * 0.2708840, y + size * 0.2646010);
    path_0.cubicTo(x + size * 0.2813160, y + size * 0.2611770, x + size * 0.2865320, y + size * 0.2594650, x + size * 0.2914650, y + size * 0.2573360);
    path_0.cubicTo(x + size * 0.3076210, y + size * 0.2503640, x + size * 0.3220300, y + size * 0.2398950, x + size * 0.3336540, y + size * 0.2266840);
    path_0.cubicTo(x + size * 0.3372020, y + size * 0.2226510, x + size * 0.3404430, y + size * 0.2182190, x + size * 0.3469230, y + size * 0.2093560);
    path_0.lineTo(x + size * 0.3760820, y + size * 0.1694770);
    path_0.close();
    return path_0;
  }

  Path ligthPath(Offset position, double size) {
    double x = position.dx;
    double y = position.dy;

    Path path = Path();
    path.moveTo(x + size * 0.8378070, y + size * 0.4054930);
    path.cubicTo(x + size * 0.8333740, y + size * 0.4146020, x + size * 0.8027470, y + size * 0.3876650, x + size * 0.7801770, y + size * 0.3764330);
    path.cubicTo(x + size * 0.7497420, y + size * 0.3612860, x + size * 0.6972360, y + size * 0.3487760, x + size * 0.7019490, y + size * 0.3381940);
    path.cubicTo(x + size * 0.7066620, y + size * 0.3276110, x + size * 0.7430180, y + size * 0.3392280, x + size * 0.7904590, y + size * 0.3517460);
    path.cubicTo(x + size * 0.8379000, y + size * 0.3642640, x + size * 0.8422400, y + size * 0.3963840, x + size * 0.8378070, y + size * 0.4054930);
    path.close();

    path.moveTo(x + size * 0.2962310, y + size * 0.7621780);
    path.cubicTo(x + size * 0.2897610, y + size * 0.7531810, x + size * 0.3242630, y + size * 0.7464930, x + size * 0.3377050, y + size * 0.7397300);
    path.cubicTo(x + size * 0.3558320, y + size * 0.7306100, x + size * 0.3692950, y + size * 0.7110810, x + size * 0.3768960, y + size * 0.7212550);
    path.cubicTo(x + size * 0.3844980, y + size * 0.7314290, x + size * 0.3788320, y + size * 0.7543130, x + size * 0.3487330, y + size * 0.7684460);
    path.cubicTo(x + size * 0.3186340, y + size * 0.7825800, x + size * 0.3027010, y + size * 0.7711750, x + size * 0.2962310, y + size * 0.7621780);
    path.close();
    return path;
  }
}
