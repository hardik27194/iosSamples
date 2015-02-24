//
//  SettingView.swift
//  ankimo
//
//  Created by takeshi on 2015/01/11.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class SettingView: UIView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override init() {
        super.init()
        
        self.frame = UIScreen.mainScreen().bounds
        
        
    }

}
