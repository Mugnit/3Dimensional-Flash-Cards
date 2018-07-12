//
//  DetailListViewController.swift
//  3Dimensional Flash Cards
//
//  Created by 峯下　優大 on 2018/07/12.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class DetailListViewController:UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let indexTitle = appDelegate.title
        // Realmに保存されているobjectsを取得。
        let realm = try! Realm()
        
        let selectedDate = realm.objects(RealmDateBase.self).filter("title == \(String(describing: indexTitle))").first
        
        let wordCount = selectedDate?.words
        return wordCount!.count// 総数を返している
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let realm = try! Realm()
        
        let realmDateBase = realm.objects(RealmDateBase.self)
        // Realmに保存されている値取得
        
        let dateBase = realmDateBase[indexPath.row]
        cell.textLabel?.text = dateBase.title
        return cell
    }
}
