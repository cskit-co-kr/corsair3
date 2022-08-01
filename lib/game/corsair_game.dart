import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_game/game/controller/bullet_controller.dart';
import 'package:flame_game/game/controller/star_controller.dart';
import 'package:flame_game/game/model/button.dart';
import 'package:flame_game/game/model/dashed_circle.dart';
import 'package:flame_game/game/model/enemy.dart';
import 'package:flame_game/game/model/ship.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:flutter/material.dart';

import '../settings/game_state.dart';

class CorsairGame extends FlameGame with HasCollisionDetection, HasTappables {
  //gameSettings
  late AudioPool pool;
  late AudioPool dest;
  late Vector2 centerPosition;
  late double mainDistanse;
  late double buttonrad;

  late TextComponent scoreText;
  late TextComponent levelText;
  late DashedCircle circle;
  Function setStates;

  late StarController star;
  late Enemy enemy;
  late Ship ship;
  late ButtonComponent button;
  late MyButtonComponent playButton;
  late BulletController bullet;

  CorsairGame({required this.setStates});
  @override
  Color backgroundColor() => Colors.transparent;
  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    centerPosition = Vector2(size.x / 2, size.y * .4);
    mainDistanse = (size.x < size.y * .7) ? size.x * .41 : size.y * .7 * .36;
    buttonrad = (size.x < size.y * .7) ? size.x * .28 : size.y * .7 * .24;
  }

  @override
  Future onLoad() async {
    await images.loadAll(['background.jpg', 'destroy8.png']);

    pool = await FlameAudio.createPool(
      'sfx/coin2.mp3',
      minPlayers: 0,
      maxPlayers: 0,
    );
    dest = await FlameAudio.createPool(
      'sfx/explosion.mp3',
      minPlayers: 0,
      maxPlayers: 0,
    );
    await initData();
  }

  @override
  void update(double dt) {
    super.update(dt);

    scoreText.text = '${GameState.score}';
    levelText.text = 'LEVEL  ${GameState.level}';
  }

  Future refreshData() async {
    remove(star);

    if (children.contains(ship)) remove(ship);
    remove(bullet);
    remove(enemy);
    remove(button);
    remove(scoreText);
    remove(levelText);
    if (children.contains(circle)) remove(circle);

    await initData();
  }

  void nextlevel() async {
    GameState.type = GameType.nextGame;
    if (GameState.level % 10 == 0) {
      GameState.shipSpeed = GameState.shipSpeed * 1.1;
    }
    GameState.bulletSpeed = GameState.bulletSpeed * 1.1;
    GameState.bulletFrac = GameState.bulletFrac * .9;

    print('bulletPseed :: ${GameState.bulletSpeed} :::: ${GameState.bulletFrac}:::: ${GameState.shipSpeed}');
    GameState.score += 10;
    GameState.level++;
    refreshData();
  }

  void clickAction() async {
    if (GameState.type == GameType.playingGame) {
      ship.isReverse = !ship.isReverse;
      bullet.fireMode = 3;
    } else if (GameState.type == GameType.loadingGame || GameState.type == GameType.nextGame) {
      GameState.type = GameType.playingGame;
    }
  }

  Future initData() async {
    //circle
    circle = DashedCircle(
        radius: mainDistanse,
        // position: Vector2(size.x / 8, size.y * .16),
        center: centerPosition,
        dashes: 180,
        gapSize: 0.5,
        paint: Paint()
          ..color = Colors.white.withOpacity(0.1)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
    //ship
    ship = Ship(
      nextlevel: nextlevel,
      setStates: setStates,
      shipSvg: await loadSvg('images/ship.svg'),
      gradusa: 0,
    );

    //enemy
    enemy = Enemy(
      svg1: await loadSvg('images/enemy.svg'),
      size: Vector2(75, 75),
      position: centerPosition,
    );

    //star

    star = StarController();

    //bullet

    bullet = BulletController();

    //button
    button = ButtonComponent(
      button: SvgComponent(svg: await loadSvg('images/reverse.svg'), size: Vector2(buttonrad, buttonrad)),
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y * .85),
      onPressed: (() {
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

    add(circle);
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
