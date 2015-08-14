//
//  User.swift
//  SwiftRealmSample
//
//  Created by takeshi on 2015/08/14.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//


import Realm


class User: RLMObject {
    dynamic var id: String = ""
    dynamic var username: String = ""
    
    // For Realm
    override init!() {
        super.init()
    }
    
//    override class func primaryKey() -> String {
//        return "id"
//    }
}