//
//  QuestionInputView.swift
//  ankimo
//
//  Created by takeshi on 2015/01/07.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class QuestionInputView: UIView {

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
        
//        var x:CGFloat = 0, y:CGFloat = 0, w:CGFloat = 0, h:CGFloat = 0
//        
//        var rect = UIScreen.mainScreen().bounds
//        self.frame = rect
        self.backgroundColor = UIColor.orangeColor()
        
        
        
    }
    
}


