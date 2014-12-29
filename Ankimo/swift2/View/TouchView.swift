//
//  TouchView.swift
//  swift2
//
//  Created by takeshi on 2014/12/28.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

protocol TouchViewDelegate: class {
    func movePoint(diffy: CGFloat) -> ()
    func finishMove() -> ()
    func releaseTouch() -> ()
}


class TouchView: UIView {

    enum state: Int {
        case normal = 0
        case pull
        case release
        case finish
    }
    
    weak var touchViewDelegate: TouchViewDelegate?
    @IBOutlet weak var frickPointView: UIImageView?
    
    var st = state.normal
    
    var startPoint : CGPoint = CGPointMake(0, 0)

    class func view() -> TouchView {
        var touchView = NSBundle.mainBundle().loadNibNamed("TouchView", owner: self, options: nil)[0] as TouchView
        
        return touchView
    }
    
    func setupViews() {
    
//        frickPointView?.frame
    
    }


    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {

        var touch =  touches.anyObject()? as UITouch
        println(" tag  \(touch.view.tag) ")
        
        if (touches.anyObject() != nil){
            
            var touchPoint = touches.anyObject()!.locationInView(self)

                var pp1 = touchPoint.y > 10 && touchPoint.y < 100
                var pp2 = touchPoint.x > 100 && touchPoint.y < UIScreen.mainScreen().bounds.width - 100
                
                if pp1 && pp2 {
                    st = state.pull
                    startPoint = touches.anyObject()!.locationInView(self)
                }
            
        }
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        if (touches.anyObject() != nil){
        
            var touchPoint = touches.anyObject()!.locationInView(self)
            
            if st == state.pull {
                
                if touchPoint.y < 200 {
                    
                    var diffy = touchPoint.y - startPoint.y
                    touchViewDelegate?.movePoint( moveRate(diffy: diffy) )

                } else {
                    
                    st = state.finish
                    touchViewDelegate?.finishMove()
                
                }
                
            }
            
        }
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {

        st = state.normal
        touchViewDelegate?.releaseTouch()
        
    }
    
    private func moveRate(#diffy: CGFloat) -> CGFloat {
    
        var selfViewHeight = self.frame.height
        var moveRate = diffy / selfViewHeight
        
        
        if moveRate < 0 {
            moveRate = 0
        } else if moveRate > 1 {
            moveRate = 1
        }
        
        println(" moveRate \(moveRate) ")
    
        return moveRate
    
    }
    
}
