//
//  MenuThing.swift
//  MenuThing
//
//  Created by Kai Drayton-Yee on 8/12/16.
//  Copyright © 2016 Kai Drayton-Yee. All rights reserved.
//

import SpriteKit

class MenuThing: SKSpriteNode {
    
    let message: SKLabelNode
    let box: SKSpriteNode
    private var inTransition = false
    
    
    // MARK: - Init
    
    init(size: CGSize) {
        message =  SKLabelNode(fontNamed: "Helvetica")
        box = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 50, height: 50))
        
        super.init(texture: nil, color: UIColor(white: 0, alpha: 1), size: size)
    
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Setup 
    
    func setup() {
        anchorPoint = CGPoint(x: 0, y: 0)
        
        self.addChild(message)
        message.position.x = size.width / 2
        message.position.y = size.height - 50
        
        self.addChild(box)
        box.position.x = size.width / 2
        box.position.y = size.height / 2
        
    }
    
    
    
    // MARK: - Helper Methods
    
    func showWithMessageString(str: String) {
        if inTransition {
            return
        }
        
        // Set up properties of objects
        inTransition = true
        hidden = false
        alpha = 0
        message.text = str
        message.alpha = 0
        box.alpha = 0
        
        // Run action on objects
        runAction(SKAction.fadeInWithDuration(2))
        
        message.runAction(SKAction.sequence([
            SKAction.waitForDuration(2),
            SKAction.fadeInWithDuration(1)
            ]))
        
        box.runAction(SKAction.sequence([
            SKAction.waitForDuration(3),
            SKAction.fadeInWithDuration(2)
            ]))
        
        runAction(SKAction.sequence([
            SKAction.waitForDuration(5),
            SKAction.runBlock({
                self.inTransition = false
            })]))
    
    }
    
    func hideWithDuration(duration: NSTimeInterval) {
        if inTransition {
            return
        }
        
        inTransition = true
        runAction(SKAction.sequence([SKAction.fadeOutWithDuration(duration), SKAction.runBlock({ 
            self.hidden = true
            self.inTransition = false
        })]))
    }
    
}









