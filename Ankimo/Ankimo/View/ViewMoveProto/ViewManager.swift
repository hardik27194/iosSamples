//
//  ViewManager.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class ViewManager: NSObject {
   
    var preView = UIView()
    var nextView = UIView()
    
    var questionInputView = QuestionInputView()
    var questionInputTableView = QuestionInputTableView()
    
    class var sharedInstance : ViewManager {
        struct Static {
            static let instance : ViewManager = ViewManager()
        }
        return Static.instance
    }

    func addView(#preView: UIView, nextView: UIView){

        let mainBounds = UIScreen.mainScreen().bounds

        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
        
    }

    func pushView(#preView: UIView, nextView: UIView){

        preView.hidden = false
        nextView.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds

        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
        nextView.bringSubviewToFront(preView)
        
        let angle = CGFloat(90.0 * M_PI / 180.0)
        nextView.transform = CGAffineTransformMakeRotation(angle)

        UIView.animateWithDuration(
            0.2,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                let angle = CGFloat(0.0 * M_PI / 180.0)
                nextView.transform = CGAffineTransformMakeRotation(angle)
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
        nextView.sendSubviewToBack(preView)
        
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
        nextView.sendSubviewToBack(preView)
        
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
        nextView.sendSubviewToBack(preView)
        
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
