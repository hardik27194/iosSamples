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
    func releaseTouch() -> ()
}


class TouchView: UIView {

    enum state: Int {
        case normal = 0
        case pull
        case release
        
    }
    
    weak var touchViewDelegate: TouchViewDelegate?
    
    var st = state.normal
    
    var posx: CGFloat = 0.0
    var startPoint : CGPoint = CGPointMake(0, 0)


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
            super.init(frame: frame)
    }
    
    override init() {
        super.init()
        
        var bounds = UIScreen.mainScreen().bounds
        var rect = CGRectMake(0, bounds.size.height / 2, bounds.size.width, bounds.size.height / 2 )
        self.frame = rect
        self.backgroundColor = UIColor(red: 0.8, green: 1, blue: 0.8, alpha: 1)
        
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        println(" \(touches.count) ")
        startPoint = touches.anyObject()!.locationInView(self)
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        if (touches.anyObject() != nil){
            
            var touchPoint = touches.anyObject()!.locationInView(self)
            
            var diffx = touchPoint.x - startPoint.x
            var diffy = touchPoint.y - startPoint.y
            
            println("diff  \(diffx) \(diffy) ")
            
            touchViewDelegate?.movePoint(diffy)
            
        }
        
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {

        touchViewDelegate?.releaseTouch()
        
    }
    
    
}
