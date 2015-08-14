//
//  NetworkSecondManager.swift
//  Ankimo
//
//  Created by takeshi on 2015/08/05.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit

class NetworkSecondManager: NSObject {

    class var sharedInstance : NetworkSecondManager {
        struct Static {
            static let instance : NetworkSecondManager = NetworkSecondManager()
        }
        return Static.instance
    }
    
    func jsonParse () -> NSDictionary {
        
        let bundle = NSBundle(forClass: NetworkSecondManager.self)
        let dataPath = bundle.pathForResource("data1", ofType: "json")
        let data = NSData(contentsOfFile: dataPath!)

        let nsdic = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary

        return nsdic
        
    }
    
    func insertRealm () -> Int {

        
        
        
        let dic:NSDictionary = jsonParse()

        NSLog(" dic keys %@ " , dic.allKeys )
        
        for (key , obj) in dic {
            
            let k = key as! String
            NSLog(" %@", k)
            
            var clazz = NSClassFromString("User")
            
            
            
            
            
        }
        
        
        return 1
    }
    
    
    
}























