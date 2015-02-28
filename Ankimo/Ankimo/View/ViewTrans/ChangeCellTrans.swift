//
//  ChangeCellTrans.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class ChangeCellTrans {
    
    func exec(#view:UIView, startPositionX: CGFloat, rootViewController:RootViewController){

        view.hidden = false
        
        let mainBounds = UIScreen.mainScreen().bounds
        var moveView = UIView(frame: CGRectMake(startPositionX, 0, mainBounds.width, mainBounds.height))
        
        view.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        
        moveView.addSubview(view)
        
        rootViewController.view.addSubview(moveView)
        
        UIView.animateWithDuration(
            0.1,
            delay: 0.0,
            options: .CurveLinear,
            animations:  {() -> Void in
                moveView.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
            },
            completion: {(bool: Bool) -> Void in
                moveView.removeFromSuperview()
                rootViewController.view.addSubview(view)
                
            }
        )
        
    }
}
