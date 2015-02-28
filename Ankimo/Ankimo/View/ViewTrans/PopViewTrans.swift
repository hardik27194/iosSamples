//
//  PushViewTrans.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class PopViewTrans {
    
    func exec(#preView1:UIView, nextView1:UIView, rootViewController:RootViewController){
        
        preView1.hidden = false
        nextView1.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        var upperView = UIView(frame: CGRectMake(0, 0, mainBounds.width, mainBounds.height))
        var lowerView = UIView(frame: CGRectMake(0, 0, mainBounds.width, mainBounds.height))
        
        preView1.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView1.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        
        upperView.addSubview(preView1)
        lowerView.addSubview(nextView1)
        
        rootViewController.view.addSubview(lowerView)
        rootViewController.view.addSubview(upperView)
        
        UIView.animateWithDuration(
            0.2,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                upperView.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
            },
            completion: {(bool: Bool) -> Void in
                upperView.removeFromSuperview()
                lowerView.removeFromSuperview()
                rootViewController.view.addSubview(nextView1)
            }
        )
        
    }
}
