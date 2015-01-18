//
//  ViewController.swift
//  swift2
//
//  Created by 島田武史 on 2014/10/14.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override convenience init(){
        self.init(nibName:nil , bundle:nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        
        var floorView = FloorView()
//        self.view.addSubview(floorView)
        
//        let viewMoveProto = ViewMoveProto(frame: self.view.bounds)
//        self.view.addSubview(viewMoveProto)
        
        //　質問リスト
        let questionInputTableView = QuestionInputTableView(frame: UIScreen.mainScreen().bounds)
        self.view.addSubview(questionInputTableView)
        questionInputTableView.frame = UIScreen.mainScreen().bounds
        questionInputTableView.dataReload()


        //　質問登録画面
        var rect = UIScreen.mainScreen().bounds
        rect.offset(dx: 0, dy: 0)
        var questionInputView = QuestionInputView(frame: rect)
        questionInputView.initWithMode(questionInputViewMode.edit)
        questionInputView.hidden = true
        self.view.addSubview(questionInputView)
//        ViewManager.sharedInstance.questionInputView = questionInputView
        
        // ネットワークから読み込み
//        var taskDataManager = TaskDataManager()
//        taskDataManager.exec()
        
    }
    

}

