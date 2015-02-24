//
//  ViewImperator.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit


class addViewMove {
    
    func exec(#preView1:UIView, rootViewController:RootViewController){
//        rootViewController.sideMenuTableView.hidden = true
        rootViewController.view.addSubview(preView1)
    }
}

class ViewImperator: NSObject {
   
    var currentTab:Int = 0
    
    var rootView = UIView()
    var preView = UIView()
    var nextView = UIView()
    
    let mainBounds = UIScreen.mainScreen().bounds
    let viewRect = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
    
//    var upperView = UIView()
//    var lowerView = UIView()
    
    var questionInputView = QuestionInputView()
    var questionInputTableView = QuestionInputTableView()
    var sideMenuTableView = SideMenuTableView()
    
    typealias ViewArray = [UIView]
    var views :ViewArray = []
    var tabs :[ViewArray] = [[]]

    var isSideBarOpen: Bool = false

    class var sharedInstance : ViewImperator {
        struct Static {
            static let instance : ViewImperator = ViewImperator()
        }
        return Static.instance
    }

    var currentView: UIView {
        get {
            return tabs[currentTab].last ?? UIView()
        }
    }
    
    // MARK: タブ関連
    func selectedTabView(tabIdx: Int) -> UIView {
        return tabs[tabIdx].last ?? UIView()
    }
    
    /*
    * @abstract タブを切り替える
    */
    func changeCurrentTab(tabIdx: Int){
        // 現在のview
        self.currentView.hidden = true
        var rect = self.currentView.frame
        
        rootView.bringSubviewToFront(self.selectedTabView(tabIdx))
        currentTab = tabIdx
        
        // タブ切り替え後の新しいview
        self.currentView.hidden = false
        self.currentView.frame = rect
        self.preView = self.currentView
        self.frickMoveClose()
    }

    /*
    * @abstract currentView 現在のview と 次のview をセットする
    */
    func preSetupView(#preView: UIView, nextView: UIView){
        self.preView = preView
        self.nextView = nextView
        rootView.bringSubviewToFront(nextView)
        rootView.bringSubviewToFront(preView)

    }

    // MARK: 横フリック　サイドメニュー用
    /*
    * @abstract フリックしたときにサイドメニューを表示する
    */
    func frickMoveView(#moveDistance: CGFloat){
        // preView自身の座標が動くのでそれを加算する。
        var posx = moveDistance + self.preView.frame.origin.x
        self.preView.frame = CGRectMake(posx, self.preView.frame.origin.y, self.preView.frame.size.width, self.preView.frame.size.height)
    }

    /*
    * @abstract フリックしたときに案内コントローラを表示
    */
    func frickMoveReturn(){

        var endPointX = 0.0 as CGFloat
        if isSideBarOpen {
            if self.preView.frame.origin.x > UIScreen.mainScreen().bounds.size.width - 130 {
                endPointX = UIScreen.mainScreen().bounds.size.width - 80
            }
            
        } else {
            if self.preView.frame.origin.x > 50 {
                endPointX = UIScreen.mainScreen().bounds.size.width - 80
            }
        }
        
        UIView.animateWithDuration(
            0.1,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                self.preView.frame = CGRectMake(endPointX, self.preView.frame.origin.y, self.preView.frame.size.width, self.preView.frame.size.height)
            },
            completion: {(bool: Bool) -> Void in
                self.isSideBarOpen = (self.preView.frame.origin.x > 100)

            }
        )

    }

    // MARK: 閉じる
    /*
    * @abstract フリックしたときに案内コントローラを閉じる
    */
    func frickMoveClose(){
        var endPointX = 0.0 as CGFloat
        UIView.animateWithDuration(
            0.1,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                self.preView.frame = CGRectMake(endPointX, self.preView.frame.origin.y, self.preView.frame.size.width, self.preView.frame.size.height)
            },
            completion: {(bool: Bool) -> Void in
                self.isSideBarOpen = (self.preView.frame.origin.x > 100)
            }
        )
    }
    
    // MARK: 画面遷移関連
    /*
    * @abstract viewを追加する
    */
    func addView(view: UIView){
        view.hidden = true
        views.append(view) // ちょっと違う
        tabs.insert(views, atIndex: currentTab)
    }
    
    /*
    * @abstract viewを切り替える（アニメーションなし）
    */
    func changeView(#preView: UIView, nextView: UIView){
        preView.hidden = true
        nextView.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        rootView.bringSubviewToFront(nextView)
        
        
    }

    //sdf
    func pushView2(#preView1: UIView, nextView1: UIView){
//        var psm = popViewMove(preView1: preView1, nextView1: nextView1, rootView: rootView)
//        psm.exec()
    }
    
    
    
    
    func pushView(#preView: UIView, nextView: UIView){
        
        preView.hidden = false
        nextView.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
        rootView.bringSubviewToFront(nextView)
        
        UIView.animateWithDuration(
            0.2,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                nextView.frame = CGRectMake(0.0, 0, mainBounds.width, mainBounds.height)
                
            },
            completion: {(bool: Bool) -> Void in
            }
        )
        
    }
    
    func popView(#preView: UIView, nextView: UIView){
        
        preView.hidden = false
        nextView.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        rootView.bringSubviewToFront(preView)
        
        UIView.animateWithDuration(
            0.2,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                preView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
                
            },
            completion: {(bool: Bool) -> Void in
                // Completion処理
                
            }
        )
        
    }
    
    func pushViewRotate(#preView: UIView, nextView: UIView){
        
        preView.hidden = false
        nextView.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
        rootView.bringSubviewToFront(nextView)

        let angle = CGFloat(90.0 * M_PI / 180.0)
        nextView.transform = CGAffineTransformMakeRotation(angle)
        
        UIView.animateWithDuration(
            0.2,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                let angle = CGFloat(0.0 * M_PI / 180.0)
                nextView.transform = CGAffineTransformMakeRotation(angle)
                nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)

            },
            completion: {(bool: Bool) -> Void in
            }
        )
        
    }
    
    func popViewRotate(#preView: UIView, nextView: UIView){
        
        preView.hidden = false
        nextView.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        rootView.bringSubviewToFront(nextView)
        
        UIView.animateWithDuration(
            0.2,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                preView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
                let angle = CGFloat(90.0 * M_PI / 180.0)
                preView.transform = CGAffineTransformMakeRotation(angle)
                
            },
            completion: {(bool: Bool) -> Void in
                // Completion処理
                let angle = CGFloat(0.0 * M_PI / 180.0)
                preView.transform = CGAffineTransformMakeRotation(angle)
                
            }
        )
        
    }
    
    func wipeInView(#preView: UIView, nextView: UIView){

        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        rootView.bringSubviewToFront(nextView)
        
        nextView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        UIView.animateWithDuration(
            0.5,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                nextView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            },
            completion: {(bool: Bool) -> Void in
                // Completion処理
                preView.hidden = true

            }
        )
    }

    func wipeOutView(#preView: UIView, nextView: UIView){
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.hidden = false
        nextView.hidden = false
        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        rootView.bringSubviewToFront(nextView)
        
        preView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        UIView.animateWithDuration(
            0.5,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                preView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            },
            completion: {(bool: Bool) -> Void in
                // Completion処理
                preView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                preView.hidden = true
            }
        )
    }

}



