//
//  TouchView.swift
//  swift2
//
//  Created by takeshi on 2014/12/28.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit
import Realm

protocol TouchViewDelegate: class {
    func movePoint(diffy: CGFloat) -> ()
    func enterOpenArea() -> ()
    func releaseTouchInFinishArea(AreaNo:Int) -> ()
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
    let frickCenterView = UIView()
    let moveAreaView = UIView()
    let openAreaView = UIView()
    var squareViews = [UIView]()
    
    var x:CGFloat = 0, y:CGFloat = 0, w:CGFloat = 0, h:CGFloat = 0
    
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
        x = 0 as CGFloat
        h = UIScreen.mainScreen().bounds.height / 2
        y = UIScreen.mainScreen().bounds.height / 2
        w = UIScreen.mainScreen().bounds.width
        self.frame = CGRectMake(x, y, w, h)

        // moveArea view
        x = 0 as CGFloat
        y = 0 as CGFloat
        h = CGRectGetHeight(self.frame) * 0.5
        w = CGRectGetWidth(self.frame)
        moveAreaView.frame = CGRectMake(x, y, w, h)
        moveAreaView.backgroundColor = UIColor.yellowColor()
        self.addSubview(moveAreaView)
        
        // オープンエリア view
        x = 0 as CGFloat
        y = CGRectGetMaxY(moveAreaView.frame)
        h = CGRectGetHeight(self.frame) - y
        w = CGRectGetWidth(self.frame)
        openAreaView.frame = CGRectMake(x, y, w, h)
        openAreaView.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(openAreaView)
        
        // 落とすところ
        let colors = [
            UIColor(red: 0, green: 1, blue: 1, alpha: 1),
            UIColor(red: 1, green: 0, blue: 1, alpha: 1),
            UIColor(red: 1, green: 1, blue: 0, alpha: 1),
            UIColor(red: 1, green: 0, blue: 0, alpha: 1),
        ]
        
        for i in 0...3 {
            let squareHeight = 90.0 as CGFloat
            w = CGRectGetWidth(self.frame) / 4
            x = CGRectGetMinX(self.frame) + CGFloat(i) * w
            y = CGRectGetHeight(self.frame) - squareHeight
            h = squareHeight
            let squareView = UIView()
            squareView.tag = 2000 + i
            squareView.frame = CGRectMake(x, y, w, h)
            squareView.backgroundColor = colors[i]
            
            self.addSubview(squareView)
            squareViews.append(squareView)
        }

        // フリック画像
        w = 60 as CGFloat
        h = 60 as CGFloat
        x = self.frame.width / 2 - w / 2
        y = 30.0 as CGFloat
        let frickImage = UIImage(named: "frickPointView")
        frickPointView = UIImageView(frame: CGRectMake(x, y, w, h))
        frickPointView.image = frickImage
        frickPointView.userInteractionEnabled = true
        frickPointView.tag = 1002
        self.addSubview(frickPointView)
        
        // フリック中心
        x = frickPointView.center.x
        y = frickPointView.center.y
        h = 1 as CGFloat
        w = 1 as CGFloat
        frickCenterView.frame = CGRectMake(x, y, w, h)
        frickCenterView.backgroundColor = UIColor.whiteColor()
        self.addSubview(frickCenterView)
        
    }


    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        ViewManager.sharedInstance.changeCurrentTab(1)
        
        
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

            frickPointView.center = touchPoint
            frickCenterView.center = touchPoint

            if CGRectIntersectsRect(frickCenterView.frame, moveAreaView.frame) {
                var diffy = touchPoint.y - startPoint.y
                touchViewDelegate?.movePoint( moveRate(diffy: diffy) )
                
            } else if CGRectIntersectsRect(frickCenterView.frame, openAreaView.frame) {
                touchViewDelegate?.enterOpenArea()
                
            }
            
        }
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        if CGRectIntersectsRect(frickCenterView.frame, squareViews[0].frame) {
            touchViewDelegate?.releaseTouchInFinishArea(0)
            
        } else if CGRectIntersectsRect(frickCenterView.frame, squareViews[1].frame) {
            touchViewDelegate?.releaseTouchInFinishArea(1)
            
        } else if CGRectIntersectsRect(frickCenterView.frame, squareViews[2].frame) {
            touchViewDelegate?.releaseTouchInFinishArea(2)
            
        } else if CGRectIntersectsRect(frickCenterView.frame, squareViews[3].frame) {
            touchViewDelegate?.releaseTouchInFinishArea(3)
            
        } else {
            touchViewDelegate?.releaseTouch()
        }

        UIView.animateWithDuration(0.1, animations: {() -> Void in
            self.frickPointView.center = CGPointMake(self.center.x, 30)
            self.frickCenterView.center = CGPointMake(self.center.x, 30)
        })
        
    }
    
    private func moveRate(#diffy: CGFloat) -> CGFloat {
    
        var selfViewHeight = moveAreaView.frame.height
        var moveRate = 0.7 * diffy / selfViewHeight
        
        if moveRate < 0 {
            moveRate = 0
        } else if moveRate > 1 {
            moveRate = 1
        }
        
        println(" moveRate \(moveRate) ")
    
        return moveRate
    
    }
    
}
