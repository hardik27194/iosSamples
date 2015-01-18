//
//  ViewMoveProto.swift
//  ankimo
//
//  Created by takeshi on 2015/01/07.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class ViewMoveProto: UIView {

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
        
        self.backgroundColor = UIColor.blueColor()
        
        let protoView1 = ProtoView1()
        let protoView2 = ProtoView2()
        let questionView = QuestionInputTableView(frame: self.frame)
        questionView.dataReload()
        
        self.addSubview(protoView1)
        self.addSubview(protoView2)
        self.addSubview(questionView)
        
        let mainBounds = UIScreen.mainScreen().bounds
        
        protoView1.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        protoView2.frame = CGRectMake(mainBounds.width, 0, mainBounds.width, mainBounds.height)
        questionView.frame = CGRectMake(mainBounds.width / 2.0 , mainBounds.height / 2.0 , 0, 0)
        
//        ViewManager.sharedInstance.addView(preView: protoView1, nextView: protoView2)
        
        let delayInSeconds = 1.3;
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)));
        dispatch_after(popTime, dispatch_get_main_queue()){
            ViewManager.sharedInstance.wipeInView(preView: protoView1, nextView: questionView)

            let popTime1 = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)));
            dispatch_after(popTime1, dispatch_get_main_queue()){
                ViewManager.sharedInstance.wipeOutView(preView: questionView, nextView: protoView1)

            }
            
        };
        
    }
 

    
}


