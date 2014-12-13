//
//  TaskApiClient.swift
//  swift2
//
//  Created by takeshi on 2014/12/13.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

import UIKit

class TaskApiClient: BaseApiClient {

    
    func exec (bbb: NSString , callback: (NSString, NSError!) -> ()  ){

        let url = NSURL(string: "http://qiita.com/")
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task    = session.dataTaskWithURL(url!, completionHandler: {
            (data, resp, err) in

            // TODO 循環参照になるので後で処置する
            let data = self.makeDummyData()
            
            callback(data, nil)

            
        })
        
        task.resume()
        
    }

    func makeDummyData () -> NSString! {
        
        var dic = [
            "returnCode":"000",
            "resultData":
            [
                [
                    "id":"1",
                    "taskName":"みく飲み物",
                    "periodTime":"2014/12/31",
                ],
                [
                    "id":"2",
                    "taskName":"みくオムツ",
                    "periodTime":"2014/12/31",
                ],
            ]
        ]

        var data = NSJSONSerialization.dataWithJSONObject(dic, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
        var jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        return jsonString!
        
    }

}
