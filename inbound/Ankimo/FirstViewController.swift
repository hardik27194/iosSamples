//
//  FirstViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/06.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit
import Realm
import ObjectMapper

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
     
        temp6()
        
    }

    
    func temp6(){
        
        User().jsonToRealm()
        
    }
    
    func temp5(){
        
        let path : String = NSBundle.mainBundle().pathForResource("data1", ofType: "json")!
        let fileHandle : NSFileHandle = NSFileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile()
        let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(jsonString)

        let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSArray
        
        let mapper = Mapper<User>()
        let users:[User] = mapper.mapArray(array)!
        println(users)
        
        let realm = RLMRealm.defaultRealm()
        
        realm.transactionWithBlock { () -> Void in
            realm.addOrUpdateObjectsFromArray(users)
        }

    }
    
    func temp4(){
        
        let path : String = NSBundle.mainBundle().pathForResource("data1", ofType: "json")!
        let fileHandle : NSFileHandle = NSFileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile()
        let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(jsonString)
        
        let dic = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
        println(dic)
        
        let user = Mapper<User>().map(dic)
        println(user)
        
        println("user: \(user!.ID)")
        println("user: \(user!.UserName)")

        let realm = RLMRealm.defaultRealm()
        
        realm.transactionWithBlock { () -> Void in
            realm.addOrUpdateObject(user)
        }

        let results = User.allObjectsInRealm
        let pred = NSPredicate(format: "ID = %d", 1)
        let readUser = User.objectsInRealm(realm, withPredicate: pred)
        
        println("readUser \(readUser)")
        println("----------")
    }
    
    func temp2(){
        
        let json = "{\"User\":{\"id\": \"1\", \"username\": \"katsumi\"}}"
        let user = Mapper<User>().map(json)
        
        println("user: \(user!.ID)")
        println("user: \(user!.UserName)")
        //
        let realm = RLMRealm.defaultRealm()
        
        realm.transactionWithBlock { () -> Void in
            realm.addOrUpdateObject(user)
        }
        
        //        let results = User.objectsInRealm(realm, "id = 1")
        //        let results = User.objectsInRealm(realm, "id = 1")

        let results = User.allObjectsInRealm
        let pred = NSPredicate(format: "ID = %@", "1")
        let readUser = User.objectsInRealm(realm, withPredicate: pred)
   
        println("readUser \(readUser)")
        println("----------")
        
//        class func objectsInRealm(realm: RLMRealm!, withPredicate predicate: NSPredicate!) -> RLMResults!

        
//        println("results: \(results)")
//        
//        if let u = User.objectForIdentifier("1") as? User {
//            println("user: \(u)")
//        } else {
//            println("user: null")
//        }
        
    }


    func temp3(){
        
//        var person = Person()
//        person.name = "person1"
//        person.Id = "1"
//        
//        var realm = RLMRealm.defaultRealm
//        
//        realm().beginWriteTransaction()
//        realm().addObject(person)
//        realm().commitWriteTransaction()
//        
//        //
//        var manager = NetworkManager.sharedManager()
//        manager.temp1()
//        //        manager.jsonParse()
//        
//        var netManager = NetworkSecondManager.sharedInstance
//        let dic = netManager.insertRealm()
//        print(dic)

    }
    

    
//    func temp1(){
//        let path : String = NSBundle.mainBundle().pathForResource("data1", ofType: "json")!
//        let fileHandle : NSFileHandle = NSFileHandle(forReadingAtPath: path)!
//        let data : NSData = fileHandle.readDataToEndOfFile()
//        let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
//        let dic = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
//
//        let person = Mapper<Person1Entity>().map(jsonString)
//        
//        println(jsonString)
//        println(dic)
//        println(person)
//    }
    
    
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


























