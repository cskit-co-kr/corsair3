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
          child: Container(
            width: 36,
            height: 32,
            child: CustomPaint(
              painter: ButtonPainter(),
            ),
          ),
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

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_0_stroke.shader = ui.Gradient.linear(Offset(size.width * 0.9983667, size.height * 0.4812013), Offset(size.width * 0.3370178, size.height * 0.4878438),
        [Colors.white.withOpacity(1), Color(0xff39E6F1).withOpacity(1), Color(0xff2562FF).withOpacity(1)], [0.0057145, 0.068468, 1]);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width * 0.9856889, size.height * 0.4883244), Offset(size.width * 0.3370267, size.height * 0.4878438),
        [Colors.white.withOpacity(1), Color(0xff39E6F1).withOpacity(1), Color(0xff2562FF).withOpacity(1)], [0.0102039, 0.0677083, 1]);
    canvas.drawPath(path_0, paint_0_fill);

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

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_1_stroke.shader =
        ui.Gradient.linear(Offset(size.width * 0.9223111, size.height * 0.4882950), Offset(size.width * 0.3963000, size.height * 0.4809081), [Color(0xff39E6F1).withOpacity(1), Color(0xff0047FD).withOpacity(1)], [0, 1]);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader =
        ui.Gradient.linear(Offset(size.width * 0.9223111, size.height * 0.4882950), Offset(size.width * 0.3836222, size.height * 0.4880313), [Color(0xff39E6F1).withOpacity(1), Color(0xff2562FF).withOpacity(1)], [0, 1]);
    canvas.drawPath(path_1, paint_1_fill);

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

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_2_stroke.color = Color(0xff39E6F1).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_stroke);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff39E6F1).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

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

    Paint paint_3_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02777778;
    paint_3_stroke.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_stroke);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
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
