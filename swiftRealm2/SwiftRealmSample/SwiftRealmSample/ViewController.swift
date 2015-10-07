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

      let users = List<User>()

      for(var i = 0; i < 10; i++){
        let user = User()
        user.id = String(i)
        user.username = "take" + String(i)
        users.append(user)
      }

      realm.write({()-> Void in
//        realm.add(users)
        realm.add(users, update: true)
      })

    }

    override func viewDidAppear(animated: Bool) {
      let realm = try! Realm();
      let users = realm.objects(User)
      print("all user \(users)")

      let lastUser = realm.objects(User).last!
      print("last user \(lastUser)")

      let user8 = users.filter("id = '8'")
      print("user8 \(user8)")

      let cnt = realm.objects(User).count
      print(" connt \(cnt)")


//      delUser()

    }


  func delUser() {
    let realm = try! Realm()

    realm.write {

      // user7 削除
      let user7 = realm.objects(User).filter("id = '7'")
      realm.delete(user7)

      let cnt1 = realm.objects(User).count
      print(" connt-1 \(cnt1)")


      // 全user削除
      realm.deleteAll()

      let cnt2 = realm.objects(User).count
      print(" connt-2 \(cnt2)")

    }

  }


}



