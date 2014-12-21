//
//  FloorView.swift
//  swift2
//
//  Created by takeshi on 2014/12/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit


class FloorView: UIView {

    enum state: Int {
        case normal = 0
        case pull
        case release
    
    }

    var st = state.normal
    
    var cellView = UIView()
    
    var startPoint : CGPoint = CGPointMake(0, 0)
    var posx: CGFloat = 0.0

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }

    override init() {
        super.init()
    }
    
    
    func setupViews(){
    
        cellView.frame = CGRectMake(0, 100, self.bounds.width, 100)
        cellView.backgroundColor = UIColor(red: 0.4, green: 1, blue: 1, alpha: 0.8)
        self.addSubview(cellView)
        
        var bounds = UIScreen.mainScreen().bounds
        //self.frame = CGRectMake(0, 0, 200, 400)
        self.frame = bounds
        
        self.backgroundColor = UIColor(red: 0.9, green: 1.0, blue: 1.0, alpha: 1)
        var rect = CGRectMake(0, bounds.height / 2, bounds.width, bounds.height / 2)
        var view = UIView(frame: rect)
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 0.8, alpha: 1)
        self.addSubview(view)
        
        
        var questionView = QuestionView.view()
        questionView.frame = CGRectMake(0, 50, 320, 100)
        self.addSubview(questionView)
        
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        println(" \(touches.count) ")
        
        
        if (touches.anyObject() != nil){
            
            var point = touches.anyObject()!.locationInView(self)
            
            if point.y > 300 && point.y < 400 && point.x > 100 && point.x < 200 {
            
                st = state.pull
                startPoint = touches.anyObject()!.locationInView(self)
            
            } else {
                st = state.normal
            }
            
            
            
            println("startpoint \(startPoint.x) \(startPoint.y) ")
        }
        
        
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        if (touches.anyObject() != nil){
            
            if st == state.pull {
                
                var touchPoint = touches.anyObject()!.locationInView(self)
                
                var diffx = touchPoint.x - startPoint.x
                var diffy = touchPoint.y - startPoint.y
                
                println("diff  \(diffx) \(diffy) ")
                
                var posy = cellView.frame.origin.y
                var posx = diffy * 2
                
                cellView.frame = CGRectMake(posx, posy, cellView.frame.width, cellView.frame.height)
            
            }
            
        }
        
        
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        if st == state.pull {
            
            UIView.animateWithDuration(0.2 , animations: {() -> Void in
                self.cellView.frame = CGRectMake(0, 100, self.bounds.width, 100)
                
                }, completion: {(Bool) -> Void in
            })
            
        }
        
    }
    
}
