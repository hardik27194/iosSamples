//
//  FloorView.swift
//  swift2
//
//  Created by takeshi on 2014/12/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit


class FloorView: UIView  {
    
    struct customRect {
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        var w: CGFloat = 0.0
        var h: CGFloat = 0.0
    }
    
    var cellView = UIView()
//    var questionView = QuestionView()
    var questionViews = Array<QuestionView>()
        
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
    
    
    func setupViews(){
        
        self.frame = UIScreen.mainScreen().bounds
        
        var rect = customRect(x: 0, y: 0, w: 0, h: 0);
        rect.h = UIScreen.mainScreen().bounds.height / 2
        rect.y = UIScreen.mainScreen().bounds.height / 2
        rect.w = UIScreen.mainScreen().bounds.width
        
        var touchView = TouchView.view()
        touchView.frame = CGRectMake(rect.x, rect.y, rect.w, rect.h)
        touchView.touchViewDelegate = self
        self.addSubview(touchView)
        
        rect.h = 100
        rect.y = UIScreen.mainScreen().bounds.height / 2 - rect.h
        rect.w = UIScreen.mainScreen().bounds.width
        
        for i in 0...5 {
            var questionView = QuestionView.view()
            questionView.frame = CGRectMake(rect.x, rect.y, rect.w, rect.h)
            self.addSubview(questionView)
            questionViews.append(questionView)
            rect.y = rect.y - rect.h
        }
        
    }
}

extension FloorView : TouchViewDelegate {
 
    func movePoint(moveDistance: CGFloat) {
        questionViews[0].moveQuestionView(movedRate: moveDistance)
    }
    
    func finishMove () {
        self.questionViews[0].openQuestion()
    }
    
    func releaseTouch() {
        self.questionViews[0].releaseTouch()
    }

}
