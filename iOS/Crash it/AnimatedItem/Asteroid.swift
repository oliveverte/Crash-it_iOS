//
//  Asteroid.swift
//  Crash it
//
//  Created by Olivier Picard on 13/03/2018.
//  Copyright © 2018 Olivier Picard. All rights reserved.
//

import Foundation
import SpriteKit

class Asteroid: AnimatedItem, Collisionable {
    var enable_collision: Bool
    let dammage: Int = 50
    
    init(size: CGSize) {
        let splitedAtlas:[SKTexture] = Tools.splitAtlas(atlas: SKTextureAtlas(named: "Asteroids"),
                                                        baseName: "asteroid_")
        self.enable_collision = true
        super.init(textureGroup: splitedAtlas,
                   numberOfLooping: nil,
                   size: size,
                   latency: 0.1)
        self.zPosition = 800
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.enable_collision = false
        super.init(coder: aDecoder)
    }
    
    func inCollisionWith(item: Collisionable) {
        var isDestroy = false
        if let laser = item as? LaserShot {
            if(type(of: laser.shooter) == ShuttlePlayer.self) { isDestroy = true }
        } else if item is ShuttlePlayer { isDestroy = true }
        
        if(isDestroy) {
            if let gameScene = self.scene as? GameScene {
                gameScene.score += 1
            }
            let pos = self.position
            self.scene?.addChild(Explosion(position: pos))
            self.scene?.removeChildren(in: [self])
        }
    }
}

