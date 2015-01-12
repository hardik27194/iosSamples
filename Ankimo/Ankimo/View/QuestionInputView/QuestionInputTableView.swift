//
//  QuestionInputTableView.swift
//  ankimo
//
//  Created by takeshi on 2015/01/07.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class QuestionInputTableView: UIView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override init() {
        super.init()
    }

    func setupViews(){
        var tblview = UITableView()
        tblview.frame = self.frame
        self.addSubview(tblview)

    }
    
}


