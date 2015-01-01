//
//  ViewController.swift
//  swift2
//
//  Created by 島田武史 on 2014/10/14.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import Foundation
import UIKit


class RootViewController: UIViewController {

    var label = UILabel()

    override convenience init(){
        self.init(nibName:nil , bundle:nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.label = UILabel()
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        var x, y, w, h : CGFloat;
        (x, y, w, h) = (0,0,0,0)
        
        var padding : CGFloat = 10
        x = padding
        y = 70 // toolbar
        var labelFont = UIFont(name: "HelveticaNeue-Bold", size: 20)
        w = UIScreen.mainScreen().bounds.size.width - padding * 2
        h = labelFont!.lineHeight + 10
        label.font = labelFont
        label.frame = CGRectMake( x, y, w, h)
        label.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.2)
        label.text = "SVProgressHUD"
        self.view.addSubview(label)

        (x, y, w, h) = (100,150,100,50)
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(x, y, w, h)
        button.setTitle("start", forState: UIControlState.Normal)
        button.addTarget(self, action: "ExecNotification", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)

        
    }

    

}

