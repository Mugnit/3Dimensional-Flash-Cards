//
//  ListViewController.swift
//  3Dimensional Flash Cards
//
//  Created by 峯下　優大 on 2018/06/19.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit
import RealmSwift
class ListViewController:UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        self.tableView.reloadData()
    }
    @IBAction func arratButton(_ sender: Any) {
        let alert = UIAlertController(title: "タイトル", message: "タイトルを入力してください(例:あいさつ)", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField:UITextField) -> Void in
            textField.placeholder = "ここにタイトルを入力"
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) -> Void in
            let textField = alert.textFields![0] as UITextField
            if textField.text!.count != 0 {
//                let realm = try! Realm();
//                let realmDateBase = RealmDateBase()
//                realmDateBase.title = textField.text!
//                try! realm.write({
//                    realm.add(realmDateBase)
//                })
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                //入力されたtitleを一時的に保持
                appDelegate.title = textField.text!
                
                //self.performSegue(withIdentifier: "InputController", sender: nil)
                //OK押したら画面遷移
                let storyboard: UIStoryboard = self.storyboard!
                //移動先のstoryboardを選択
                let second = storyboard.instantiateViewController(withIdentifier: "InputController")
                //実際に移動するコード
                self.present(second, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action:UIAlertAction) -> Void in
            print("Text field: cancel")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let realmDateBase = realm.objects(RealmDateBase.self)
        // Realmに保存されているobjectsを取得。
        
        return realmDateBase.count // 総数を返している
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        
        let realmDateBase = realm.objects(RealmDateBase.self)
        // Realmに保存されている値取得
        
        let dateBase = realmDateBase[indexPath.row]
        
        //appdelegateのtitleへ入力
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.title = dateBase.title
        
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
