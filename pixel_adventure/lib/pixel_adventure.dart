import 'dart:async';
import 'dart:ui';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pixel_adventure/components/player.dart';
import 'package:pixel_adventure/components/level.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class PixelAdventure extends FlameGame with HasKeyboardHandlerComponents, DragCallbacks{
  @override
  Color backgroundColor() => const Color(0xFF211f30);
  late final CameraComponent cam;
  Player player = Player(character: 'Mask Dude');
  late JoystickComponent joystick;
  bool showJoystick = true;
  // Declare world variable here

  @override
  Future<void> onLoad() async {

    await images.loadAllImages();
      final world = Level(levelName: 'Level-02', player: player);
    

     // Initialize world variable
    cam = CameraComponent.withFixedResolution(
      world: world,
      width: 640,
      height: 360,
    );
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    if(showJoystick){
    addJoystick();}
    return super.onLoad();
  }
  @override
  void update(double dt) {
    if(showJoystick){
    updateJoystick();
    }
    super.update(dt);
  }
  void addJoystick() {
    joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: Sprite(images.fromCache('HUD/Knob.png'))
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Joystick.png')
        )
      ),
      margin: const EdgeInsets.only(left: 32, bottom: 32),
    );
    if(showJoystick){
    add(joystick);
    }
  }
  
  void updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        break;
      
      default:
        player.horizontalMovement = 0;
    }
  }
}