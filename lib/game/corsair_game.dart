import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_game/game/controller/bullet_controller.dart';
import 'package:flame_game/game/controller/star_controller.dart';
import 'package:flame_game/game/model/enemy.dart';
import 'package:flame_game/game/model/ship.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CorsairGame extends FlameGame with HasCollisionDetection, HasTappables {
  Sprite? background;
  Svg? shipSvg;
  Svg? enemySvg;
  Svg? starSvg;
  Svg? bulletSvg;
  Svg? buttonSvg;
  @override
  Future onLoad() async {
    print(canvasSize);
    await images.loadAll(['background.jpg']);
    SpriteComponent baackComp = SpriteComponent(
      sprite: Sprite(images.fromCache('background.jpg')),
      size: canvasSize,
    );

    //ship
    shipSvg = await loadSvg('images/ship.svg');
    Ship ship = Ship(
      shipSvg: shipSvg,
      position: Vector2(canvasSize.x * 0.5, canvasSize.y * 0.3),
    );

    //enemy
    enemySvg = await loadSvg('images/enemy.svg');
    Enemy enemy = Enemy(
      enemySvg: enemySvg,
      position: canvasSize * .5,
    );

    //star
    starSvg = await loadSvg('images/star.svg');
    StarController star = StarController(
      starSvg: starSvg,
    );

    //bullet
    bulletSvg = await loadSvg('images/bullet.svg');
    BulletController bullet = BulletController(
      bulletSvg: bulletSvg,
    );
    //button
    buttonSvg = await loadSvg('images/bullet.svg');

    //add components
    ButtonComponent button = ButtonComponent(
      button: SvgComponent(svg: buttonSvg, size: Vector2(90, 90)),
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y - 100),
      onPressed: ship.clickAction,
    );
    add(baackComp);
    add(star);
    add(ship);
    add(bullet);
    add(enemy);
    add(button);
  }
}
