//
//  User.swift
//  Ankimo
//
//  Created by takeshi on 2015/08/14.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import Realm
import ObjectMapper


class User: RLMObject, Mappable {
//class User: RLMObject {
    dynamic var id: String = ""
    dynamic var username: String = ""
    
    // For Realm
    override init!() {
        super.init()
    }
    
//    override init!(objectSchema schema: RLMObjectSchema!) {
//        super.init(objectSchema: schema)
//    }
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    // For ObjectMapper
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        username    <- map["username"]
    }
}