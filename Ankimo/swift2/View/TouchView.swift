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

    struct customRect {
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        var w: CGFloat = 0.0
        var h: CGFloat = 0.0
    }

    enum state: Int {
        case normal = 0
        case pull
        case release
        case finish
    }
    
    weak var touchViewDelegate: TouchViewDelegate?
    var frickPointView = UIImageView()
    
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
        
        setupViews()
    }
    
    func setupViews() {
        
        // このView
        var selfviewRect = customRect(x: 0, y: 0, w: 0, h: 0);
        selfviewRect.h = UIScreen.mainScreen().bounds.height / 2
        selfviewRect.y = UIScreen.mainScreen().bounds.height / 2
        selfviewRect.w = UIScreen.mainScreen().bounds.width
        self.frame = CGRectMake(selfviewRect.x, selfviewRect.y, selfviewRect.w, selfviewRect.h)
        
        // フリック画像
        let frickImage = UIImage(named: "frickPointView")
        frickPointView = UIImageView(frame: frickPointViewFirstRect())
        frickPointView.image = frickImage
        frickPointView.userInteractionEnabled = true
        frickPointView.tag = 1002
        self.addSubview(frickPointView)
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
        
            println("\(st.rawValue)")
            if st == state.pull {

                frickPointView.center = touchPoint

                
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
        frickPointView.frame = frickPointViewFirstRect()
        touchViewDelegate?.releaseTouch()
        
    }
    
    private func frickPointViewFirstRect () -> CGRect {
        let w = 60 as CGFloat
        let h = 60 as CGFloat
        let x = self.frame.width / 2 - w / 2
        let y = 50.0 as CGFloat
        let rect = CGRectMake(x, y, w, h)
        return rect
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
