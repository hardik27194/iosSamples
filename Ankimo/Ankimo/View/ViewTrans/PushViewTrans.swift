//
//  PushViewTrans.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class PushViewTrans {
    
    func exec(#preView1:UIView, nextView1:UIView, rootViewController:RootViewController){
        
        //        rootViewController.sideMenuTableView.hidden = true
        
        preView1.hidden = false
        nextView1.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        var upperView = UIView(frame: CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height))
        var lowerView = UIView(frame: CGRectMake(0, 0, mainBounds.width, mainBounds.height))
        
        preView1.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        nextView1.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        
        upperView.addSubview(nextView1)
        lowerView.addSubview(preView1)
        
        rootViewController.view.addSubview(lowerView)
        rootViewController.view.addSubview(upperView)
        
        UIView.animateWithDuration(
            1.2,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                upperView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
            },
            completion: {(bool: Bool) -> Void in
                upperView.removeFromSuperview()
                lowerView.removeFromSuperview()
                rootViewController.view.addSubview(nextView1)
                //                rootViewController.sideMenuTableView.hidden = false
                
            }
        )
        
    }
}
