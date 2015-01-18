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
        
        UIView.animateWithDuration(
            0.5,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
            },
            completion: {(bool: Bool) -> Void in
                // Completion処理
            }
        )
        
    }

    func popView(#preView: UIView, nextView: UIView){
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        preView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView.sendSubviewToBack(preView)
        
        UIView.animateWithDuration(
            0.5,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                nextView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
            },
            completion: {(bool: Bool) -> Void in
                // Completion処理
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
