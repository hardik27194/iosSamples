//
//  AppDelegate.swift
//  Ankimo
//
//  Created by takeshi on 2015/01/12.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

        
        
        //let viewCon1 = FirstViewController(nibName: "FirstViewController", bundle: nil)
        let viewCon1 = FirstViewController()
        let viewCon2 = SecondViewController()
        let viewCon3 = SecondViewController()
        let viewCon4 = SecondViewController()
        let searchViewCon = SearchViewController()

        
        viewCon1.tabBarItem = UITabBarItem(title: "TOP",
            image: UIImage(named: "tab_icon1"), selectedImage: UIImage(named: "tab_icon1-o"))
        viewCon2.tabBarItem = UITabBarItem(title: "発見",
            image: UIImage(named: "tab_icon2"), selectedImage: UIImage(named: "tab_icon2-o"))
        viewCon3.tabBarItem = UITabBarItem(title: "レビュー",
            image: UIImage(named: "tab_icon3"), selectedImage: UIImage(named: "tab_icon3-o"))
        viewCon4.tabBarItem = UITabBarItem(title: "マイページ",
            image: UIImage(named: "tab_icon4"), selectedImage: UIImage(named: "tab_icon4-o"))

        
        let naviCon1 = UINavigationController(rootViewController: viewCon1)
        let naviCon2 = UINavigationController(rootViewController: viewCon2)
        
        let tabs = NSArray(objects: naviCon1, naviCon2, viewCon3, viewCon4)

        let tabBarController = UITabBarController();
        tabBarController.setViewControllers(tabs as [AnyObject], animated: false)
        
        self.window!.rootViewController = tabBarController
        self.window!.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

