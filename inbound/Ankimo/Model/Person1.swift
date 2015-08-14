//
//  Company.swift
//  Ankimo
//
//  Created by takeshi on 2015/08/13.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import Realm
import ObjectMapper


// DBモデルにRLMObjectを継承させる
class Person1Entity : RLMObject {
    
    dynamic var id = ""
    dynamic var name = ""
    
    // initializer で mapping(map: Map) を呼び出す
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
}

// MARK: - ObjectMapper
extension Person1Entity : Mappable {
    
    func mapping(map: Map) {
        id   <- map["Person.ID"]
        name <- map["Person.UserName"]
    }
    
}

