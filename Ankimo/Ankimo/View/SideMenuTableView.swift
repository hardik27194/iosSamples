//
//  SideMenuTableView.swift
//  ankimo
//
//  Created by takeshi on 2015/01/07.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit
import Realm

protocol SideMenuTableViewDelegate{
    
    func selectRow(row: NSInteger)

}


class SideMenuTableView: UIView {
    
    var tblview = UITableView()
    var sideMenus: [String] = []

    var delegate: SideMenuTableViewDelegate! = nil
    
    required override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    override init() {
        super.init()
    }
    
    override func didMoveToSuperview() {
//        ViewImperator.sharedInstance.sideMenuTableView = self
    }

    func setupViews(){

        self.sideMenus.append("テスト")
        self.sideMenus.append("テスト入力")
        self.sideMenus.append("設定")
        
        tblview.frame = CGRectMake(0, 60, self.frame.width, self.frame.height - 60)
        tblview.delegate = self
        tblview.dataSource = self
        addSubview(tblview)
        tblview.reloadData()
        
    }

}

// MARK: - UITableViewDelegate -
extension SideMenuTableView : UITableViewDelegate ,UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sideMenus.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(self.sideMenus[indexPath.row])"
        cell.contentView.backgroundColor = UIColor.grayColor()
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("touch index row \(indexPath.row)" )
        
        delegate.selectRow(indexPath.row)
        
//        var viewImperator = ViewImperator.sharedInstance
//        viewImperator.changeCurrentTab(indexPath.row-1)
//        viewImperator.frickMoveClose()
        
    }

}




