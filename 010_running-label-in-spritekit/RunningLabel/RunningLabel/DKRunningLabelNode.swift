//
//  DKLabelNode.swift
//  cotich_spritekit
//
//  Created by dai-hackintosh on 12/20/15.
//  Copyright © 2015 nevitech. All rights reserved.
//

import SpriteKit

class DKRunningLabelNode: SKNode {
    private var previousTime:CFTimeInterval = 0
    var delayPerWord:CFTimeInterval = 0
    var label = SKLabelNode()
    
    private var _runningText = ""
    private var lines = [String]()
    private var lineLabels = [SKLabelNode]()
    var runningText:String {
        get{
            return _runningText
        }
        set{
            _runningText = newValue
            lines = _runningText.componentsSeparatedByString("\n")
            var lineIndex:CGFloat = 0
            for _ in lines{
                let lineLabel = SKLabelNode(text: "")
                copyLabelAttributes(lineLabel)
                lineLabel.position = CGPointMake(0, 0)
                lineLabel.position.y = lineLabel.position.y - ( label.fontSize * lineIndex) - 50
                self.addChild(lineLabel)
                lineLabels.append(lineLabel)
                lineIndex++
            }
        }
    }
    
    override init() {
        super.init()
        label.fontColor = UIColor.redColor()
        label.fontSize = 35
        label.horizontalAlignmentMode = .Left
        label.fontName = "Helvetica Neu"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func copyLabelAttributes(newLabel:SKLabelNode){
        newLabel.fontColor = label.fontColor
        newLabel.fontSize = label.fontSize
        newLabel.horizontalAlignmentMode = label.horizontalAlignmentMode
        newLabel.fontName = label.fontName
    }
    
    private var wordCountIndex = 0
    private var lineCountIndex = 0
    private var wordsOfEachLine = [""]
    func run(currentTime:CFTimeInterval){
        if lineCountIndex == lineLabels.count{
            return
        }
        
        wordsOfEachLine = lines[lineCountIndex].componentsSeparatedByString(" ")
        if previousTime == 0 {
            previousTime = currentTime
        }
        if wordCountIndex == wordsOfEachLine.count {
            if ++lineCountIndex == lineLabels.count{
                return
            }
            wordCountIndex = 0
        }
        
        let elapsedTime = currentTime - previousTime
        if elapsedTime > delayPerWord{
            lineLabels[lineCountIndex].text?.appendContentsOf("\(wordsOfEachLine[wordCountIndex]) ")
            wordCountIndex++;
            previousTime = currentTime;
        }
    }
}
