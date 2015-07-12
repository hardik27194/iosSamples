//
//  FirstViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/06.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
        
        
        let scrollView = UIScrollView()
        scrollView.frame = CGRectMake( 0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))
        scrollView.backgroundColor = UIColor(red:0.6, green:0.5, blue:0.0, alpha:1.0)
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 800)
        
        self.view.addSubview(scrollView)
        

    }
    

}
