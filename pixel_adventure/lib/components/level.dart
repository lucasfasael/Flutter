import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure/components/collision_block.dart';
import 'package:pixel_adventure/components/player.dart';

class Level extends World{
  final String levelName;
  final Player player;
  Level({required this.levelName, required this.player});
  late TiledComponent level;
  List<CollisionBlock> collisionBLocks = [];
   @override
  FutureOr<void> onLoad() async{

    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);
    
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if(spawnPointsLayer != null){
    for(final spawnPoint in spawnPointsLayer!.objects){
      switch(spawnPoint.class_){
        case 'Player':
          player.position = Vector2(spawnPoint.x, spawnPoint.y);
          add(player);
          break;
        default:
      }
    }
    }

    final collisionsLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');

    if(collisionsLayer != null){
      for(final collision in collisionsLayer.objects){
        switch (collision.class_){
          case 'Platform':
          final platform = CollisionBlock(position: Vector2(collision.x, collision.y), size:  Vector2(collision.width, collision.height), isPlatform: true);
          collisionBLocks.add(platform);
          add(platform);
          break;
          default:
          final block = CollisionBlock(
            position: Vector2(collision.x, collision.y),
            size: Vector2(collision.width, collision.y)
          );
          collisionBLocks.add(block);
          add(block);
        }
      }
    }
    // TODO: implement onLoad
    player.collisionBLocks = collisionBLocks;
    return super.onLoad();
    
  }
}