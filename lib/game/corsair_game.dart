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

import '../settings/game_state.dart';

class CorsairGame extends FlameGame with HasCollisionDetection, HasTappables {
  Sprite? background;
  Svg? shipSvg;
  Svg? enemySvg;
  Svg? buttonSvg;
  late TextComponent scoreText;
  late TextComponent levelText;
  @override
  Future onLoad() async {
    print(canvasSize);
    await images.loadAll(['background.jpg', 'destroy8.png', 'star.png', 'bullet.png']);
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

    StarController star = StarController();

    //bullet

    BulletController bullet = BulletController();
    //button
    buttonSvg = await loadSvg('images/playbutton.svg');

    //add components
    ButtonComponent button = ButtonComponent(
      button: SvgComponent(svg: buttonSvg, size: Vector2(90, 90)),
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y - 100),
      onPressed: ship.clickAction,
    );

    scoreText = TextComponent(
      text: 'Score: 0',
      position: Vector2(300, 50),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );

    levelText = TextComponent(
      text: 'LEVEL 1',
      position: Vector2(50, 50),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
    add(baackComp);
    add(star);
    add(ship);
    add(bullet);
    add(enemy);
    add(button);
    add(scoreText);
    add(levelText);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    scoreText.text = 'Score: ${GameState.score}';
    levelText.text = 'LEVEL ${GameState.level}';
  }
}
