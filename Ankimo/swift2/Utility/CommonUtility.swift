//
//  CommonUtility.swift
//  swift2
//
//  Created by takeshi on 2015/01/01.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class Util {
    
    class func rect (#view: UIView, x: CGFloat) -> CGRect {
        let y = view.frame.origin.y
        let w = view.frame.size.width
        let h = view.frame.size.height
        return CGRectMake(x, y, w, h)
    }

    class func rect (#view: UIView, y: CGFloat) -> CGRect {
        let x = view.frame.origin.x
        let w = view.frame.size.width
        let h = view.frame.size.height
        return CGRectMake(x, y, w, h)
    }

    class func rect (#view: UIView, w: CGFloat) -> CGRect {
        let x = view.frame.origin.x
        let y = view.frame.origin.y
        let h = view.frame.size.height
        return CGRectMake(x, y, w, h)
    }

    class func rect (#view: UIView, h: CGFloat) -> CGRect {
        let x = view.frame.origin.x
        let y = view.frame.origin.y
        let w = view.frame.size.width
        return CGRectMake(x, y, w, h)
    }

}
