//
//  RecommendView.swift
//  Ankimo
//
//  Created by takeshi on 2015/07/18.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class RecommendView: UIView {

    @IBOutlet weak var imageView:UIImageView?
    @IBOutlet weak var titleLabel:UILabel?
    @IBOutlet weak var contentLabel:UILabel?
    
    override func awakeFromNib() {
        NSLog(" awakefrom nib  ")

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubViews()
    }

    func setupSubViews() {
        NSLog("setup subviews %@", self)
        
    }
    
    func setupLayout() {
        NSLog("setup layout %@", self)
        imageView?.frame = CGRectMake(0, 0, 10, 10)
//        titleLabel?.frame = CGRectMake(0, 0, 10, 10)
        titleLabel?.backgroundColor = UIColor.whiteColor()
        
//        imageView?.addConstraints([
//            NSLayoutConstraint(
//                item: imageView!,
//                attribute: .Top,
//                relatedBy: .Equal,
//                toItem: self,
//                attribute: .Top,
//                multiplier: 1.0,
//                constant: 10
//            ),
//            NSLayoutConstraint(
//                item: imageView!,
//                attribute: .Leading,
//                relatedBy: .Equal,
//                toItem: self,
//                attribute: .Leading,
//                multiplier: 1.0,
//                constant: 10
//            ),
//            NSLayoutConstraint(
//                item: imageView!,
//                attribute: .Bottom,
//                relatedBy: .Equal,
//                toItem: self,
//                attribute: .Bottom,
//                multiplier: 1.0,
//                constant: 10
//            ),
//            NSLayoutConstraint(
//                item: imageView!,
//                attribute: .Width,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: .Width,
//                multiplier: 1.0,
//                constant: 100
//            ),
//        ])
        
        
    }
    
    
}
