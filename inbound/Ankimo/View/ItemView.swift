//
//  itemView.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/07.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class ItemView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    
            self.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    
    }

    
    
    
}
