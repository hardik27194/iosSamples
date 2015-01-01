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
    func endBaseView() -> ()
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
    weak var frickPointView: UIView?
    
    var st = state.normal
    
    var startPoint : CGPoint = CGPointMake(0, 0)

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override init() {
        super.init()
        
        self.frame = UIScreen.mainScreen().bounds
        
        setupViews()
        
    }
    
    func setupViews() {
        
        var rect = CGRectMake(0, 0, 0, 0)
        frickPointView = UIView(frame: rect)
        
    
    }


    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {

        
        if (touches.anyObject() != nil){
            
            var touch =  touches.anyObject()? as UITouch
            
            if touch.view.tag == 1002 {
                st = state.pull
                startPoint = touches.anyObject()!.locationInView(self)
            }
            
        }
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        if (touches.anyObject() != nil){
        
            var touchPoint = touches.anyObject()!.locationInView(self)
        
            
            if st == state.pull {

                frickPointView?.center = touchPoint

                
                if touchPoint.y < 200 {
                    
                    var diffy = touchPoint.y - startPoint.y
                    touchViewDelegate?.movePoint( moveRate(diffy: diffy) )

                } else if touchPoint.y < 250 {

                    st = state.finish
                    touchViewDelegate?.finishMove()
                    
                } else {
                
                }
                
            }
            
            
            if touchPoint.y > 250 && touchPoint.y < 300 {
                touchViewDelegate?.endBaseView()
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
