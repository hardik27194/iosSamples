//
//  CommonUtility.swift
//  swift2
//
//  Created by takeshi on 2015/01/01.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class CommonUtility: UIView {

    func rectx (#view: UIView, x: CGFloat) -> CGRect {
        let y = view.frame.origin.y
        let h = view.frame.size.height
        let w = view.frame.size.width
        return CGRectMake(x, y, w, h)
    }

    
    
}

class Util {
    
    func rectx (#view: UIView, x: CGFloat) -> CGRect {
        let y = view.frame.origin.y
        let h = view.frame.size.height
        let w = view.frame.size.width
        return CGRectMake(x, y, w, h)
    }

}
