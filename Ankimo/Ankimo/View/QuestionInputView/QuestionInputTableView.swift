//
//  QuestionInputTableView.swift
//  ankimo
//
//  Created by takeshi on 2015/01/07.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit
import Realm

class QuestionInputTableView: UIView, UITableViewDelegate ,UITableViewDataSource {
    
    var questions: RLMResults? = nil
    var questionDataManager = QuestionDataManager()
    var tblview = UITableView()

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

//        tableView.registerClass(testCustomViewCell.classForCoder(), forCellReuseIdentifier: "testCustomViewCell")

    }

    func dataReload(){

        tblview.frame = self.frame
        tblview.delegate = self
        tblview.dataSource = self
        self.addSubview(tblview)

        
        questionDataManager = QuestionDataManager.sharedInstance
        questions = questionDataManager.allObjects()
        
        tblview.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(" Int(questionDataManager.allObjectCount()) : \(Int(questionDataManager.allObjectCount())) ")
        return Int(questionDataManager.allObjectCount())
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let manager = QuestionDataManager.sharedInstance
        let question = manager.objectAtIndex(indexPath.row)
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel.text = "\(question.questionText)"
        //        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        //        cell.detailTextLabel.text = "Subtitle index : \(indexPath.row)"
        return cell

    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }
    
}

//class QuestionInputTableView: UIView {




