//
//  QuestionInputView.swift
//  ankimo
//
//  Created by takeshi on 2015/01/07.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

enum questionInputViewMode {
    case register
    case edit
}

class QuestionInputView: UIView {

    var mode = questionInputViewMode.register
    
    let questionText = UITextField()
    let answerText = UITextField()
    let dispSwitch = UISwitch()
    
    var startPoint : CGPoint = CGPointMake(0, 0)

    var buttonString = ""

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    override init() {
        super.init()

    }
    
    override func didMoveToSuperview() {
        ViewManager.sharedInstance.questionInputView = self
    }

    func initWithMode (mode: questionInputViewMode){
    

        if mode == questionInputViewMode.register {
            
            buttonString = NSLocalizedString("buttonStringRegister", comment: "")
            dispSwitch.hidden = true
            
        } else if mode == questionInputViewMode.edit {
        
            buttonString = NSLocalizedString("buttonStringEdit", comment: "")
            dispSwitch.hidden = false
            
        }

        setupViews()
        

    }
    
    
    func setupViews(){
        
        self.clipsToBounds = true

        self.backgroundColor = UIColor.orangeColor()

        let rightPadding = 10.0 as CGFloat
        let leftPadding = rightPadding
        let textHeight = 30.0 as CGFloat
        let verticalPadding = 20.0 as CGFloat
        let titleWidth = 100.0 as CGFloat
        
        // Question Label
        let questionLabelY = 50.0 as CGFloat
        let questionLabel = UILabel()
        var questionLabelRect = customRect(x:leftPadding, y:questionLabelY, w:titleWidth, h:textHeight)
        questionLabel.frame = questionLabelRect.rect()
        questionLabel.text = "問い"
        self.addSubview(questionLabel)
        
        // Question Text
        let questionX = CGRectGetMaxX(questionLabel.frame)
        let questionY = CGRectGetMinY(questionLabel.frame)
        let questionW = self.bounds.width - rightPadding - CGRectGetMaxX(questionLabel.frame)
        questionText.frame = CGRectMake(questionX, questionY, questionW, textHeight)
        questionText.borderStyle = UITextBorderStyle.RoundedRect
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
        answerText.borderStyle = UITextBorderStyle.RoundedRect
        answerText.layer.cornerRadius = 5.0
        self.addSubview(answerText)
        
        // disp switch Label
        let dispSwitchLabel = UILabel()
        let dispSwitchLabelY = CGRectGetMaxY(answerText.frame) + verticalPadding
        dispSwitchLabel.frame = CGRectMake(leftPadding, dispSwitchLabelY, titleWidth, textHeight)
        dispSwitchLabel.text = "表示"
        self.addSubview(dispSwitchLabel)
        
        // disp Switch
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
        registerButton.setTitle(buttonString, forState: UIControlState.Normal)
        registerButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        registerButton.addTarget(self, action: "registerButtonPush", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(registerButton)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var manager = ViewManager.sharedInstance
        manager.settingView(preView: self, nextView: manager.questionInputTableView)
        if (touches.anyObject() != nil){
            var touch =  touches.anyObject()? as UITouch
            startPoint = touches.anyObject()!.locationInView(self)
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if (touches.anyObject() != nil){
            var touchPoint = touches.anyObject()!.locationInView(self)
            var diffy = touchPoint.x - startPoint.x 
            var manager = ViewManager.sharedInstance
            manager.frickMoveView(moveDistance: diffy)
        }
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if (touches.anyObject() != nil){
            var manager = ViewManager.sharedInstance
            manager.frickMoveReturn()
        }
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
        question.createDate = NSDate()
        question.modifyDate = NSDate()
        question.id = maxid + 1
        
        manager.registQuestion(question)
     
        questionText.text = ""
        answerText.text = ""
        
        var questionInputTableView = ViewManager.sharedInstance.questionInputTableView
        ViewManager.sharedInstance.popView(preView: self, nextView: questionInputTableView)

    }
    
}


