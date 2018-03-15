//
//  Player.swift
//  Crash it
//
//  Created by Olivier Picard on 13/03/2018.
//  Copyright © 2018 Olivier Picard. All rights reserved.
//

import Foundation
import SpriteKit

class Player : SKSpriteNode{

    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(image: UIImage, collisionableItem: [Collisionable]) {
        self.init(texture: SKTexture(image: image), color: UIColor.white,
                  size: CGSize(width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    func collisionDetection(collisionableItems: inout [Collisionable]) {
        
    }
    
    
}