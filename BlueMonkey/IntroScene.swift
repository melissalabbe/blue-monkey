//
//  IntroScene.swift
//  BlueMonkey
//
//  Created by MELISSA LABBE on 1/15/15.
//  Copyright (c) 2015 MELISSA LABBE. All rights reserved.
//

import SpriteKit

class IntroScene: SKScene {
    
    
    var animateMonkey = SKAction()
    var monkeySprite = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        var sky = SKSpriteNode(imageNamed:"sky-loop")
        sky.position = CGPointMake(sky.size.width/2, sky.size.height/2)
        self.addChild(sky)
        
        var mountains = SKSpriteNode(imageNamed: "mountains-loop")
        mountains.position = CGPointMake(mountains.size.width/2,mountains.size.height/2)
        self.addChild(mountains)
        
        var bgTrees = SKTexture(imageNamed: "background-trees-loop")
        //make your SKActions that will move the image across the screen. this one goes from right to left.
        var moveBgTrees = SKAction.moveByX(-bgTrees.size().width, y: 0, duration: NSTimeInterval(0.02 * bgTrees.size().width))
        
        //This resets the image to begin again on the right side.
        var resetBgTrees = SKAction.moveByX(bgTrees.size().width, y: 0, duration: 0.0)
        
        //this moves the image run forever and put the action in the correct sequence.
        var moveBgTreesForever = SKAction.repeatActionForever(SKAction.sequence([moveBgTrees, resetBgTrees]))
        
        //then run a for loop to make the images line up end to end.
        for var i:CGFloat = 0; i<2 + self.frame.size.width / (bgTrees.size().width); ++i {
            var sprite = SKSpriteNode(texture: bgTrees)
            sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2)
            sprite.runAction(moveBgTreesForever)
            self.addChild(sprite)
        }
        
        
        var fgTrees = SKTexture(imageNamed: "foreground-trees-loop")
        //make your SKActions that will move the image across the screen. this one goes from right to left.
        var moveFgTrees = SKAction.moveByX(-fgTrees.size().width, y: 0, duration: NSTimeInterval(0.01 * fgTrees.size().width))
        
        //This resets the image to begin again on the right side.
        var resetFgTrees = SKAction.moveByX(fgTrees.size().width, y: 0, duration: 0.0)
        
        //this moves the image run forever and put the action in the correct sequence.
        var moveFgTreesForever = SKAction.repeatActionForever(SKAction.sequence([moveFgTrees, resetFgTrees]))
        
        //then run a for loop to make the images line up end to end.
        for var i:CGFloat = 0; i<2 + self.frame.size.width / (fgTrees.size().width); ++i {
            var sprite = SKSpriteNode(texture: fgTrees)
            sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2)
            sprite.runAction(moveFgTreesForever)
            self.addChild(sprite)
        }
        
        
        var spriteArray = Array<SKTexture>()
        
        for(var j=1; j<10; j++){
            var imageName = "bluemonkey_swing_" + String(j) + ".png"
            var monkeyTexture = SKTexture(imageNamed: imageName)
            spriteArray.append(monkeyTexture)
        }
        
        monkeySprite = SKSpriteNode(texture:spriteArray[0] as SKTexture);
        monkeySprite.position = CGPoint(x:450, y:350)
        monkeySprite.xScale = 0.5
        monkeySprite.yScale = 0.5
        
        
        let animateAction = SKAction.animateWithTextures(spriteArray, timePerFrame: 0.20);
        animateMonkey = SKAction.repeatActionForever(animateAction)
        monkeySprite.runAction(animateMonkey)
        
        
        self.addChild(monkeySprite);
        
       

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
