//
//  FirstViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/06.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
        
        
//        let scrollView = UIScrollView()
//        scrollView.frame = CGRectMake( 0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))
//        scrollView.backgroundColor = UIColor(red:0.6, green:0.5, blue:1.0, alpha:1.0)
//        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 800)
//        
//        self.view.addSubview(scrollView)
        
        
//        let itemView = ItemView(frame: CGRectMake(10, 10, 100, 100))
//        self.view.addSubview(itemView)
        
//        let itemView2 = ItemView2.instance()
//        scrollView.addSubview(itemView2)
        
        
//        let view = NSBundle.mainBundle().loadNibNamed("ItemView2", owner: self, options: nil).first as ItemView2



        
//        let itemView3:ItemView3 = ItemView3()
//        itemView3.frame = CGRectMake(50, 50, 50, 50)

        let padding = UIEdgeInsetsMake(20, 20, 0, 20)
        
        
        let itemView3 = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.view.addSubview(itemView3)

        let itemView3a = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.view.addSubview(itemView3a)

        let itemView3b = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.view.addSubview(itemView3b)

        let itemView3c = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.view.addSubview(itemView3c)

        itemView3.mas_makeConstraints{make in
            make.left.equalTo()(self.view.mas_left).with().offset()(15)
            make.top.equalTo()(self.view.mas_top).with().offset()(15)
//            make.width.equalTo()(80)
            make.height.equalTo()(100)
            return ()
        }

        itemView3a.mas_makeConstraints{make in
            make.left.equalTo()(itemView3.mas_right).with().offset()(10)
            make.top.equalTo()(itemView3.mas_top).with().offset()(00)
            make.width.equalTo()(itemView3.mas_width)
            make.height.equalTo()(itemView3.mas_height)
            return ()
        }

        itemView3b.mas_makeConstraints{make in
            make.left.equalTo()(itemView3a.mas_right).with().offset()(10)
            make.top.equalTo()(itemView3.mas_top).with().offset()(00)
            make.width.equalTo()(itemView3.mas_width)
            make.height.equalTo()(itemView3.mas_height)
            return ()
        }

        itemView3c.mas_makeConstraints{make in
            make.left.equalTo()(itemView3b.mas_right).with().offset()(10)
            make.top.equalTo()(itemView3.mas_top).with().offset()(00)
            make.right.equalTo()(self.view.mas_right).with().offset()(-10)
            make.width.equalTo()(itemView3.mas_width)
            make.height.equalTo()(itemView3.mas_height)
            return ()
        }

        

        NSLog("selfview recu %@", self.view.subviews )  // .recursiveDescription)
        
        
    }
    

}


























