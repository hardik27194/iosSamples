//
//  FirstViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/06.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var scrollView:UIScrollView!;

    let paddingY = 10.0 as CGFloat
    let paddingX = 10.0 as CGFloat
    private var pointY = 0 as CGFloat
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.view.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
//        
//        
//        let scrollView = UIScrollView()
//        scrollView.frame = CGRectMake( 0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))
//        scrollView.backgroundColor = UIColor(red:0.6, green:0.5, blue:0.0, alpha:1.0)
//        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 800)
//        
//        self.view.addSubview(scrollView)
//        
//        
//    }
    

    
//    func v1iewDidLoad() {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        self.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        // navibar
        self.navigationItem.title = "Logo"
        
        let leftButtonItem = UIBarButtonItem(title: "地域↓", style: .Plain, target: self, action: "onClickMyButton")
        self.navigationItem.leftBarButtonItem = leftButtonItem

        let rightButtonItem = UIBarButtonItem(title: "Search", style: .Plain, target: self, action: "onClickMyButton")
        self.navigationItem.rightBarButtonItem = rightButtonItem

        let naviCon = self.navigationController;

        //
        let scrollViewY = CGRectGetHeight(self.navigationController!.navigationBar.frame)
        self.scrollView = UIScrollView(frame: CGRectMake(0, scrollViewY, 320, 400))
//        self.scrollView.frame = CGRectMake(0, 100, 320, 300)
        self.scrollView.contentSize = CGSizeMake(0, 1000)
        self.scrollView.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        self.view.addSubview(self.scrollView)

        pointY = 20
        
        // itemView
        let startPoint = pointY
        for (var idx = 0; idx < 8; idx++) {
            let itemView3 = ItemView3(frame: CGRectZero)
            itemView3.tag = 10000 + idx;
            itemView3.frame = frameForItemView(startY:startPoint, idx:idx, colNum:4, height:100, padding:10)
            self.scrollView.addSubview(itemView3)
            pointY = CGRectGetMaxY(itemView3.frame)
        }
        pointY = pointY + paddingY
        
        // AD特集 Title
        let adFeaturesLabel = UILabel()
        adFeaturesLabel.frame = CGRectMake(paddingX, pointY, 100, 20)
        adFeaturesLabel.text = "AD特集"
        self.scrollView.addSubview(adFeaturesLabel)

        // AD特集
        pointY = CGRectGetMaxY(adFeaturesLabel.frame) + paddingY;
        let startPointY = pointY
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

        // おすすめ商品
        pointY += 20
        let recommendLabel = UILabel()
        recommendLabel.frame = CGRectMake(paddingX, pointY, 130, 20)
        recommendLabel.text = "おすすめ商品"
        self.scrollView.addSubview(recommendLabel)

        
        
        
        
        
        
        
        
        
        
        
        
        // 推奨
//        let recommendView = UINib(nibName:"RecommendView", bundle:nil)
//            .instantiateWithOwner(nil, options:nil)[0] as! RecommendView
//        recommendView.frame = CGRectMake(paddingX, pointY, 200, 100)
//        self.scrollView.addSubview(recommendView)
        
      
//        // 特集１
//        let adFeatureView1 = UIView()
//        let adFeatureLabel = UILabel(frame: CGRectMake(10, 10, 40, 20))
//        adFeatureLabel.text = "特集"
//        adFeatureView1.addSubview(adFeatureLabel)
//        self.scrollView.addSubview(adFeatureView1)
//
//        // 特集2
//        let adFeatureView2 = UIView()
//        adFeatureView2.addSubview(adFeatureLabel)
//        self.scrollView.addSubview(adFeatureView2)

        
        NSLog("selfview recu %@", self.view.subviews )  // .recursiveDescription)
        
        
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


























