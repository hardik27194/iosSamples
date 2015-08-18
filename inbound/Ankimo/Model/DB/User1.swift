//
//  User.swift
//  Ankimo
//
//  Created by takeshi on 2015/08/14.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import Realm
import ObjectMapper


class User1: RLMObject, Mappable {
    
    dynamic var ID: Int = 0
    dynamic var UserID: String = ""
    dynamic var UserName: String = ""
    dynamic var CountryID: String = ""
    dynamic var ValidFlg: String = ""
    dynamic var DelFlg: Bool = false
    
    // For Realm
    override init!() {
        super.init()
    }
    
    override class func primaryKey() -> String {
        return "ID"
    }
    
    // For ObjectMapper
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        ID        <- map["User.ID"]
        UserID    <- map["User.UserID"]
        UserName  <- map["User.UserName"]
        CountryID <- map["User.CountryID"]
        ValidFlg  <- map["User.ValidFlg"]
        DelFlg    <- map["User.DelFlg"]
    }
}