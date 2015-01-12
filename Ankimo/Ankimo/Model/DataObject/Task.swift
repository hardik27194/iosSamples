//
//  Task.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import Realm

class Task: RLMObject {
    dynamic var id = ""
    dynamic var taskName: String = ""
    dynamic var delFlg : Bool = false
        
    override class func primaryKey() -> String! {
        return "id"
    }
    
}
