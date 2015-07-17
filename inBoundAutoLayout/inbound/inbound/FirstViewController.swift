//
//  FirstViewController.swift
//  inbound
//
//  Created by takeshi on 2015/07/16.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var scrollView:UIScrollView!
    @IBOutlet var itemParentView:UIView!
    @IBOutlet var itemView1:UIView!
    @IBOutlet var itemView2:UIView!
    @IBOutlet var itemView3:UIView!
    @IBOutlet var itemView4:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.4)
        let width = UIScreen.mainScreen().bounds.width
        scrollView.frame = CGRectMake(0, 50, width, 300)
        scrollView.contentSize = CGSizeMake(width, 1300)
        
        
        NSLog("self.view.subviews %@ ", self.view.subviews)
        
        NSLog("self.scrollView.subviews %@ ", self.scrollView.subviews)
        
        NSLog("---------------------------")
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

//        applyAutoLayout()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func applyAutoLayout(){
    
        // constraint for itemParentView
        itemParentView.addConstraints(
            [
                NSLayoutConstraint (item: itemParentView,
                    attribute: .Top,
                    relatedBy: .Equal,
                    toItem: scrollView,
                    attribute: .Top,
                    multiplier: 1.0,
                    constant: 10.0),
                NSLayoutConstraint (item: itemParentView,
                    attribute: .Leading,
                    relatedBy: .Equal,
                    toItem: scrollView,
                    attribute: .Leading,
                    multiplier: 1.0,
                    constant: 10.0),
                NSLayoutConstraint (item: itemParentView,
                    attribute: .Bottom,
                    relatedBy: .Equal,
                    toItem: scrollView,
                    attribute: .Bottom,
                    multiplier: 1.0,
                    constant: 10.0),
                NSLayoutConstraint (item: itemParentView,
                    attribute: .Height,
                    relatedBy: .Equal,
                    toItem: nil,
                    attribute: .Height,
                    multiplier: 1.0,
                    constant: 400.0)
            ]
        )
        
        
    }
    

}

