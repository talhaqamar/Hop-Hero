//
//  PlayScene.swift
//  Hop Hero
//
//  Created by Talha Qamar on 10/29/14.
//  Copyright (c) 2014 Talha Qamar. All rights reserved.
//

import SpriteKit

class PlayScene : SKScene {
    let runningbar = SKSpriteNode(imageNamed: "bar")
    let hero = SKSpriteNode(imageNamed: "hero")
    var orunningbarX = CGFloat(0)
    var MaxBarX = CGFloat(0)
    var groundspeed = 5
    var onGround = true;
    var velocityY = CGFloat(0)
    var gravity =  CGFloat(0.8)
    var herobaseline = CGFloat(0)
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor(red: 255/255.0, green: 150/255.0, blue: 180/255.0, alpha: 1.0);
        self.runningbar.anchorPoint = CGPointMake(0, 0.5)
        self.runningbar.position =  CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame) + (self.runningbar.size.height)/2)
        
       
        self.orunningbarX = self.runningbar.position.x
        self.MaxBarX = (self.runningbar.size.width - self.frame.size.width)
        
        MaxBarX = MaxBarX * (-1)
        herobaseline = runningbar.position.y + runningbar.size.height/2
            + hero.size.height/2
        self.hero.position = CGPointMake(CGRectGetMaxX(self.frame)/4 ,herobaseline )
        
        self.addChild(self.runningbar)
        self.addChild(self.hero)
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if onGround
        {
            self.velocityY = -18.0
            self.onGround = false
        }
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if onGround
        {
            self.velocityY = -9.0
          
        }
        }
    override func update(currentTime: NSTimeInterval) {
        if runningbar.position.x <= MaxBarX
            {
            self.runningbar.position.x = self.orunningbarX
            }
        //jjump
        self.velocityY += gravity
       self.hero.position.y -= velocityY
        if self.hero.position.y < herobaseline
        {
            self.hero.position.y = herobaseline
            velocityY = 0.0
            onGround=true
        }
        
        
        var rotation = CDouble(self.groundspeed) * M_PI / 180
        
        self.hero.zRotation -= CGFloat(rotation)
        runningbar.position.x -= CGFloat(self.groundspeed)
        }
    
}
