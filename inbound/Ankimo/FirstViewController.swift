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
    let paddingAll = 10.0 as CGFloat
    private var pointY = 0 as CGFloat
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        self.view.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        self.view.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1)
        
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
        self.scrollView.contentSize = CGSizeMake(0, 1000)
        self.scrollView.backgroundColor = UIColor(red: 0.7, green: 1, blue: 0.7, alpha: 1)
        self.view.addSubview(self.scrollView)

        pointY = paddingAll
        
        // itemView
        let startPoint = pointY
        for (var idx = 0; idx < 8; idx++) {
            let itemView3 = ItemView3(frame: CGRectZero)
            itemView3.tag = 10000 + idx;
            itemView3.frame = frameForItemView(startY:startPoint, idx:idx, colNum:4, height:100, padding:5)
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

        // おすすめ商品ラベル
        pointY += 20
        let recommendLabel = UILabel()
        recommendLabel.frame = CGRectMake(paddingX, pointY, 130,
            recommendLabel.font.lineHeight)
        recommendLabel.text = "おすすめ商品"
        recommendLabel.backgroundColor = UIColor.whiteColor()
        self.scrollView.addSubview(recommendLabel)
        pointY = CGRectGetMaxY(recommendLabel.frame)

        // おすすめ商品ラベル
        pointY += 10
        for (var idx = 0; idx < 4; idx++) {
            let recommendView = UINib(nibName: "RecommendView", bundle: nil)
                .instantiateWithOwner(self, options: nil)[0] as! RecommendView
            recommendView.frame = CGRectMake(0, pointY, screenWidth, 140)
            self.scrollView.addSubview(recommendView)
            recommendView.setupLayout()
            pointY = CGRectGetMaxY(recommendView.frame) + 2
        }
        
        
        
        var person = Person()
        person.name = "person1"
        person.Id = "1"
        
        var realm = RLMRealm.defaultRealm
        
        realm().beginWriteTransaction()
        realm().addObject(person)
        realm().commitWriteTransaction()

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
    
    func onClickSearchButton (){
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        self.presentViewController(searchViewController, animated: true, completion: nil)
    
    }
 
    func onClickRegionButton (){
        let regionViewController = RegionViewController(nibName: "RegionViewController", bundle: nil)
//        let regionViewController = RegionViewController(nibName: "RegionViewController")
        self.presentViewController(regionViewController, animated: true, completion: nil)
        
    }
    
    
}


























