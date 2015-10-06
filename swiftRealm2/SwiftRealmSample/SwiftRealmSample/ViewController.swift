//
//  ViewController.swift
//  SwiftRealmSample
//
//  Created by takeshi on 2015/08/14.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 0.2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {

      let realm = try! Realm();
      let user = User()
      user.id = "1"
      user.username = "take"
      realm.write({()-> Void in
        realm.add(user)
      })

    }

    override func viewDidAppear(animated: Bool) {
      let realm = try! Realm();
      let users = realm.objects(User)
      print("user \(users)")
    }

}



