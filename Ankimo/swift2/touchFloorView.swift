//
//  touchFloorView.swift
//  swift2
//
//  Created by takeshi on 2014/12/21.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class touchFloorView: UIView {

    var startPoint : CGPoint = CGPointMake(0, 0)

    override init() {
        super.init()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 0.8, alpha: 1)

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        println(" \(touches.count) ")
        
        if (touches.anyObject() != nil){
            startPoint = touches.anyObject()!.locationInView(self)
            println("startpoint \(startPoint.x) \(startPoint.y) ")
        }
        
        /*
        for touch in touches {
        var point = touch.locationInView(self)
        println(" x: \(point.x)  y: \(point.y)   ")
        var point2 = touch.locationInView(superview)
        println(" x: \(point2.x)  y: \(point2.y)   ")
        }
        */
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        if (touches.anyObject() != nil){
            var touchPoint = touches.anyObject()!.locationInView(self)
            
            var diffx = touchPoint.x - startPoint.x
            var diffy = touchPoint.y - startPoint.y
            
            println("diff  \(diffx) \(diffy) ")
        }
        
    }
    
}
