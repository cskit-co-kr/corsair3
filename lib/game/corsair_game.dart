import 'package:flame/components.dart';
import 'package:flame/effects.dart';
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
  Svg? shipSvg;
  Svg? enemySvg;
  Svg? buttonSvg;
  late TextComponent scoreText;
  late TextComponent levelText;
  Function setStates;

  late StarController star;
  late Enemy enemy;
  late Ship ship;
  late ButtonComponent button;
  late BulletController bullet;
  CorsairGame({required this.setStates});
  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future onLoad() async {
    await images.loadAll(['background.jpg', 'destroy8.png', 'star.png', 'bullet.png']);
    await initData();
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreText.text = '${GameState.score}';
    levelText.text = 'LEVEL  ${GameState.level}';
  }

  Future refreshData() async {
    // remove(ship);

    remove(star);

    if (children.contains(ship)) remove(ship);
    remove(bullet);
    remove(enemy);
    remove(button);
    remove(scoreText);
    remove(levelText);

    await initData();
  }

  void nextlevel() async {
    GameState.type = GameType.nextGame;
    // button.button.= await loadSvg('images/ship.svg');

    GameState.level++;
    refreshData();
  }

  void clickAction() async {
    if (GameState.type == GameType.playingGame) {
      ship.isReverse = !ship.isReverse;
    } else if (GameState.type == GameType.loadingGame || GameState.type == GameType.nextGame) {
      //if (GameState.type != GameType.playingGame) {
      // refreshData();
      // button.button = SvgComponent(svg: await loadSvg('images/playbutton.svg'), size: Vector2(90, 90));

      GameState.type = GameType.playingGame;
    }
  }

  Future initData() async {
    //ship
    ship = Ship(
      nextlevel: nextlevel,
      setStates: setStates,
      shipSvg: await loadSvg('images/ship.svg'),
      position: Vector2(canvasSize.x * 0.5, canvasSize.y * 0.3),
    );

    //enemy
    enemy = Enemy(
      enemySvg: await loadSvg('images/enemy.svg'),
      position: Vector2(canvasSize.x * 0.5, canvasSize.y * 0.5),
    );

    //star

    star = StarController();

    //bullet

    bullet = BulletController();
    //button
    button = ButtonComponent(
      button: SvgComponent(svg: await loadSvg('images/repeat.svg'), size: Vector2(90, 90)),
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y - 100),
      onPressed: (() {
        // add(
        //   ScaleEffect.by(
        //     Vector2.all(1.1),
        //     EffectController(duration: 0.2, reverseDuration: 0.2),
        //   ),
        // );
        clickAction();
      }),
    );

    scoreText = TextComponent(
        text: '0',
        position: Vector2(size.x - 40, 18),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Lalezar',
          ),
        ),
        anchor: Anchor.centerRight);

    levelText = TextComponent(
        text: 'LEVEL 1',
        position: Vector2(24, 18),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Lalezar',
          ),
        ),
        anchor: Anchor.centerLeft);

    //add components

    add(star);
    add(ship);
    add(bullet);
    add(enemy);
    add(button);
    add(scoreText);
    add(levelText);
    add(
      SpriteComponent(
          sprite: Sprite(
            images.fromCache('star.png'),
          ),
          size: Vector2(20, 20),
          position: Vector2(size.x - 24, 18),
          anchor: Anchor.center),
    );
  }

  void endGame() {
    print('EndGame');
  }
}
