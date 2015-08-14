//
//  ViewController.swift
//  SwiftRealmSample
//
//  Created by takeshi on 2015/08/14.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 0.2)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(animated: Bool) {

        let realm = RLMRealm.defaultRealm()
        
        
        let user = User()
        user.id = "1"
        user.username = "take"
        
        realm.transactionWithBlock{ ()-> Void in
          realm.addObject(user)
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        
      let realm = RLMRealm.defaultRealm()

      let pred = NSPredicate(format: "id = %@", "1")
      let user = User.objectsInRealm(realm, withPredicate: pred)
      // User.allObjectsInRealm(realm)

      println("user \(user)")

    }

}






























