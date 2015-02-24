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
        addView(view:floorView, tabNum: 0)
        
        //　question編集選択リスト画面
        let questionInputTableView = QuestionInputTableView(frame: UIScreen.mainScreen().bounds)
        questionInputTableView.frame = UIScreen.mainScreen().bounds
        questionInputTableView.dataReload()
        addView(view: questionInputTableView, tabNum: 1)

        //　質問登録画面
        var rect = UIScreen.mainScreen().bounds
        rect.offset(dx: 0, dy: 0)
        var questionInputView = QuestionInputView(frame: rect)
        questionInputView.initWithMode(questionInputViewMode.edit)
        questionInputView.hidden = true
        addView(view: questionInputView, tabNum: 1)

        addViewMove().exec(preView1: floorView, rootViewController: self)
//        pushViewMove().exec(preView1: questionInputTableView, nextView1: floorView, rootViewController: self)
//        self.view.addSubview(cview)
        
    }
    
    // MARK: 画面遷移関連
    /*
    * @abstract viewを追加する
    */
    func addView(#view: UIView, tabNum: NSInteger){

        if anTabs[tabNum] == nil {
            anTabs[tabNum] = []
        }
        
        anTabs[tabNum]?.append(view)
        
        println("-------------------")
        println(" tabNum \(tabNum)  count \(anTabs.count) anTabs \(anTabs[tabNum]?.count)")
        println("-------------------")
        
    }

    
}

extension RootViewController: SideMenuTableViewDelegate{

    func selectRow(row: NSInteger) {

        println("selected row \(row) ")

        
        var views1 = anTabs[row] as anViewArray?
        var view = views1![0] as UIView

        var views2 = anTabs[0] as anViewArray?
        var view2 = views2![0] as UIView


//        var views2 = anTabs[1]
//        var view2 = views2![0]

        
        ChangeCellTrans().exec(preView: view2, nextView: view, rootViewController: self)
        
    }

}


