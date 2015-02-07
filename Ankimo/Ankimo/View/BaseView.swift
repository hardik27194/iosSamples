//
//  BaseView.swift
//  Ankimo
//
//  Created by takeshi on 2015/01/29.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class BaseView: UIView {

    var startPoint : CGPoint = CGPointMake(0, 0)

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var viewImperator = ViewImperator.sharedInstance
        viewImperator.settingView(preView: self, nextView: viewImperator.questionInputTableView)
        if (touches.anyObject() != nil){
            var touch =  touches.anyObject()? as UITouch
            startPoint = touches.anyObject()!.locationInView(self)
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if (touches.anyObject() != nil){
            var touchPoint = touches.anyObject()!.locationInView(self)
            var diffy = touchPoint.x - startPoint.x
            var viewImperator = ViewImperator.sharedInstance
            viewImperator.frickMoveView(moveDistance: diffy)
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if (touches.anyObject() != nil){
            var viewImperator = ViewImperator.sharedInstance
            viewImperator.frickMoveReturn()
        }
    }
    

    
    
}
