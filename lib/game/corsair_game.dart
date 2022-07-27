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

  late SpriteComponent baackComp;
  late StarController star;
  late Enemy enemy;
  late Ship ship;
  late ButtonComponent button;
  late BulletController bullet;
  @override
  Future onLoad() async {
    print(canvasSize);
    await images.loadAll(['background.jpg', 'destroy8.png', 'star.png', 'bullet.png']);
    await initData();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    scoreText.text = 'Score: ${GameState.score}';
    levelText.text = 'LEVEL ${GameState.level}';
  }

  Future refreshData() async {
    // remove(ship);
    SpriteComponent baackComp = SpriteComponent(
      sprite: Sprite(images.fromCache('background.jpg')),
      size: canvasSize,
    );

    remove(star);

    if (children.contains(ship)) remove(ship);
    remove(bullet);
    remove(enemy);
    remove(button);
    remove(scoreText);
    remove(levelText);

    await initData();
  }

  void clickAction() {
    if (GameState.type == GameType.playingGame) {
      ship.isReverse = !ship.isReverse;
    } else {
      //if (GameState.type != GameType.playingGame) {
      refreshData();
      GameState.type = GameType.playingGame;
    }
  }

  Future initData() async {
    //ship
    ship = Ship(
      shipSvg: await loadSvg('images/ship.svg'),
      position: Vector2(canvasSize.x * 0.5, canvasSize.y * 0.3),
    );

    //enemy
    enemy = Enemy(
      enemySvg: await loadSvg('images/enemy.svg'),
      position: canvasSize * .5,
    );

    //star

    star = StarController();

    //bullet

    bullet = BulletController();
    //button
    button = ButtonComponent(
      button: SvgComponent(svg: await loadSvg('images/playbutton.svg'), size: Vector2(90, 90)),
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y - 100),
      onPressed: clickAction,
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

    //add components

    add(star);
    add(ship);
    add(bullet);
    add(enemy);
    add(button);
    add(scoreText);
    add(levelText);
  }
}
