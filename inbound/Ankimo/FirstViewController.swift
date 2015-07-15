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
        for (var idx = 0; idx <= 8; idx++) {
            let itemView3 = ItemView3(frame: CGRectZero)
            itemView3.tag = tagForItemView3(idx)
            itemView3.frame = frameForItemView(startY: 10.0, idx: idx)
        }

        
        
        
        // AD特集
        let adFeaturesLabel = UILabel()
        adFeaturesLabel.text = "AD特集"
        self.scrollView.addSubview(adFeaturesLabel)

        // 特集１
        let adFeatureView1 = UIView()
        let adFeatureLabel = UILabel(frame: CGRectMake(10, 10, 40, 20))
        adFeatureLabel.text = "特集"
        adFeatureView1.addSubview(adFeatureLabel)
        self.scrollView.addSubview(adFeatureView1)

        // 特集2
        let adFeatureView2 = UIView()
        adFeatureView2.addSubview(adFeatureLabel)
        self.scrollView.addSubview(adFeatureView2)

        
        NSLog("selfview recu %@", self.view.subviews )  // .recursiveDescription)
        
        
    }
    

    func tagForItemView3(idx: NSInteger) -> NSInteger {
        return 10000 + idx
    }
    
    func frameForItemView(#startY: CGFloat, idx: NSInteger) -> CGRect {
        
        var num = posNum(idx: idx, colNum: 4)
        
        
        
        var posY = 0 as CGFloat
        
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let padding = 10.0 as CGFloat
        let width = (screenWidth - (padding * 5.0)) / 4.0

        let posX = padding + width * (CGFloat)num.x

        
        var height = 0 as CGFloat
        
        return CGRectMake(posX, posY, width, height)
        
    }
    
    func posNum (#idx: NSInteger, colNum: NSInteger) -> (x: NSInteger, y: NSInteger) {
        return (x:idx % colNum, y: idx / colNum)
    }
    
    
}


























