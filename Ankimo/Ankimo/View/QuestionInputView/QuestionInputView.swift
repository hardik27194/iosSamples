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

class QuestionInputView: BaseView {

    var mode = questionInputViewMode.register
    
    var question: Question? = nil
    
    let noLabel = UILabel()
    let questionText = UITextField()
    let answerText = UITextField()
    let dispSwitch = UISwitch()
    
    var buttonString = ""
    
    var callback: (()->())? = nil
    
    required override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init() {
        super.init()

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

        var x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat = 0
        
        // No Label
        x = leftPadding
        y = 50.0 as CGFloat
        w = titleWidth
        h = textHeight
        let noTitleLabel = UILabel()
        noTitleLabel.frame = CGRectMake(x, y, w, h)
        noTitleLabel.text = "No"
        self.addSubview(noTitleLabel)
        
        // No Text
        x = CGRectGetMaxX(noTitleLabel.frame)
        y = CGRectGetMinY(noTitleLabel.frame)
        w = self.bounds.width - rightPadding - CGRectGetMaxX(noTitleLabel.frame)
        noLabel.frame = CGRectMake(x, y, w, h)
        self.addSubview(noLabel)

        noLabel.text = "nolabel"//sdf
        
        // Question Label
        y = CGRectGetMaxY(noLabel.frame)
        let questionLabel = UILabel()
        var questionLabelRect = customRect(x:leftPadding, y:y, w:titleWidth, h:textHeight)
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
        registerButton.addTarget(self, action: "pushRegisterButton", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(registerButton)

        // return button
        let returnButton = UIButton()
        let returnButtonY = CGRectGetMaxY(registerButton.frame) + verticalPadding
        let returnButtonW = CGRectGetWidth(self.frame) - leftPadding - rightPadding
        returnButton.frame = CGRectMake(leftPadding, returnButtonY, returnButtonW, textHeight * 1.5)
        returnButton.backgroundColor = UIColor(red: 0.8, green: 1, blue: 1, alpha: 1)
        returnButton.layer.cornerRadius = 5.0
        returnButton.setTitle("戻る", forState: UIControlState.Normal)
        returnButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        returnButton.addTarget(self, action: "pushReturnButton", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(returnButton)

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
    
    func setupTextField(no: Int){

        let manager = QuestionDataManager.sharedInstance
        question = manager.find(no)

        if question != nil {
            noLabel.text = "\(question!.id)"
        }
        questionText.text = question?.questionText
        answerText.text = question?.answerText
        
    }
    
    func pushRegisterButton(){

        let manager = QuestionDataManager.sharedInstance
    
//        var maxid = manager.maxId()
        
        var chengedQuestion = Question()
        chengedQuestion.questionText = questionText.text
        chengedQuestion.answerText = answerText.text
        chengedQuestion.createDate = NSDate()
        chengedQuestion.modifyDate = NSDate()
        chengedQuestion.id = self.question!.id
        
        manager.registQuestion(chengedQuestion)
     
        questionText.text = ""
        answerText.text = ""
        
    }
    
    func pushReturnButton(){
        self.callback?()
    }
    
}


