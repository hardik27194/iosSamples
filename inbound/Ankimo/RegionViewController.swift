//
//  RegionViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/18.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController {

//    @IBOutlet weak var HotKeywordButton: UIButton?
    
    var regionArray: [String] = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        var regionArray = ["日本", "中国", "カナダ", "アメリカ"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // navibar
        self.navigationItem.title = "Logo"
        
        let rightButtonItem = UIBarButtonItem(title: "close", style: .Plain, target: self, action: "pushCloseButton")
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        let naviCon = self.navigationController;

        
        
        

        // Do any additional setup after loading the view.
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
        
        return cell
    }
    
}

extension RegionViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}


