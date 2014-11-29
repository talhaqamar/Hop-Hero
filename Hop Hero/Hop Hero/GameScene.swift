//
//  GameScene.swift
//  Hop Hero
//
//  Created by Talha Qamar on 10/29/14.
//  Copyright (c) 2014 Talha Qamar. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let playButton = SKSpriteNode(imageNamed: "play")
    
    let text = SKLabelNode(text: "Hello,Let's play")
    override func didMoveToView(view: SKView)
    {
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        addChild(self.playButton);
        self.text.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+CGRectGetMidY(self.frame)/4)
        self.text.color = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
        self.text.fontSize = 16
        addChild(self.text);
        
        self.backgroundColor = UIColor(red: 255/255.0, green: 150/255.0, blue: 180/255.0, alpha: 1.0);

        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch : AnyObject in touches
            {
            let location = touch.locationInNode(self)
                if self.nodeAtPoint(location) == self.playButton{
                    println("playbutton")
                     var scene = PlayScene(size: self.size)
                    let skview  = self.view as SKView!
                    //  skview.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = skview.bounds.size
                    skview.presentScene(scene)
                    
                }
               
                    
            }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
