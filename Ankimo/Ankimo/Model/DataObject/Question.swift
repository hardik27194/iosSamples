//
//  Question.swift
//  swift2
//
//  Created by takeshi on 2015/01/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import Realm

class Question: RLMObject {
   
    dynamic var id = 0
    dynamic var questionText: String = ""
    dynamic var answerText: String = ""
    dynamic var dispFlg : Bool = false
    dynamic var delFlg : Bool = false
    dynamic var createDate = NSDate(timeIntervalSince1970: 1)
    dynamic var modifyDate = NSDate(timeIntervalSince1970: 1)
    dynamic var deleteDate = NSDate(timeIntervalSince1970: 1)
    
    override class func primaryKey() -> String! {
        return "id"
    }

}
