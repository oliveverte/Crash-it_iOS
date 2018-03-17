//
//  GameScene.swift
//  Crash it
//
//  Created by Olivier Picard on 11/03/2018.
//  Copyright © 2018 Olivier Picard. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var player = Player()
    var score = SKLabelNode()
    var stars:Stars?
    
    override func didMove(to view: SKView) {
        player = Player(texture: SKTexture(image: #imageLiteral(resourceName: "shuttle_1")),
                        size: self.convertSizeFromSceneSpaceToReal(sceneSpaceSize: CGSize(width: 0.1, height: 0.05)))

        player.position = self.convertPointFromSceneSpaceToReal(CGPoint(x: 0.5, y: 0.2))
        self.addChild(player)
        
        score = self.childNode(withName: "Score") as! SKLabelNode
        score.position = self.convertPointFromSceneSpaceToReal(CGPoint(x: 0.5, y: 0.8))
        
        stars = Stars(scene: self, screenSize: self.size)
        
    }
    
    /**
     Convert a percentage of the current scene to a real point on screen (physic pixel coordinate).
     
     - returns:
     CGPoint represent coordinate of a point on screen (pixel).

     - parameters:
        - pos: CGpoint: between [0,1] on the scene (percentage of the scene).
     */
    func convertPointFromSceneSpaceToReal(_ pos: CGPoint) -> CGPoint {
        return CGPoint(x: self.size.width * pos.x,
                       y: self.size.height * pos.y)
    }
    
    func convertSizeFromSceneSpaceToReal(sceneSpaceSize size: CGSize) -> CGSize {
        return CGSize(width: self.size.width * size.width,
                      height: self.size.height * size.height)
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        // When finger is down
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        stars?.update()
        
    }
}


















