//
//  ViewController.swift
//  swift2
//
//  Created by 島田武史 on 2014/10/14.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    typealias anViewArray = [UIView]
    var anViews: anViewArray = []
    var anTabs: [NSInteger: anViewArray] = [:]

    var currentView = UIView()
    var currentTabNum: Int = 0
    
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
                
        let sideMenuTableView = SideMenuTableView(frame: UIScreen.mainScreen().bounds)
        sideMenuTableView.delegate = self
        self.view.addSubview(sideMenuTableView)
        
        // 設問view
        var floorView = FloorView()
        var questionInputView = QuestionInputView(frame: UIScreen.mainScreen().bounds)
        let questionInputTableView = QuestionInputTableView(frame: UIScreen.mainScreen().bounds)
        
        //　質問登録画面
        questionInputView.initWithMode(questionInputViewMode.edit)
        questionInputView.callback = {
            self.popView()
            questionInputTableView.dataReload()
        }
        questionInputView.hidden = true
        
        //　question編集選択リスト画面
        questionInputTableView.dataReload()
        questionInputTableView.callback = {(row:Int) -> () in
            println("row  \(row)")
            
            questionInputView.setupTextField(row)
            self.pushView(view: questionInputView)
        }

        // タブに登録
        addView(view:floorView, tabNum: 0)
        addView(view: questionInputTableView, tabNum: 1)

        // 画面表示
        addViewMove().exec(addView: floorView, rootViewController: self)
        
    }
    
    // MARK: 画面遷移関連
    /*
    * @abstract viewを追加する
    */
    func addView(#view: UIView, tabNum: NSInteger){
        if anTabs[tabNum] == nil {
            anTabs[tabNum] = []
        }
        self.anTabs[tabNum]?.append(view)
    }
    
    func pushView(#view: UIView){
        addView(view: view, tabNum: self.currentTabNum)
        PushViewTrans().exec(preView1: currentView, nextView1: view, rootViewController:self)
    }

    func popView(){
        
        var currentView = self.anTabs[self.currentTabNum]?.last as UIView!
        self.anTabs[self.currentTabNum]?.removeLast()
        let view = self.anTabs[self.currentTabNum]?.last as UIView!
        PopViewTrans().exec(preView1: currentView, nextView1: view, rootViewController:self)
    }
}

// MARK: SideMenuTableViewDelegate
extension RootViewController: SideMenuTableViewDelegate {

    func selectRow(row: NSInteger) {

        self.currentTabNum = row
        
        var selectedTabsViews = self.anTabs[row]! as anViewArray
        var selectedTabsView = selectedTabsViews.last! as UIView
        
        let posX = self.currentView.frame.origin.x
        ChangeCellTrans().exec(view: selectedTabsView, startPositionX: posX , rootViewController: self)
        currentView = selectedTabsView
        
    }

}


