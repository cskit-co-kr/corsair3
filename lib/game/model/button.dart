import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flutter/cupertino.dart';

class MyButtonComponent extends PositionComponent with Tappable {
  late final PositionComponent? button;
  late final PositionComponent? buttonDown;
  late final PositionComponent? playButton;
  void Function()? onPressed;
  void Function()? onReleased;

  MyButtonComponent({
    this.button,
    this.buttonDown,
    this.playButton,
    this.onPressed,
    this.onReleased,
    super.position,
    Vector2? size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) : super(
          size: size ?? button?.size,
        );

  @override
  void onMount() {
    super.onMount();
    assert(
      button != null,
      'The button has to either be passed in as an argument or set in onLoad',
    );
    if (!contains(playButton!)) {
      add(playButton!);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (GameState.type == GameType.playingGame || GameState.type == GameType.overGame) {
      if (playButton != null) {
        playButton!.removeFromParent();
        button!.parent = this;
      }
    } else {
      if (buttonDown != null) {
        buttonDown!.removeFromParent();
        playButton!.parent = this;
      }
      if (button != null) {
        button!.removeFromParent();
        playButton!.parent = this;
      }
    }
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (buttonDown != null) {
      button!.removeFromParent();
      buttonDown!.parent = this;
    }
    onPressed?.call();
    return false;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    onTapCancel();
    onReleased?.call();
    return true;
  }

  @override
  bool onTapCancel() {
    if (buttonDown != null) {
      buttonDown!.removeFromParent();
      button!.parent = this;
    }
    return false;
  }
}
