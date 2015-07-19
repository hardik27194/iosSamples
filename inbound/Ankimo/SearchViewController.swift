//
//  SearchViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/18.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var hotKeyword1: UIButton?
    @IBOutlet weak var hotKeyword2: UIButton?
    @IBOutlet weak var hotKeyword3: UIButton?
    @IBOutlet weak var HotKeywordButton: UIButton?
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // navibar
        self.navigationItem.title = "Logo"
//        
//        let leftButtonItem = UIBarButtonItem(title: "地域↓", style: .Plain, target: self, action: "onClickMyButton")
//        self.navigationItem.leftBarButtonItem = leftButtonItem
        
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
        var pointY = CGFloat(100)
        hotKeyword1?.frame = CGRectMake(pointX, pointY, buttonWidth, buttonHeight)
        
        pointX = CGRectGetMaxX(hotKeyword1!.frame) + padding
        hotKeyword2?.frame = CGRectMake(pointX, pointY, buttonWidth, buttonHeight)
        
        pointX = CGRectGetMaxX(hotKeyword2!.frame) + padding
        hotKeyword3?.frame = CGRectMake(pointX, pointY, buttonWidth, buttonHeight)
        
        HotKeywordButton?.frame = CGRectMake(
            padding,
            HotKeywordButton!.frame.origin.y,
            screenWidth - 2.0 * padding,
            HotKeywordButton!.frame.size.height)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushCloseButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    

}
