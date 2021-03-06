//
//  FloorView.swift
//  swift2
//
//  Created by takeshi on 2014/12/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

struct customRect {
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var w: CGFloat = 0.0
    var h: CGFloat = 0.0
    
    func rect()->CGRect{
        return CGRectMake(x, y, w, h)
    }
}

class FloorView: BaseView  {
    
    var cellView = UIView()
    var questionViews = Array<QuestionView>()
        
    required override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    override init() {
        super.init()
        
        self.frame = UIScreen.mainScreen().bounds

        makeData()
        setupViews()

    }
    
    func setupViews(){
        
        self.clipsToBounds = true

        self.frame = UIScreen.mainScreen().bounds
        
        var touchView = TouchView()
        touchView.touchViewDelegate = self
        self.addSubview(touchView)

        var questionViewRect = customRect(x: 0, y: 0, w: 0, h: 0);
        questionViewRect.h = 100
        questionViewRect.y = UIScreen.mainScreen().bounds.height / 2 - questionViewRect.h
        questionViewRect.w = UIScreen.mainScreen().bounds.width
        
        var manager = QuestionDataManager.sharedInstance
        var questions = manager.allObjects()
        
        for i in 0...2 {
            var questionView = QuestionView.view()
            questionView.frame = questionViewRect.rect()
            
            var question = manager.find(i)
            questionView.setupViews(question!)
            
            self.addSubview(questionView)
            questionViews.append(questionView)
            questionViewRect.y = questionViewRect.y - questionViewRect.h
        }
        
    }
    
    func makeData() {
    
        var manager = QuestionDataManager.sharedInstance
        manager.makeData()
    }
    
    func adjustQuestionView() {

        var rect = customRect(x: 0, y: 0, w: 0, h: 0);
        rect.h = 100
        rect.y = UIScreen.mainScreen().bounds.height / 2 - rect.h
        rect.w = UIScreen.mainScreen().bounds.width
        
        for questionView in questionViews {
            questionView.frame = CGRectMake(rect.x, rect.y, rect.w, rect.h)
            rect.y = rect.y - rect.h
        }

    
    }
}

extension FloorView : TouchViewDelegate {
 
    func movePoint(moveDistance: CGFloat) {
        self.questionViews[0].moveQuestionView(movedRate: moveDistance)
    }
    
    func enterOpenArea () {
        self.questionViews[0].openQuestion()
    }
    
    func releaseTouch() {
        self.questionViews[0].releaseTouch()
    }

    func releaseTouchInFinishArea(AreaNo:Int) {
        self.questionViews[0].endBaseView()
        
        var tmp = questionViews[0]
        questionViews.removeAtIndex(0)
        questionViews.append(tmp)
        tmp.hidden = true
        
        UIView.animateWithDuration(0.3 , animations: {() -> Void in
            self.adjustQuestionView()
            }, completion: {(Bool) -> Void in
                    self.questionViews.last!.hidden = false
        })
        
        
    }
    
}
