//
//  QuestionInputView.swift
//  ankimo
//
//  Created by takeshi on 2015/01/07.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class QuestionInputView: UIView {

//    struct rect {
//        x:CGFloat = 0 as CGFloat,
//        y:CGFloat = 0 as CGFloat,
//        w:CGFloat = 0 as CGFloat,
//        h:CGFloat = 0 as CGFloat
//    }
    
    let questionText = UITextField()
    let answerText = UITextField()

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
        self.backgroundColor = UIColor.orangeColor()

        let rightPadding = 10.0 as CGFloat
        let leftPadding = rightPadding
        let textHeight = 30.0 as CGFloat
        let verticalPadding = 20.0 as CGFloat
        let titleWidth = 100.0 as CGFloat
        
        // Question Label
        let questionLabelY = 50.0 as CGFloat
        let questionLabel = UILabel()
        questionLabel.frame = CGRectMake(leftPadding, questionLabelY, titleWidth, textHeight)
        questionLabel.text = "問い"
        self.addSubview(questionLabel)
        
        // Question Text
        let questionX = CGRectGetMaxX(questionLabel.frame)
        let questionY = CGRectGetMinY(questionLabel.frame)
        let questionW = self.bounds.width - rightPadding - CGRectGetMaxX(questionLabel.frame)
        questionText.frame = CGRectMake(questionX, questionY, questionW, textHeight)
        questionText.backgroundColor = UIColor.whiteColor()
        questionText.layer.cornerRadius = 5.0
        self.addSubview(questionText)
        
        // Answer Label
        let answerLabel = UILabel()
        let answerLabelY = CGRectGetMaxY(questionLabel.frame) + verticalPadding
        answerLabel.frame = CGRectMake(leftPadding, answerLabelY, titleWidth, textHeight)
        answerLabel.text = "答え"
        self.addSubview(answerLabel)
        
        // Answer Text
        let answerX = CGRectGetMaxX(answerLabel.frame)
        let answerY = CGRectGetMinY(answerLabel.frame)
        let answerW = self.bounds.width - rightPadding - CGRectGetMaxX(answerLabel.frame)
        answerText.frame = CGRectMake(answerX, answerY, answerW, textHeight)
        answerText.backgroundColor = UIColor.whiteColor()
        answerText.layer.cornerRadius = 5.0
        self.addSubview(answerText)
        
        // disp switch Label
        let dispSwitchLabel = UILabel()
        let dispSwitchLabelY = CGRectGetMaxY(answerText.frame) + verticalPadding
        dispSwitchLabel.frame = CGRectMake(leftPadding, dispSwitchLabelY, titleWidth, textHeight)
        dispSwitchLabel.text = "表示"
        self.addSubview(dispSwitchLabel)
        
        // disp Switch
        let dispSwitch = UISwitch()
        let dispSwitchX = CGRectGetMaxX(dispSwitchLabel.frame)
        let dispSwitchY = CGRectGetMaxY(answerText.frame) + verticalPadding
        let dispSwitchW = 100.0 as CGFloat
        let dispSwitchH = textHeight
        dispSwitch.frame = CGRectMake(dispSwitchX, dispSwitchY, dispSwitchW, dispSwitchH)
        self.addSubview(dispSwitch)
        
        // register button
        let registerButton = UIButton()
        let registerButtonY = CGRectGetMaxY(dispSwitchLabel.frame) + verticalPadding
        let registerButtonW = CGRectGetWidth(self.frame) - leftPadding - rightPadding
        registerButton.frame = CGRectMake(leftPadding, registerButtonY, registerButtonW, textHeight * 1.5)
        registerButton.backgroundColor = UIColor(red: 0.8, green: 1, blue: 1, alpha: 1)
        registerButton.layer.cornerRadius = 5.0
        registerButton.setTitle("登録", forState: UIControlState.Normal)
        registerButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        registerButton.addTarget(self, action: "registerButtonPush", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(registerButton)
        
    }
 
    func frameRect(frame:CGRect, x:CGFloat? ,y:CGFloat?) -> CGRect {
        var returnRect = frame
        if (x != nil){
            returnRect = CGRectMake(x!, frame.origin.y, frame.size.width, frame.size.height)
        }
        if (y != nil){
            returnRect = CGRectMake(frame.origin.x, y!, frame.size.width, frame.size.height)
        }
        
        return returnRect
    }
    
    func registerButtonPush(){

        let manager = QuestionDataManager.sharedInstance
    
        var maxid = manager.maxId()
        
        var question = Question()
        question.questionText = questionText.text
        question.answerText = answerText.text
        question.id = maxid + 1
        
        manager.registQuestion(question)
        
    }
    
}


