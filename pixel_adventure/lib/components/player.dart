import 'dart:async';

import 'package:flame/components.dart';

import 'package:flutter/services.dart';
import 'package:pixel_adventure/pixel_adventure.dart';


enum  PlayerState{idle, running}


class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure>, KeyboardHandler{
  String character;
  Player({position, this.character = 'Mask Dude'}) : super(position: position);
  
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;


  double horizontalMovement = 0;

  double moveSpeed = 100;
  Vector2 velocity = Vector2.zero();


  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _updatePlayerState();
    _updatePlayerMovement(dt);
    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalMovement = 0;
    final isLeftKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowRight);

    horizontalMovement  += isLeftKeyPressed ? -1 : 0;
    horizontalMovement  += isRightKeyPressed ? 1 : 0;
    return super.onKeyEvent(event, keysPressed);
  }
  
  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation('Idle', 11);

    runningAnimation = _spriteAnimation('Run', 12);

    //Lista com todas as animações

    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
  };
 
  
  }

  //Reutilização da animação de sprites
  SpriteAnimation _spriteAnimation(String state, int amount){
    return SpriteAnimation.fromFrameData(game.images.fromCache("Main Characters/${character}/${state} (32x32).png"), SpriteAnimationData.sequenced(amount: amount, stepTime: stepTime, textureSize: Vector2.all(32),),);
  }
  void _updatePlayerState() {
    PlayerState playerState = PlayerState.idle;
    if(velocity.x < 0 && scale.x > 0) {
      flipHorizontallyAroundCenter();

    } else if(velocity.x > 0 && scale.x < 0){
      flipHorizontallyAroundCenter();
    }

    if(velocity.x > 0 || velocity.x < 0) playerState = PlayerState.running;
    current = playerState;
  }
  //Atualizar a movimentação do jogador
  void _updatePlayerMovement(double dt) {
    

    velocity.x = horizontalMovement * moveSpeed;
    position.x += velocity.x * dt;
  }

    
    
}