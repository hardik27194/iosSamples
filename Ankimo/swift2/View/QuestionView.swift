//
//  QuestionView.swift
//  swift2
//
//  Created by takeshi on 2014/12/21.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    
    @IBOutlet weak var questionCellView: UIView?
    @IBOutlet weak var answerCellView: UIView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init() {
        super.init()
        
        self.frame = CGRectMake(0, 200, 320, 100)

    }
    
    class func view() -> QuestionView {
        var questionView = NSBundle.mainBundle().loadNibNamed("QuestionView", owner: self, options: nil)[0] as QuestionView
        return questionView
    }

    func moveQuestionView(#movedRate:CGFloat){
        questionCellView!.frame = originx(view: questionCellView!, x: self.bounds.width * movedRate)

    }

    func openQuestion() {
        UIView.animateWithDuration(0.3 , animations: {() -> Void in
            self.moveQuestionView(movedRate: self.bounds.width)
            }, completion: {(Bool) -> Void in
                
        })
    }

    func releaseTouch() {
        UIView.animateWithDuration(0.2 , animations: {() -> Void in
            self.moveQuestionView(movedRate: 0)
            }, completion: {(Bool) -> Void in
        })

    }
    
    func moveBaseView(posx:CGFloat){
        answerCellView!.frame = originx(view: answerCellView!, x: posx)
    }
    
    func originx (#view: UIView ,x: CGFloat) -> CGRect {
        var y = view.frame.origin.y
        var w = view.frame.size.width
        var h = view.frame.size.height
        return CGRectMake(x, y, w, h)
    }
    
}
