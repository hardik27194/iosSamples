//
//  ChangeCellTrans.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class ChangeCellTrans {
    
    func exec(#preView:UIView, nextView:UIView, rootViewController:RootViewController){

        preView.hidden = true
        nextView.hidden = false
        
        let posX = preView.frame.origin.x
        
        let mainBounds = UIScreen.mainScreen().bounds
        var upperView = UIView(frame: CGRectMake(posX, 0, mainBounds.width, mainBounds.height))
        
        nextView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        
        upperView.addSubview(nextView)
        
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
                rootViewController.view.addSubview(nextView)
                
            }
        )
        
    }
}
