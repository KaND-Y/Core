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
    fileprivate var inTransition = false
    
    
    // MARK: - Init
    
    init(size: CGSize) {
        message =  SKLabelNode(fontNamed: "Helvetica")
        box = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        
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
    
    func showWithMessageString(_ str: String) {
        if inTransition {
            return
        }
        
        // Set up properties of objects
        inTransition = true
        isHidden = false
        alpha = 0
        message.text = str
        message.alpha = 0
        box.alpha = 0
        
        // Run action on objects
        run(SKAction.fadeIn(withDuration: 2))
        
        message.run(SKAction.sequence([
            SKAction.wait(forDuration: 2),
            SKAction.fadeIn(withDuration: 1)
            ]))
        
        box.run(SKAction.sequence([
            SKAction.wait(forDuration: 3),
            SKAction.fadeIn(withDuration: 2)
            ]))
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 5),
            SKAction.run({
                self.inTransition = false
            })]))
    
    }
    
    func hideWithDuration(_ duration: TimeInterval) {
        if inTransition {
            return
        }
        
        inTransition = true
        run(SKAction.sequence([SKAction.fadeOut(withDuration: duration), SKAction.run({ 
            self.isHidden = true
            self.inTransition = false
        })]))
    }
    
}









