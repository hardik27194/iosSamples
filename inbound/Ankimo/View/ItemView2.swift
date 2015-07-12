//
//  ViewController.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/07.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class ItemView2: UIView {


    override func awakeFromNib() {
            let view = NSBundle.mainBundle().loadNibNamed("ItemView2", owner: self, options: nil).first as! UIView
    }
    
    
    class func instance()->ItemView2 {

        let view = NSBundle.mainBundle().loadNibNamed("ItemView2", owner: self, options: nil).first as! ItemView2
        
        return view
        

//        var temp0 = UINib(nibName: "ItemView2", bundle: nil)
//        
//        var temp1 = UINib(nibName: "ItemView2", bundle: nil).instantiateWithOwner(self, options: nil)
//
//        
//        var temp2 = UINib(nibName: "ItemView2", bundle: nil)
//            .instantiateWithOwner(self, options: nil)[0] as ItemView2
//        
//        
//        return UINib(nibName: "ItemView2", bundle: nil)
//            .instantiateWithOwner(self, options: nil)[0] as ItemView2
    }
    
    
    
}
