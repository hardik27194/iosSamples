//
//  FirstViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/06.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var scrollView: UIScrollView!;
    
    let paddingY = 10.0 as CGFloat
    let paddingX = 10.0 as CGFloat
    let paddingAll = 10.0 as CGFloat
    private var pointY = 0 as CGFloat

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height

        self.view.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        self.view.backgroundColor = UIColor(red:0.8, green:0.8, blue:1.0, alpha:1.0)
        
        // navibar
        self.navigationItem.title = "Logo"
        let leftButtonItem = UIBarButtonItem(title: "地域↓", style: .Plain, target: self, action: "onClickRegionButton")
        self.navigationItem.leftBarButtonItem = leftButtonItem
        let rightButtonItem = UIBarButtonItem(title: "Search", style: .Plain, target: self, action: "onClickSearchButton")
        self.navigationItem.rightBarButtonItem = rightButtonItem
        let naviCon = self.navigationController;

        // scrollView
        let tabHeight = self.tabBarController!.tabBar.frame.size.height
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, screenWidth, screenHeight - tabHeight))
        self.scrollView.backgroundColor = UIColor(red:0.8, green:1, blue:0.8, alpha:1.0)
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 800)
        self.view.addSubview(self.scrollView)
        
        // 特集Slide
        pointY = paddingAll
        let view1 = UIView()
        view1.frame = CGRectMake(0, pointY, screenWidth, 120)
        view1.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3)
        self.scrollView.addSubview(view1)
        let label = UILabel(frame: CGRectMake(10, 10, 100, 20))
        label.text = "特集Slide"
        view1.addSubview(label)
        pointY = CGRectGetMaxY(view1.frame) + paddingAll

        // 現在の状況タイトル
        let currentStateTitle = UILabel(frame: CGRectMake(paddingAll, pointY, 100, 20))
        currentStateTitle.text = "現地の状況"
        self.scrollView.addSubview(currentStateTitle)
        
        
        // 現在の状況
//        let currentWether = 
        
        
        // AD特集 Title
        let adFeaturesLabel = UILabel()
        adFeaturesLabel.frame = CGRectMake(paddingX, pointY, 100, 20)
        adFeaturesLabel.text = "AD特集"
        self.scrollView.addSubview(adFeaturesLabel)
        
        /*
        // AD特集
        pointY = CGRectGetMaxY(adFeaturesLabel.frame) + paddingY;
        startPointY = pointY
        for (var idx = 0; idx < 4; idx++) {
            let itemView3 = AdSpecialTopicView(frame: CGRectZero)
            itemView3.tag = 20000 + idx;
            itemView3.frame = frameForItemView(startY:startPointY, idx:idx, colNum:2, height:50, padding:2)
            let label = UILabel(frame: CGRectMake(10, 10, 100, 20))
            label.text = "特集"
            itemView3.addSubview(label)
            self.scrollView.addSubview(itemView3)
            pointY = CGRectGetMaxY(itemView3.frame)
        }
        
        // おすすめ商品ラベル
        pointY += 20
        let recommendLabel = UILabel()
        recommendLabel.frame = CGRectMake(paddingX, pointY, 130,
            recommendLabel.font.lineHeight)
        recommendLabel.text = "おすすめ商品"
        recommendLabel.backgroundColor = UIColor.whiteColor()
        self.scrollView.addSubview(recommendLabel)
        pointY = CGRectGetMaxY(recommendLabel.frame)
        
        */

    }
    
    func frameForItemView(#startY: CGFloat, idx: Int, colNum: Int, height:CGFloat, padding:CGFloat) -> CGRect {
        
        var num = posNum(idx: idx, colNum: colNum)
        
        // width
        let screenWidth = (CGRectGetWidth(UIScreen.mainScreen().bounds))
        let width = (screenWidth - padding * 5) / CGFloat(colNum)
        
        // Position X
        let posX = padding + (padding + width) * (CGFloat)(num.x)
        
        // Position Y
        var posY = startY + (height + padding) * CGFloat(num.y)
        
        return CGRectMake(posX, posY, width, height)
        
    }

    /*
    * @abstract  何番目か返す (x,y)
    */
    func posNum (#idx: Int, colNum: Int) -> (x: Int, y: Int) {
        return (x:idx % colNum, y: Int(floor( CGFloat(idx) / CGFloat(colNum))) )
    }


}
