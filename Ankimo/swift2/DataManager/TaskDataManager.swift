//
//  TaskDataManager.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit
import Realm

class TaskDataManager: NSObject {
   
    func exec () {
    
        TaskApiClient().exec("") { (str: NSString , error:NSError! ) in
            
            println( str )
            
            // json -> dic 
            var data = str.dataUsingEncoding(NSUnicodeStringEncoding)
            var dic = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
            
            println(dic["resultData"])
            
            var resultData = dic["resultData"] as NSArray

            // dic -> realm object
            var tasks = Array<Task>()
            for tmp in resultData {
                var tmp1 = tmp as NSDictionary
                let task = Task()
                task.taskName = tmp1["taskName"] as String
                tasks.append(task)
            }

            // add to realm
            let realm = RLMRealm.defaultRealm()
            realm.beginWriteTransaction()
            realm.addObjects(tasks)
            realm.commitWriteTransaction()
            
        }

    
    }
   
}
