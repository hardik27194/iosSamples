//
//  QuestionView.swift
//  swift2
//
//  Created by takeshi on 2014/12/21.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
//        super.init(frame: CGRectMake(0, 0, 0, 0))
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

}
