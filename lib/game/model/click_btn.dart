import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flutter/material.dart';

class ClickeButton extends PositionComponent with Tappable {
  void Function()? onPressed;
  void Function()? onReleased;
  double btnSize;
  bool isClicked = false;
  bool isPlayed = true;

  ClickeButton({
    this.onPressed,
    this.onReleased,
    super.position,
    required this.btnSize,
  }) : super(
          size: Vector2(btnSize, btnSize),
          anchor: Anchor.center,
        );

  @override
  void update(double dt) {
    super.update(dt);
    if (GameState.type == GameType.playingGame || GameState.type == GameType.overGame) {
      isPlayed = true;
    } else {
      isPlayed = false;
    }
  }

  @override
  bool onTapDown(TapDownInfo info) {
    onPressed?.call();
    isClicked = true;
    return false;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    onTapCancel();

    isClicked = false;
    onReleased?.call();

    return true;
  }

  @override
  bool onTapCancel() {
    isClicked = false;
    return false;
  }

  @override
  void render(Canvas canvas) {
    double scale = isClicked ? .96 : 1.0;
    Offset centerPosition = Offset(btnSize / 2, btnSize / 2);
    Paint paint0 = Paint()..style = PaintingStyle.fill;
    paint0.color = const Color(0xffDD8444).withOpacity(1.0);
    canvas.drawCircle(centerPosition, btnSize * scale * 0.5000000, paint0);
    Paint paint1 = Paint()..style = PaintingStyle.fill;
    paint1.color = const Color(0xffF7B24A).withOpacity(1.0);
    canvas.drawCircle(centerPosition, btnSize * scale * 0.4142860, paint1);
    Paint paint2 = Paint()..style = PaintingStyle.fill;
    paint2.color = const Color(0xff722F2F).withOpacity(1.0);
    Offset startO = Offset((btnSize - (btnSize * scale)) * .5, (btnSize - (btnSize * scale)) * .5);
    canvas.drawPath(
      isPlayed ? switchPath(startO, btnSize, scale) : playPath(startO, btnSize, scale),
      paint2,
    );
  }

  Path switchPath(Offset start, double btnSize, double scale) {
    double x = start.dx, y = start.dy;
    Path path_2 = Path();

    path_2.moveTo(x + btnSize * scale * 0.3025760, y + btnSize * scale * 0.5576560);
    path_2.cubicTo(x + btnSize * scale * 0.2984860, y + btnSize * scale * 0.5615900, x + btnSize * scale * 0.2984860, y + btnSize * scale * 0.5681340, x + btnSize * scale * 0.3025760, y + btnSize * scale * 0.5720680);
    path_2.lineTo(x + btnSize * scale * 0.3670120, y + btnSize * scale * 0.6340720);
    path_2.cubicTo(x + btnSize * scale * 0.3733640, y + btnSize * scale * 0.6401840, x + btnSize * scale * 0.3839460, y + btnSize * scale * 0.6356820, x + btnSize * scale * 0.3839460, y + btnSize * scale * 0.6268660);
    path_2.lineTo(x + btnSize * scale * 0.3839460, y + btnSize * scale * 0.5902500);
    path_2.lineTo(x + btnSize * scale * 0.5293240, y + btnSize * scale * 0.5902500);
    path_2.cubicTo(x + btnSize * scale * 0.5370560, y + btnSize * scale * 0.5902500, x + btnSize * scale * 0.5433240, y + btnSize * scale * 0.5839820, x + btnSize * scale * 0.5433240, y + btnSize * scale * 0.5762500);
    path_2.lineTo(x + btnSize * scale * 0.5433240, y + btnSize * scale * 0.5591160);
    path_2.cubicTo(x + btnSize * scale * 0.5433240, y + btnSize * scale * 0.5513840, x + btnSize * scale * 0.5370560, y + btnSize * scale * 0.5451160, x + btnSize * scale * 0.5293240, y + btnSize * scale * 0.5451160);
    path_2.lineTo(x + btnSize * scale * 0.3839460, y + btnSize * scale * 0.5451160);
    path_2.lineTo(x + btnSize * scale * 0.3839460, y + btnSize * scale * 0.5028580);
    path_2.cubicTo(x + btnSize * scale * 0.3839460, y + btnSize * scale * 0.4940420, x + btnSize * scale * 0.3733640, y + btnSize * scale * 0.4895400, x + btnSize * scale * 0.3670120, y + btnSize * scale * 0.4956520);
    path_2.lineTo(x + btnSize * scale * 0.3025760, y + btnSize * scale * 0.5576560);
    path_2.close();

    path_2.moveTo(x + btnSize * scale * 0.6938060, y + btnSize * scale * 0.4239860);
    path_2.cubicTo(x + btnSize * scale * 0.6978940, y + btnSize * scale * 0.4279200, x + btnSize * scale * 0.6978940, y + btnSize * scale * 0.4344640, x + btnSize * scale * 0.6938060, y + btnSize * scale * 0.4383980);
    path_2.lineTo(x + btnSize * scale * 0.6293700, y + btnSize * scale * 0.5004020);
    path_2.cubicTo(x + btnSize * scale * 0.6230180, y + btnSize * scale * 0.5065160, x + btnSize * scale * 0.6124360, y + btnSize * scale * 0.5020120, x + btnSize * scale * 0.6124360, y + btnSize * scale * 0.4931960);
    path_2.lineTo(x + btnSize * scale * 0.6124360, y + btnSize * scale * 0.4565800);
    path_2.lineTo(x + btnSize * scale * 0.4670580, y + btnSize * scale * 0.4565800);
    path_2.cubicTo(x + btnSize * scale * 0.4593260, y + btnSize * scale * 0.4565800, x + btnSize * scale * 0.4530580, y + btnSize * scale * 0.4503120, x + btnSize * scale * 0.4530580, y + btnSize * scale * 0.4425800);
    path_2.lineTo(x + btnSize * scale * 0.4530580, y + btnSize * scale * 0.4254460);
    path_2.cubicTo(x + btnSize * scale * 0.4530580, y + btnSize * scale * 0.4177140, x + btnSize * scale * 0.4593260, y + btnSize * scale * 0.4114460, x + btnSize * scale * 0.4670580, y + btnSize * scale * 0.4114460);
    path_2.lineTo(x + btnSize * scale * 0.6124360, y + btnSize * scale * 0.4114460);
    path_2.lineTo(x + btnSize * scale * 0.6124360, y + btnSize * scale * 0.3691880);
    path_2.cubicTo(x + btnSize * scale * 0.6124360, y + btnSize * scale * 0.3603720, x + btnSize * scale * 0.6230180, y + btnSize * scale * 0.3558700, x + btnSize * scale * 0.6293700, y + btnSize * scale * 0.3619840);
    path_2.lineTo(x + btnSize * scale * 0.6938060, y + btnSize * scale * 0.4239860);
    path_2.close();

    return path_2;
  }

  Path playPath(Offset start, double btnSize, double scale) {
    double x = start.dx, y = start.dy;
    Path path_2 = Path();

    path_2.moveTo(x + btnSize * scale * 0.6737580, y + btnSize * scale * 0.4831660);
    path_2.cubicTo(x + btnSize * scale * 0.6860260, y + btnSize * scale * 0.4910360, x + btnSize * scale * 0.6860260, y + btnSize * scale * 0.5089640, x + btnSize * scale * 0.6737580, y + btnSize * scale * 0.5168340);
    path_2.lineTo(x + btnSize * scale * 0.4307980, y + btnSize * scale * 0.6726920);
    path_2.cubicTo(x + btnSize * scale * 0.4174880, y + btnSize * scale * 0.6812320, x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.6716740, x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.6558580);
    path_2.lineTo(x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.3441420);
    path_2.cubicTo(x + btnSize * scale * 0.4000000, y + btnSize * scale * 0.3283260, x + btnSize * scale * 0.4174880, y + btnSize * scale * 0.3187680, x + btnSize * scale * 0.4307980, y + btnSize * scale * 0.3273080);
    path_2.lineTo(x + btnSize * scale * 0.6737580, y + btnSize * scale * 0.4831660);
    path_2.close();
    return path_2;
  }
}
