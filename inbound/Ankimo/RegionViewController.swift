//
//  RegionViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/18.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController {

    @IBOutlet weak var regionTableView: UITableView?
    
    var regionArray: [String] = []
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: aDecoder)
     
    }
    
    func setup(){
        regionArray = ["日本 (おすすめ）", "中国", "カナダ", "アメリカ"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // navibar
        self.navigationItem.title = "Logo"
        
        let rightButtonItem = UIBarButtonItem(title: "close", style: .Plain, target: self, action: "pushCloseButton")
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        let naviCon = self.navigationController;
        
        regionTableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func viewWillAppear(animated: Bool) {
        
        let padding = CGFloat(10)
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let buttonWidth = (screenWidth - 4 * padding ) / 3.0
        let buttonHeight = CGFloat(64)

        var pointX = padding
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushCloseButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

extension RegionViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel!.text = regionArray[indexPath.row]
        
        return cell
    }
    
}

extension RegionViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}


