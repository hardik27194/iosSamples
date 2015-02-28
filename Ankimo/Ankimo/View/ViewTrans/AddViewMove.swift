//
//  addViewMove.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit


class addViewMove {
    
    func exec(#addView:UIView, rootViewController:RootViewController){
        rootViewController.view.addSubview(addView)
        rootViewController.currentView = addView
    }
    
}



