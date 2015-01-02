//
//  Question.swift
//  swift2
//
//  Created by takeshi on 2015/01/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import Realm

class Question: RLMObject {
   
    dynamic var id = ""
    dynamic var questionText: String = ""
    dynamic var answerText: String = ""
//    dynamic var delFlg : Bool = false
    
    override class func primaryKey() -> String! {
        return "id"
    }

}
