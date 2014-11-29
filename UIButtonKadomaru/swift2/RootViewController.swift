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
        
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        let button = UIButton.buttonWithType(.System) as UIButton
        button.frame = CGRectMake(100, 100, 200, 50)
        button.setTitle("ログイン", forState: UIControlState.Normal)
        button.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 1)
        button.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 8
        self.view.addSubview(button)
        
    }

}

