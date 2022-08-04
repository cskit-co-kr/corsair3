import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame_game/api/webapi.dart';
import 'package:flame_game/game/model/bullet.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flutter/material.dart';
import '../corsair_game.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flame_game/game/util/utils.dart';

class Ship extends PositionComponent with CollisionCallbacks, HasGameRef<CorsairGame> {
  // double shipSize;
  bool isReverse = false;
  Function setStates;
  Function nextlevel;
  int coinCount = 0;
  double gradus = 0;
  Size shipSize;

  Ship({
    this.shipSize = const Size(100, 100),
    required this.setStates,
    required this.nextlevel,
    double? gradusa,
    Vector2? position,
  }) : super(position: position, anchor: Anchor.center) {
    coinCount = GameState.coinCount;
    gradus = gradusa ?? 0;
  }
  @override
  void onMount() async {
    super.onMount();

    position = Utils.getPosition(gameRef.centerPosition, gradus, gameRef.mainDistanse);

    final shape = CircleHitbox.relative(
      1.0,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );

    add(shape);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (GameState.type == GameType.playingGame) {
      var add = (dt * GameState.shipSpeed);

      if (isReverse) {
        gradus += add;
      } else {
        gradus -= add;
      }
      position = Utils.getPosition(gameRef.centerPosition, gradus, gameRef.mainDistanse);

      angle = isReverse ? -Utils.getRadian(gradus) : math.pi - Utils.getRadian(gradus);
    }
    if (coinCount < 2) {
      nextlevel();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      // pool.start();
      gameRef.dest.start();
      gameRef.camera.shake(intensity: 1);

      destroy();

      if (GameState.userMaxScore < GameState.score) {
        GameState.userMaxScore = GameState.score;
      }
    }
  }

  void destroy() async {
    List<Sprite> aaa = [];
    SpriteSheet ss = SpriteSheet.fromColumnsAndRows(image: gameRef.images.fromCache('destroy8.png'), columns: 7, rows: 1);
    for (int i = 0; i < 7; i++) {
      aaa.add(ss.getSpriteById(i));
    }
    SpriteAnimation a = SpriteAnimation.spriteList(aaa, stepTime: 0.1, loop: false);
    SpriteAnimationComponent sac = SpriteAnimationComponent(
      animation: a,
      position: position - (Vector2(100, 100) / 2),
      size: Vector2(100, 100),
    );

    removeFromParent();
    gameRef.add(sac);
    GameState.type = GameType.overGame;
    GameState.bulletSpeed = 200;
    GameState.bulletFrac = .4;
    try {
      await setScoreData(GameState.name, GameState.score);
    } catch (e) {}
    await Future.delayed(const Duration(seconds: 2), () {
      setStates();
    });
  }

  @override
  void render(Canvas canvas) {
    Offset center = const Offset(0.0, 0.0);
    Path path0 = Path();
    path0.moveTo(shipSize.width * 0.2471257, shipSize.height * 0.6181208);
    path0.lineTo(shipSize.width * 0.2471257, shipSize.height * 0.3851994);
    path0.cubicTo(shipSize.width * 0.2471257, shipSize.height * 0.3851994, shipSize.width * 0.2071657, shipSize.height * 0.3806254, shipSize.width * 0.1819244, shipSize.height * 0.3837462);
    path0.cubicTo(shipSize.width * 0.1608726, shipSize.height * 0.3863474, shipSize.width * 0.1489208, shipSize.height * 0.3890816, shipSize.width * 0.1294455, shipSize.height * 0.3968459);
    path0.cubicTo(shipSize.width * 0.1136254, shipSize.height * 0.4031541, shipSize.width * 0.1054010, shipSize.height * 0.4081511, shipSize.width * 0.09127888, shipSize.height * 0.4172266);
    path0.cubicTo(shipSize.width * 0.08222937, shipSize.height * 0.4230423, shipSize.width * 0.06901485, shipSize.height * 0.4332417, shipSize.width * 0.06901485, shipSize.height * 0.4332417);
    path0.lineTo(shipSize.width * 0.08491782, shipSize.height * 0.4477976);
    path0.cubicTo(shipSize.width * 0.08491782, shipSize.height * 0.4477976, shipSize.width * 0.05435974, shipSize.height * 0.4617885, shipSize.width * 0.03720957, shipSize.height * 0.4740000);
    path0.cubicTo(shipSize.width * 0.02299353, shipSize.height * 0.4841239, shipSize.width * 0.003813795, shipSize.height * 0.5031148, shipSize.width * 0.003813795, shipSize.height * 0.5031148);
    path0.cubicTo(shipSize.width * 0.003813795, shipSize.height * 0.5031148, shipSize.width * 0.02318950, shipSize.height * 0.5210544, shipSize.width * 0.03720957, shipSize.height * 0.5307764);
    path0.cubicTo(shipSize.width * 0.05452970, shipSize.height * 0.5427855, shipSize.width * 0.08491782, shipSize.height * 0.5569789, shipSize.width * 0.08491782, shipSize.height * 0.5569789);
    path0.lineTo(shipSize.width * 0.06901485, shipSize.height * 0.5700816);
    path0.cubicTo(shipSize.width * 0.06901485, shipSize.height * 0.5700816, shipSize.width * 0.08189604, shipSize.height * 0.5823565, shipSize.width * 0.09127888, shipSize.height * 0.5890060);
    path0.cubicTo(shipSize.width * 0.1049244, shipSize.height * 0.5986737, shipSize.width * 0.1135356, shipSize.height * 0.6032689, shipSize.width * 0.1294455, shipSize.height * 0.6093867);
    path0.cubicTo(shipSize.width * 0.1488888, shipSize.height * 0.6168610, shipSize.width * 0.1609597, shipSize.height * 0.6189486, shipSize.width * 0.1819244, shipSize.height * 0.6210332);
    path0.cubicTo(shipSize.width * 0.2072683, shipSize.height * 0.6235529, shipSize.width * 0.2471257, shipSize.height * 0.6181208, shipSize.width * 0.2471257, shipSize.height * 0.6181208);
    path0.close();

    Paint paint0stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint0stroke.color = const Color(0xffFF201B).withOpacity(1.0);
    canvas.drawPath(path0, paint0stroke);

    Paint paint0fill = Paint()..style = PaintingStyle.fill;
    paint0fill.color = const Color(0xffFF201B).withOpacity(1.0);
    canvas.drawPath(path0, paint0fill);

    Path path1 = Path();
    path1.moveTo(shipSize.width * 0.2455353, shipSize.height * 0.5906254);
    path1.lineTo(shipSize.width * 0.2455353, shipSize.height * 0.4119003);
    path1.cubicTo(shipSize.width * 0.2455353, shipSize.height * 0.4119003, shipSize.width * 0.2147165, shipSize.height * 0.4083897, shipSize.width * 0.1952495, shipSize.height * 0.4107825);
    path1.cubicTo(shipSize.width * 0.1790132, shipSize.height * 0.4127795, shipSize.width * 0.1697957, shipSize.height * 0.4148792, shipSize.width * 0.1547756, shipSize.height * 0.4208369);
    path1.cubicTo(shipSize.width * 0.1425746, shipSize.height * 0.4256767, shipSize.width * 0.1362314, shipSize.height * 0.4295106, shipSize.width * 0.1253399, shipSize.height * 0.4364743);
    path1.cubicTo(shipSize.width * 0.1183604, shipSize.height * 0.4409396, shipSize.width * 0.1081690, shipSize.height * 0.4487644, shipSize.width * 0.1081690, shipSize.height * 0.4487644);
    path1.lineTo(shipSize.width * 0.1204340, shipSize.height * 0.4599335);
    path1.cubicTo(shipSize.width * 0.1204340, shipSize.height * 0.4599335, shipSize.width * 0.09686634, shipSize.height * 0.4706707, shipSize.width * 0.08363927, shipSize.height * 0.4800393);
    path1.cubicTo(shipSize.width * 0.07267525, shipSize.height * 0.4878066, shipSize.width * 0.05788317, shipSize.height * 0.5023807, shipSize.width * 0.05788317, shipSize.height * 0.5023807);
    path1.cubicTo(shipSize.width * 0.05788317, shipSize.height * 0.5023807, shipSize.width * 0.07282640, shipSize.height * 0.5161450, shipSize.width * 0.08363927, shipSize.height * 0.5236042);
    path1.cubicTo(shipSize.width * 0.09699736, shipSize.height * 0.5328187, shipSize.width * 0.1204340, shipSize.height * 0.5437100, shipSize.width * 0.1204340, shipSize.height * 0.5437100);
    path1.lineTo(shipSize.width * 0.1081690, shipSize.height * 0.5537644);
    path1.cubicTo(shipSize.width * 0.1081690, shipSize.height * 0.5537644, shipSize.width * 0.1181036, shipSize.height * 0.5631843, shipSize.width * 0.1253399, shipSize.height * 0.5682870);
    path1.cubicTo(shipSize.width * 0.1358637, shipSize.height * 0.5757039, shipSize.width * 0.1425053, shipSize.height * 0.5792326, shipSize.width * 0.1547756, shipSize.height * 0.5839245);
    path1.cubicTo(shipSize.width * 0.1697710, shipSize.height * 0.5896586, shipSize.width * 0.1790805, shipSize.height * 0.5912598, shipSize.width * 0.1952495, shipSize.height * 0.5928610);
    path1.cubicTo(shipSize.width * 0.2147957, shipSize.height * 0.5947946, shipSize.width * 0.2455353, shipSize.height * 0.5906254, shipSize.width * 0.2455353, shipSize.height * 0.5906254);
    path1.close();

    Paint paint1stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint1stroke.color = const Color(0xffF1B31F).withOpacity(1.0);
    canvas.drawPath(path1, paint1stroke);

    Paint paint1fill = Paint()..style = PaintingStyle.fill;
    paint1fill.color = const Color(0xffF1B31F).withOpacity(1.0);
    canvas.drawPath(path1, paint1fill);

    Path path2 = Path();
    path2.moveTo(shipSize.width * 0.2455353, shipSize.height * 0.5651631);
    path2.lineTo(shipSize.width * 0.2455353, shipSize.height * 0.4346647);
    path2.cubicTo(shipSize.width * 0.2455353, shipSize.height * 0.4346647, shipSize.width * 0.2293426, shipSize.height * 0.4321027, shipSize.width * 0.2191139, shipSize.height * 0.4338489);
    path2.cubicTo(shipSize.width * 0.2105832, shipSize.height * 0.4353082, shipSize.width * 0.2057399, shipSize.height * 0.4368399, shipSize.width * 0.1978479, shipSize.height * 0.4411903);
    path2.cubicTo(shipSize.width * 0.1914373, shipSize.height * 0.4447251, shipSize.width * 0.1881046, shipSize.height * 0.4475227, shipSize.width * 0.1823818, shipSize.height * 0.4526103);
    path2.cubicTo(shipSize.width * 0.1787145, shipSize.height * 0.4558671, shipSize.width * 0.1733597, shipSize.height * 0.4615801, shipSize.width * 0.1733597, shipSize.height * 0.4615801);
    path2.lineTo(shipSize.width * 0.1798040, shipSize.height * 0.4697372);
    path2.cubicTo(shipSize.width * 0.1798040, shipSize.height * 0.4697372, shipSize.width * 0.1674211, shipSize.height * 0.4775770, shipSize.width * 0.1604713, shipSize.height * 0.4844169);
    path2.cubicTo(shipSize.width * 0.1547106, shipSize.height * 0.4900906, shipSize.width * 0.1469383, shipSize.height * 0.5007311, shipSize.width * 0.1469383, shipSize.height * 0.5007311);
    path2.cubicTo(shipSize.width * 0.1469383, shipSize.height * 0.5007311, shipSize.width * 0.1547901, shipSize.height * 0.5107825, shipSize.width * 0.1604713, shipSize.height * 0.5162266);
    path2.cubicTo(shipSize.width * 0.1674901, shipSize.height * 0.5229547, shipSize.width * 0.1798040, shipSize.height * 0.5309094, shipSize.width * 0.1798040, shipSize.height * 0.5309094);
    path2.lineTo(shipSize.width * 0.1733597, shipSize.height * 0.5382477);
    path2.cubicTo(shipSize.width * 0.1733597, shipSize.height * 0.5382477, shipSize.width * 0.1785795, shipSize.height * 0.5451269, shipSize.width * 0.1823818, shipSize.height * 0.5488520);
    path2.cubicTo(shipSize.width * 0.1879112, shipSize.height * 0.5542689, shipSize.width * 0.1914010, shipSize.height * 0.5568429, shipSize.width * 0.1978479, shipSize.height * 0.5602719);
    path2.cubicTo(shipSize.width * 0.2057271, shipSize.height * 0.5644592, shipSize.width * 0.2106185, shipSize.height * 0.5656284, shipSize.width * 0.2191139, shipSize.height * 0.5667946);
    path2.cubicTo(shipSize.width * 0.2293842, shipSize.height * 0.5682085, shipSize.width * 0.2455353, shipSize.height * 0.5651631, shipSize.width * 0.2455353, shipSize.height * 0.5651631);
    path2.close();

    Paint paint2stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint2stroke.color = const Color(0xffFCE263).withOpacity(1.0);
    canvas.drawPath(path2, paint2stroke);

    Paint paint2fill = Paint()..style = PaintingStyle.fill;
    paint2fill.color = const Color(0xffFCE263).withOpacity(1.0);
    canvas.drawPath(path2, paint2fill);

    Path path3 = Path();
    path3.moveTo(shipSize.width * 0.1295653, shipSize.height * 0.1599266);
    path3.cubicTo(shipSize.width * 0.1417917, shipSize.height * 0.1592221, shipSize.width * 0.1677317, shipSize.height * 0.1670039, shipSize.width * 0.1677317, shipSize.height * 0.1670039);
    path3.lineTo(shipSize.width * 0.1677317, shipSize.height * 0.2490269);
    path3.cubicTo(shipSize.width * 0.1677317, shipSize.height * 0.2490269, shipSize.width * 0.1451620, shipSize.height * 0.2545505, shipSize.width * 0.1326234, shipSize.height * 0.2545505);
    path3.cubicTo(shipSize.width * 0.1172512, shipSize.height * 0.2545505, shipSize.width * 0.1027752, shipSize.height * 0.2525060, shipSize.width * 0.09775974, shipSize.height * 0.2516390);
    path3.cubicTo(shipSize.width * 0.09274422, shipSize.height * 0.2507719, shipSize.width * 0.07494554, shipSize.height * 0.2446592, shipSize.width * 0.07243762, shipSize.height * 0.2324447);
    path3.cubicTo(shipSize.width * 0.06993003, shipSize.height * 0.2202299, shipSize.width * 0.03891947, shipSize.height * 0.2125230, shipSize.width * 0.03891947, shipSize.height * 0.2079665);
    path3.cubicTo(shipSize.width * 0.03891947, shipSize.height * 0.2034097, shipSize.width * 0.06742211, shipSize.height * 0.1940559, shipSize.width * 0.07243762, shipSize.height * 0.1800967);
    path3.cubicTo(shipSize.width * 0.07553465, shipSize.height * 0.1714770, shipSize.width * 0.08931914, shipSize.height * 0.1654701, shipSize.width * 0.09935017, shipSize.height * 0.1628381);
    path3.cubicTo(shipSize.width * 0.1114026, shipSize.height * 0.1596755, shipSize.width * 0.1145188, shipSize.height * 0.1607937, shipSize.width * 0.1295653, shipSize.height * 0.1599266);
    path3.close();

    Paint paint3stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint3stroke.color = const Color(0xffFF201B).withOpacity(1.0);
    canvas.drawPath(path3, paint3stroke);

    Paint paint3fill = Paint()..style = PaintingStyle.fill;
    paint3fill.color = const Color(0xffFF201B).withOpacity(1.0);
    canvas.drawPath(path3, paint3fill);

    Path path4 = Path();
    path4.moveTo(shipSize.width * 0.1232040, shipSize.height * 0.1715725);
    path4.cubicTo(shipSize.width * 0.1309574, shipSize.height * 0.1709849, shipSize.width * 0.1454680, shipSize.height * 0.1737517, shipSize.width * 0.1454680, shipSize.height * 0.1737517);
    path4.lineTo(shipSize.width * 0.1454680, shipSize.height * 0.2421810);
    path4.cubicTo(shipSize.width * 0.1454680, shipSize.height * 0.2421810, shipSize.width * 0.1311554, shipSize.height * 0.2443601, shipSize.width * 0.1232040, shipSize.height * 0.2443601);
    path4.cubicTo(shipSize.width * 0.1134558, shipSize.height * 0.2443601, shipSize.width * 0.1057112, shipSize.height * 0.2429042, shipSize.width * 0.1025307, shipSize.height * 0.2421810);
    path4.cubicTo(shipSize.width * 0.09935017, shipSize.height * 0.2414577, shipSize.width * 0.08662772, shipSize.height * 0.2385372, shipSize.width * 0.08503762, shipSize.height * 0.2283468);
    path4.cubicTo(shipSize.width * 0.08344719, shipSize.height * 0.2181565, shipSize.width * 0.06277360, shipSize.height * 0.2132236, shipSize.width * 0.06277360, shipSize.height * 0.2094221);
    path4.cubicTo(shipSize.width * 0.06277360, shipSize.height * 0.2056205, shipSize.width * 0.08185710, shipSize.height * 0.1963202, shipSize.width * 0.08503762, shipSize.height * 0.1846743);
    path4.cubicTo(shipSize.width * 0.08700132, shipSize.height * 0.1774834, shipSize.width * 0.09616931, shipSize.height * 0.1766801, shipSize.width * 0.1025307, shipSize.height * 0.1744840);
    path4.cubicTo(shipSize.width * 0.1101736, shipSize.height * 0.1718456, shipSize.width * 0.1136624, shipSize.height * 0.1722961, shipSize.width * 0.1232040, shipSize.height * 0.1715725);
    path4.close();

    Paint paint4stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint4stroke.color = const Color(0xffF1B31F).withOpacity(1.0);
    canvas.drawPath(path4, paint4stroke);

    Paint paint4fill = Paint()..style = PaintingStyle.fill;
    paint4fill.color = const Color(0xffF1B31F).withOpacity(1.0);
    canvas.drawPath(path4, paint4fill);

    Path path5 = Path();
    path5.moveTo(shipSize.width * 0.1295653, shipSize.height * 0.1817628);
    path5.cubicTo(shipSize.width * 0.1356244, shipSize.height * 0.1805163, shipSize.width * 0.1454680, shipSize.height * 0.1817628, shipSize.width * 0.1454680, shipSize.height * 0.1817628);
    path5.lineTo(shipSize.width * 0.1454680, shipSize.height * 0.2341698);
    path5.cubicTo(shipSize.width * 0.1454680, shipSize.height * 0.2341698, shipSize.width * 0.1356244, shipSize.height * 0.2354160, shipSize.width * 0.1295653, shipSize.height * 0.2341698);
    path5.cubicTo(shipSize.width * 0.1219729, shipSize.height * 0.2326079, shipSize.width * 0.1152528, shipSize.height * 0.2283465, shipSize.width * 0.1136624, shipSize.height * 0.2254350);
    path5.cubicTo(shipSize.width * 0.1120723, shipSize.height * 0.2225236, shipSize.width * 0.1120723, shipSize.height * 0.2218861, shipSize.width * 0.1120723, shipSize.height * 0.2196121);
    path5.cubicTo(shipSize.width * 0.1120723, shipSize.height * 0.2173381, shipSize.width * 0.09457921, shipSize.height * 0.2108776, shipSize.width * 0.09457921, shipSize.height * 0.2079662);
    path5.cubicTo(shipSize.width * 0.09457921, shipSize.height * 0.2050547, shipSize.width * 0.1104818, shipSize.height * 0.1992317, shipSize.width * 0.1120723, shipSize.height * 0.1963202);
    path5.cubicTo(shipSize.width * 0.1136624, shipSize.height * 0.1934088, shipSize.width * 0.1126023, shipSize.height * 0.1904970, shipSize.width * 0.1136624, shipSize.height * 0.1890414);
    path5.cubicTo(shipSize.width * 0.1147224, shipSize.height * 0.1875858, shipSize.width * 0.1219729, shipSize.height * 0.1833245, shipSize.width * 0.1295653, shipSize.height * 0.1817628);
    path5.close();

    Paint paint5stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint5stroke.color = const Color(0xffFCE263).withOpacity(1.0);
    canvas.drawPath(path5, paint5stroke);

    Paint paint5fill = Paint()..style = PaintingStyle.fill;
    paint5fill.color = const Color(0xffFCE263).withOpacity(1.0);
    canvas.drawPath(path5, paint5fill);

    Path path6 = Path();
    path6.moveTo(shipSize.width * 0.2440650, shipSize.height * 0.1468248);
    path6.lineTo(shipSize.width * 0.2440650, shipSize.height * 0.2691076);
    path6.lineTo(shipSize.width * 0.2186205, shipSize.height * 0.2632846);
    path6.lineTo(shipSize.width * 0.2186205, shipSize.height * 0.1526477);
    path6.lineTo(shipSize.width * 0.2440650, shipSize.height * 0.1468248);
    path6.close();

    Paint paint6fill = Paint()..style = PaintingStyle.fill;
    paint6fill.color = const Color(0xff39537C).withOpacity(1.0);
    canvas.drawPath(path6, paint6fill);

    Path path7 = Path();
    path7.moveTo(shipSize.width * 0.1454680, shipSize.height * 0.1730281);
    path7.lineTo(shipSize.width * 0.1454680, shipSize.height * 0.2429039);
    path7.lineTo(shipSize.width * 0.2186205, shipSize.height * 0.2632846);
    path7.lineTo(shipSize.width * 0.2186205, shipSize.height * 0.1526477);
    path7.lineTo(shipSize.width * 0.1454680, shipSize.height * 0.1730281);
    path7.close();

    Paint paint7fill = Paint()..style = PaintingStyle.fill;
    paint7fill.color = const Color(0xff6388BB).withOpacity(1.0);
    canvas.drawPath(path7, paint7fill);

    Path path8 = Path();
    path8.moveTo(shipSize.width * 0.1294452, shipSize.height * 0.7480483);
    path8.cubicTo(shipSize.width * 0.1416719, shipSize.height * 0.7473444, shipSize.width * 0.1676119, shipSize.height * 0.7551269, shipSize.width * 0.1676119, shipSize.height * 0.7551269);
    path8.lineTo(shipSize.width * 0.1676119, shipSize.height * 0.8371480);
    path8.cubicTo(shipSize.width * 0.1676119, shipSize.height * 0.8371480, shipSize.width * 0.1450422, shipSize.height * 0.8426737, shipSize.width * 0.1325036, shipSize.height * 0.8426737);
    path8.cubicTo(shipSize.width * 0.1171314, shipSize.height * 0.8426737, shipSize.width * 0.1026554, shipSize.height * 0.8406284, shipSize.width * 0.09763993, shipSize.height * 0.8397613);
    path8.cubicTo(shipSize.width * 0.09262442, shipSize.height * 0.8388943, shipSize.width * 0.07482541, shipSize.height * 0.8327825, shipSize.width * 0.07231782, shipSize.height * 0.8205680);
    path8.cubicTo(shipSize.width * 0.06981023, shipSize.height * 0.8083535, shipSize.width * 0.03879967, shipSize.height * 0.8006465, shipSize.width * 0.03879967, shipSize.height * 0.7960876);
    path8.cubicTo(shipSize.width * 0.03879967, shipSize.height * 0.7915317, shipSize.width * 0.06730231, shipSize.height * 0.7821782, shipSize.width * 0.07231782, shipSize.height * 0.7682175);
    path8.cubicTo(shipSize.width * 0.07541485, shipSize.height * 0.7595982, shipSize.width * 0.08919934, shipSize.height * 0.7535921, shipSize.width * 0.09923003, shipSize.height * 0.7509607);
    path8.cubicTo(shipSize.width * 0.1112828, shipSize.height * 0.7477976, shipSize.width * 0.1143990, shipSize.height * 0.7489154, shipSize.width * 0.1294452, shipSize.height * 0.7480483);
    path8.close();

    Paint paint8stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint8stroke.color = const Color(0xffFF201B).withOpacity(1.0);
    canvas.drawPath(path8, paint8stroke);

    Paint paint8fill = Paint()..style = PaintingStyle.fill;
    paint8fill.color = const Color(0xffFF201B).withOpacity(1.0);
    canvas.drawPath(path8, paint8fill);

    Path path9 = Path();
    path9.moveTo(shipSize.width * 0.1230842, shipSize.height * 0.7596949);
    path9.cubicTo(shipSize.width * 0.1308376, shipSize.height * 0.7591088, shipSize.width * 0.1453482, shipSize.height * 0.7618731, shipSize.width * 0.1453482, shipSize.height * 0.7618731);
    path9.lineTo(shipSize.width * 0.1453482, shipSize.height * 0.8303021);
    path9.cubicTo(shipSize.width * 0.1453482, shipSize.height * 0.8303021, shipSize.width * 0.1310356, shipSize.height * 0.8324834, shipSize.width * 0.1230842, shipSize.height * 0.8324834);
    path9.cubicTo(shipSize.width * 0.1133360, shipSize.height * 0.8324834, shipSize.width * 0.1055911, shipSize.height * 0.8310272, shipSize.width * 0.1024106, shipSize.height * 0.8303021);
    path9.cubicTo(shipSize.width * 0.09923003, shipSize.height * 0.8295801, shipSize.width * 0.08650792, shipSize.height * 0.8266586, shipSize.width * 0.08491782, shipSize.height * 0.8164683);
    path9.cubicTo(shipSize.width * 0.08332739, shipSize.height * 0.8062779, shipSize.width * 0.06265380, shipSize.height * 0.8013474, shipSize.width * 0.06265380, shipSize.height * 0.7975438);
    path9.cubicTo(shipSize.width * 0.06265380, shipSize.height * 0.7937432, shipSize.width * 0.08173729, shipSize.height * 0.7844441, shipSize.width * 0.08491782, shipSize.height * 0.7727976);
    path9.cubicTo(shipSize.width * 0.08688152, shipSize.height * 0.7656042, shipSize.width * 0.09604950, shipSize.height * 0.7648036, shipSize.width * 0.1024106, shipSize.height * 0.7626073);
    path9.cubicTo(shipSize.width * 0.1100538, shipSize.height * 0.7599668, shipSize.width * 0.1135426, shipSize.height * 0.7604169, shipSize.width * 0.1230842, shipSize.height * 0.7596949);
    path9.close();

    Paint paint9stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint9stroke.color = const Color(0xffF1B31F).withOpacity(1.0);
    canvas.drawPath(path9, paint9stroke);

    Paint paint9fill = Paint()..style = PaintingStyle.fill;
    paint9fill.color = const Color(0xffF1B31F).withOpacity(1.0);
    canvas.drawPath(path9, paint9fill);

    Path path10 = Path();
    path10.moveTo(shipSize.width * 0.1294452, shipSize.height * 0.7698852);
    path10.cubicTo(shipSize.width * 0.1355046, shipSize.height * 0.7686375, shipSize.width * 0.1453482, shipSize.height * 0.7698852, shipSize.width * 0.1453482, shipSize.height * 0.7698852);
    path10.lineTo(shipSize.width * 0.1453482, shipSize.height * 0.8222931);
    path10.cubicTo(shipSize.width * 0.1453482, shipSize.height * 0.8222931, shipSize.width * 0.1355046, shipSize.height * 0.8235378, shipSize.width * 0.1294452, shipSize.height * 0.8222931);
    path10.cubicTo(shipSize.width * 0.1218531, shipSize.height * 0.8207311, shipSize.width * 0.1151330, shipSize.height * 0.8164683, shipSize.width * 0.1135426, shipSize.height * 0.8135589);
    path10.cubicTo(shipSize.width * 0.1119525, shipSize.height * 0.8106465, shipSize.width * 0.1119525, shipSize.height * 0.8100091, shipSize.width * 0.1119525, shipSize.height * 0.8077341);
    path10.cubicTo(shipSize.width * 0.1119525, shipSize.height * 0.8054622, shipSize.width * 0.09445941, shipSize.height * 0.7990000, shipSize.width * 0.09445941, shipSize.height * 0.7960876);
    path10.cubicTo(shipSize.width * 0.09445941, shipSize.height * 0.7931782, shipSize.width * 0.1103620, shipSize.height * 0.7873535, shipSize.width * 0.1119525, shipSize.height * 0.7844441);
    path10.cubicTo(shipSize.width * 0.1135426, shipSize.height * 0.7815317, shipSize.width * 0.1124825, shipSize.height * 0.7786193, shipSize.width * 0.1135426, shipSize.height * 0.7771631);
    path10.cubicTo(shipSize.width * 0.1146026, shipSize.height * 0.7757069, shipSize.width * 0.1218531, shipSize.height * 0.7714471, shipSize.width * 0.1294452, shipSize.height * 0.7698852);
    path10.close();

    Paint paint10stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.001650165;
    paint10stroke.color = const Color(0xffFCE263).withOpacity(1.0);
    canvas.drawPath(path10, paint10stroke);

    Paint paint10fill = Paint()..style = PaintingStyle.fill;
    paint10fill.color = const Color(0xffFCE263).withOpacity(1.0);
    canvas.drawPath(path10, paint10fill);

    Path path11 = Path();
    path11.moveTo(shipSize.width * 0.2439449, shipSize.height * 0.7349486);
    path11.lineTo(shipSize.width * 0.2439449, shipSize.height * 0.8572296);
    path11.lineTo(shipSize.width * 0.2185007, shipSize.height * 0.8514079);
    path11.lineTo(shipSize.width * 0.2185007, shipSize.height * 0.7407704);
    path11.lineTo(shipSize.width * 0.2439449, shipSize.height * 0.7349486);
    path11.close();

    Paint paint11fill = Paint()..style = PaintingStyle.fill;
    paint11fill.color = const Color(0xff39537C).withOpacity(1.0);
    canvas.drawPath(path11, paint11fill);

    Path path12 = Path();
    path12.moveTo(shipSize.width * 0.1453482, shipSize.height * 0.7611511);
    path12.lineTo(shipSize.width * 0.1453482, shipSize.height * 0.8310272);
    path12.lineTo(shipSize.width * 0.2185007, shipSize.height * 0.8514079);
    path12.lineTo(shipSize.width * 0.2185007, shipSize.height * 0.7407704);
    path12.lineTo(shipSize.width * 0.1453482, shipSize.height * 0.7611511);
    path12.close();

    Paint paint12fill = Paint()..style = PaintingStyle.fill;
    paint12fill.color = const Color(0xff6388BB).withOpacity(1.0);
    canvas.drawPath(path12, paint12fill);

    Path path13 = Path();
    path13.moveTo(shipSize.width * 0.9996205, shipSize.height * 0.5012508);
    path13.cubicTo(shipSize.width * 0.9996205, shipSize.height * 0.4903323, shipSize.width * 0.9942970, shipSize.height * 0.4794139, shipSize.width * 0.9836568, shipSize.height * 0.4721631);
    path13.lineTo(shipSize.width * 0.3048053, shipSize.height * 0.009784502);
    path13.cubicTo(shipSize.width * 0.2786782, shipSize.height * -0.008011178, shipSize.width * 0.2415597, shipSize.height * 0.009059184, shipSize.width * 0.2415597, shipSize.height * 0.03887039);
    path13.lineTo(shipSize.width * 0.2415597, shipSize.height * 0.5012508);
    path13.lineTo(shipSize.width * 0.9996205, shipSize.height * 0.5012508);
    path13.close();

    Paint paint13fill = Paint()..style = PaintingStyle.fill;
    paint13fill.color = const Color(0xff4C6DA0).withOpacity(1.0);
    canvas.drawPath(path13, paint13fill);

    Path path14 = Path();
    path14.moveTo(shipSize.width * 0.9999439, shipSize.height * 0.5012508);
    path14.cubicTo(shipSize.width * 0.9999439, shipSize.height * 0.5121692, shipSize.width * 0.9946238, shipSize.height * 0.5230876, shipSize.width * 0.9839835, shipSize.height * 0.5303353);
    path14.lineTo(shipSize.width * 0.3051304, shipSize.height * 0.9927160);
    path14.cubicTo(shipSize.width * 0.2790033, shipSize.height * 1.010511, shipSize.width * 0.2418851, shipSize.height * 0.9934411, shipSize.width * 0.2418851, shipSize.height * 0.9636284);
    path14.lineTo(shipSize.width * 0.2418851, shipSize.height * 0.5012508);
    path14.lineTo(shipSize.width * 0.9999439, shipSize.height * 0.5012508);
    path14.close();

    Paint paint14fill = Paint()..style = PaintingStyle.fill;
    paint14fill.color = const Color(0xff6388BB).withOpacity(1.0);
    canvas.drawPath(path14, paint14fill);

    Path path15 = Path();
    path15.moveTo(shipSize.width * 0.2417769, shipSize.height * 0.5009698);
    path15.lineTo(shipSize.width * 0.2417769, shipSize.height * 0.6552779);
    path15.lineTo(shipSize.width * 0.5203267, shipSize.height * 0.6552779);
    path15.cubicTo(shipSize.width * 0.6408713, shipSize.height * 0.6552779, shipSize.width * 0.7454356, shipSize.height * 0.5926344, shipSize.width * 0.7972871, shipSize.height * 0.5009698);
    path15.lineTo(shipSize.width * 0.2417769, shipSize.height * 0.5009698);
    path15.close();

    Paint paint15fill = Paint()..style = PaintingStyle.fill;
    paint15fill.color = const Color(0xffD3F1F9).withOpacity(1.0);
    canvas.drawPath(path15, paint15fill);

    Path path16 = Path();
    path16.moveTo(shipSize.width * 0.2414624, shipSize.height * 0.5009698);
    path16.lineTo(shipSize.width * 0.2414624, shipSize.height * 0.3466586);
    path16.lineTo(shipSize.width * 0.5200099, shipSize.height * 0.3466586);
    path16.cubicTo(shipSize.width * 0.6405578, shipSize.height * 0.3466586, shipSize.width * 0.7451221, shipSize.height * 0.4093021, shipSize.width * 0.7969736, shipSize.height * 0.5009698);
    path16.lineTo(shipSize.width * 0.2414624, shipSize.height * 0.5009698);
    path16.close();

    Paint paint16fill = Paint()..style = PaintingStyle.fill;
    paint16fill.color = const Color(0xff7FCCE6).withOpacity(1.0);
    canvas.drawPath(path16, paint16fill);

    Path path17 = Path();
    path17.moveTo(shipSize.width * 0.2418640, shipSize.height * 0.5011571);
    path17.lineTo(shipSize.width * 0.2418640, shipSize.height * 0.6103384);
    path17.lineTo(shipSize.width * 0.6015578, shipSize.height * 0.6103384);
    path17.cubicTo(shipSize.width * 0.6868515, shipSize.height * 0.6103384, shipSize.width * 0.7608350, shipSize.height * 0.5660151, shipSize.width * 0.7975248, shipSize.height * 0.5011571);
    path17.lineTo(shipSize.width * 0.2418640, shipSize.height * 0.5011571);
    path17.close();

    Paint paint17fill = Paint()..style = PaintingStyle.fill;
    paint17fill.color = const Color(0xffB7EBF9).withOpacity(1.0);
    canvas.drawPath(path17, paint17fill);

    Path path18 = Path();
    path18.moveTo(shipSize.width * 0.2408686, shipSize.height * 0.5011571);
    path18.lineTo(shipSize.width * 0.2408686, shipSize.height * 0.3919758);
    path18.lineTo(shipSize.width * 0.6005644, shipSize.height * 0.3919758);
    path18.cubicTo(shipSize.width * 0.6858581, shipSize.height * 0.3919758, shipSize.width * 0.7598416, shipSize.height * 0.4362991, shipSize.width * 0.7965281, shipSize.height * 0.5011571);
    path18.lineTo(shipSize.width * 0.2408686, shipSize.height * 0.5011571);
    path18.close();

    Paint paint18fill = Paint()..style = PaintingStyle.fill;
    paint18fill.color = const Color(0xffA7DCEA).withOpacity(1.0);
    canvas.drawPath(path18, paint18fill);

    Path path19 = Path();
    path19.moveTo(shipSize.width * 0.5188746, shipSize.height * 0.6212447);
    path19.cubicTo(shipSize.width * 0.5489208, shipSize.height * 0.5916707, shipSize.width * 0.5679769, shipSize.height * 0.5485498, shipSize.width * 0.5683564, shipSize.height * 0.5004622);
    path19.lineTo(shipSize.width * 0.6701386, shipSize.height * 0.5004622);
    path19.cubicTo(shipSize.width * 0.6582937, shipSize.height * 0.5678278, shipSize.width * 0.5953564, shipSize.height * 0.6195468, shipSize.width * 0.5188746, shipSize.height * 0.6212447);
    path19.close();

    Paint paint19fill = Paint()..style = PaintingStyle.fill;
    paint19fill.color = const Color(0xff39537C).withOpacity(1.0);
    canvas.drawPath(path19, paint19fill);

    Path path20 = Path();
    path20.moveTo(shipSize.width * 0.5188746, shipSize.height * 0.3796344);
    path20.cubicTo(shipSize.width * 0.5489208, shipSize.height * 0.4092115, shipSize.width * 0.5679769, shipSize.height * 0.4523293, shipSize.width * 0.5683564, shipSize.height * 0.5004199);
    path20.lineTo(shipSize.width * 0.6701386, shipSize.height * 0.5004199);
    path20.cubicTo(shipSize.width * 0.6582937, shipSize.height * 0.4330544, shipSize.width * 0.5953564, shipSize.height * 0.3813353, shipSize.width * 0.5188746, shipSize.height * 0.3796344);
    path20.close();

    Paint paint20fill = Paint()..style = PaintingStyle.fill;
    paint20fill.color = const Color(0xff39537C).withOpacity(1.0);
    canvas.drawPath(path20, paint20fill);

    Path path21 = Path();
    path21.moveTo(shipSize.width * 0.2420743, shipSize.height * 0.7174773);
    path21.lineTo(shipSize.width * 0.5060594, shipSize.height * 0.7174773);
    path21.cubicTo(shipSize.width * 0.5060594, shipSize.height * 0.7174773, shipSize.width * 0.5155941, shipSize.height * 0.7222326, shipSize.width * 0.5171914, shipSize.height * 0.7276677);
    path21.cubicTo(shipSize.width * 0.5188779, shipSize.height * 0.7333988, shipSize.width * 0.5124191, shipSize.height * 0.7422266, shipSize.width * 0.5124191, shipSize.height * 0.7422266);
    path21.cubicTo(shipSize.width * 0.5124191, shipSize.height * 0.7422266, shipSize.width * 0.3311287, shipSize.height * 0.8746979, shipSize.width * 0.3199977, shipSize.height * 0.8746979);
    path21.cubicTo(shipSize.width * 0.2895667, shipSize.height * 0.8746979, shipSize.width * 0.2420743, shipSize.height * 0.8746979, shipSize.width * 0.2420743, shipSize.height * 0.8746979);

    Paint paint21stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.01320132;
    paint21stroke.shader = ui.Gradient.linear(Offset(shipSize.width * 0.5171914, shipSize.height * 0.7962266), Offset(shipSize.width * 0.2420743, shipSize.height * 0.7962266),
        [Colors.white.withOpacity(1), const Color(0xffF1D839).withOpacity(1), const Color(0xffFB982A).withOpacity(1)], [0, 0.157439, 1]);
    canvas.drawPath(path21, paint21stroke);

    Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path21, paint21Fill);

    Path path_22 = Path();
    path_22.moveTo(shipSize.width * 0.2420743, shipSize.height * 0.2865767);
    path_22.lineTo(shipSize.width * 0.5060594, shipSize.height * 0.2865767);
    path_22.cubicTo(shipSize.width * 0.5060594, shipSize.height * 0.2865767, shipSize.width * 0.5155941, shipSize.height * 0.2818211, shipSize.width * 0.5171914, shipSize.height * 0.2763867);
    path_22.cubicTo(shipSize.width * 0.5188779, shipSize.height * 0.2706550, shipSize.width * 0.5124191, shipSize.height * 0.2618290, shipSize.width * 0.5124191, shipSize.height * 0.2618290);
    path_22.cubicTo(shipSize.width * 0.5124191, shipSize.height * 0.2618290, shipSize.width * 0.3311287, shipSize.height * 0.1293559, shipSize.width * 0.3199977, shipSize.height * 0.1293559);
    path_22.cubicTo(shipSize.width * 0.2895667, shipSize.height * 0.1293559, shipSize.width * 0.2420743, shipSize.height * 0.1293559, shipSize.width * 0.2420743, shipSize.height * 0.1293559);

    Paint paint22Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shipSize.width * 0.01320132;
    paint22Stroke.shader = ui.Gradient.linear(Offset(shipSize.width * 0.5171914, shipSize.height * 0.2078278), Offset(shipSize.width * 0.2420743, shipSize.height * 0.2078278),
        [Colors.white.withOpacity(1), const Color(0xffF1D839).withOpacity(1), const Color(0xffFB982A).withOpacity(1)], [0, 0.157439, 1]);
    canvas.drawPath(path_22, paint22Stroke);

    Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_22, paint22Fill);
  }
}
