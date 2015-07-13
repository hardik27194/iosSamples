//
//  FirstViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/06.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var scrollView:UIScrollView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // navibar
        self.navigationItem.title = "Logo"
        
        let leftButtonItem = UIBarButtonItem(title: "地域↓", style: .Plain, target: self, action: "onClickMyButton")
        self.navigationItem.leftBarButtonItem = leftButtonItem

        let rightButtonItem = UIBarButtonItem(title: "Search", style: .Plain, target: self, action: "onClickMyButton")
        self.navigationItem.rightBarButtonItem = rightButtonItem

        let naviCon = self.navigationController;

        //
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        self.scrollView.contentSize = CGSizeMake(320, 800)
        
        
        // itemView
        let padding = UIEdgeInsetsMake(20, 20, 0, 20)
        
        let itemView3 = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.scrollView.addSubview(itemView3)

        let itemView3a = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.scrollView.addSubview(itemView3a)

        let itemView3b = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.scrollView.addSubview(itemView3b)

        let itemView3c = UINib(nibName: "ItemView3", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.scrollView.addSubview(itemView3c)

        
        let y1:CGFloat! = naviCon?.navigationBar.frame.size.height
        let y2:CGFloat! = naviCon?.navigationBar.frame.origin.y
        let y = y1 + y2 + 15.0
        
        itemView3.mas_makeConstraints{make in
            make.left.equalTo()(self.scrollView.mas_left).with().offset()(15)
            make.top.equalTo()(self.scrollView.mas_top).with().offset()(y)
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

        
        // AD特集
        let adFeaturesLabel = UILabel()
        adFeaturesLabel.text = "AD特集"
        self.scrollView.addSubview(adFeaturesLabel)
        adFeaturesLabel.mas_makeConstraints{make in
            make.top.equalTo()(itemView3.mas_bottom).with().offset()(20)
            make.left.equalTo()(itemView3.mas_left).with().offset()(00)
            make.width.equalTo()(100)
            make.height.equalTo()(20)
            return ()
        }

        // 特集１
        let adFeatureView1 = UIView()
        let adFeatureLabel = UILabel(frame: CGRectMake(10, 10, 40, 20))
        adFeatureLabel.text = "特集"
        adFeatureView1.addSubview(adFeatureLabel)
        self.scrollView.addSubview(adFeatureView1)
        adFeatureView1.mas_makeConstraints{make in
            make.top.equalTo()(adFeaturesLabel.mas_bottom).with().offset()(20)
            make.left.equalTo()(itemView3.mas_left).with().offset()(00)
            make.height.equalTo()(20)
            return ()
        }

        // 特集2
        let adFeatureView2 = UIView()
        adFeatureView2.addSubview(adFeatureLabel)
        self.scrollView.addSubview(adFeatureView2)
        adFeatureView2.mas_makeConstraints{make in
            make.top.equalTo()(adFeatureView1.mas_top)
            make.left.equalTo()(adFeatureView1.mas_right).with().offset()(20)
            make.right.equalTo()(self.scrollView.mas_right).with().offset()(-20)
            make.width.equalTo()(adFeatureView1.mas_width)
            make.height.equalTo()(20)
            return ()
        }

        
        NSLog("selfview recu %@", self.view.subviews )  // .recursiveDescription)
        
        
    }
    

}


























