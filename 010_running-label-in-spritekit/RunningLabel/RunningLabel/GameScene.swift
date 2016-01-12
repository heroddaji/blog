//
//  GameScene.swift
//  RunningLabel
//
//  Created by dai on 1/12/16.
//  Copyright (c) 2016 nevitech. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var storyText = DKRunningLabelNode()
    
    override func didMoveToView(view: SKView) {
        storyText.position = CGPointMake(84, 489)
        storyText.delayPerWord = 0.2
        storyText.runningText = "Hello world, this is how it is\nI love animation\nAnd this is just a bunch of running label text, kakaka"

        self.addChild(storyText);
    }
    
    override func update(currentTime: CFTimeInterval) {
            storyText.run(currentTime)
    }
}
