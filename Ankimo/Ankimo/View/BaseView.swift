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

    var sideMenuTableView = SideMenuTableView(frame: UIScreen.mainScreen().bounds)

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if (touches.anyObject() != nil){
            var touch =  touches.anyObject()? as UITouch
            startPoint = touches.anyObject()!.locationInView(self)
            
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if (touches.anyObject() != nil){
            var touchPoint = touches.anyObject()!.locationInView(self)
            var diffy = touchPoint.x - startPoint.x
            
            var posx = diffy + self.frame.origin.x
            self.frame = CGRectMake(posx, self.frame.origin.y, self.frame.size.width, self.frame.size.height)

            
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if (touches.anyObject() != nil){
            frickMoveReturn()
        }
    }
    
    func frickMoveReturn(){

        var isSideBarOpen = false
        
        var endPointX = 0.0 as CGFloat
        if isSideBarOpen {
            if self.frame.origin.x > UIScreen.mainScreen().bounds.size.width - 130 {
                endPointX = UIScreen.mainScreen().bounds.size.width - 80
            }
            
        } else {
            if self.frame.origin.x > 50 {
                endPointX = UIScreen.mainScreen().bounds.size.width - 80
            }
        }
        
        UIView.animateWithDuration(
            0.1,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                self.frame = CGRectMake(endPointX, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
            },
            completion: {(bool: Bool) -> Void in
                isSideBarOpen = (self.frame.origin.x > 100)
                
            }
        )
        
    }

    
}
