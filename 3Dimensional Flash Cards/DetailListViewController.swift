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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //表示されるたびリロード
        tableView.reloadData()
        self.tableView.reloadData()
        
        //ツールバー”単語帳を開く”を表示
        self.navigationController?.setToolbarHidden(false , animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let indexTitle = appDelegate.title
        print("\(String(describing: indexTitle))")
        // Realmに保存されているobjectsを取得。
        let realm = try! Realm()
        let selectedDate = realm.objects(RealmDateBase.self).filter("title == %@", indexTitle!).first
        let wordCount = selectedDate?.words
        return wordCount!.count// 総数を返す
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let indexTitle = appDelegate.title
        let realm = try! Realm()
        
        let realmDateBase = realm.objects(RealmDateBase.self).filter("title == %@" , indexTitle!).first
        // Realmに保存されている値取得
        
        let dateBase = realmDateBase?.words[indexPath.row]
        cell.textLabel?.text = (dateBase?.otherLanguage)! + (dateBase?.english)! + (dateBase?.japanese)!
        return cell
    }
    @IBAction func openInputWord(_ sender: Any) {
        //OK押したら画面遷移
        let storyboard: UIStoryboard = self.storyboard!
        //移動先のstoryboardを選択
        let second = storyboard.instantiateViewController(withIdentifier: "DetailInputController")
        //実際に移動するコード
        self.present(second, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let indexTitle = appDelegate.title
        let realm = try! Realm()
        
        let selectedDate = realm.objects(RealmDateBase.self).filter("title == %@" , indexTitle!).first
        // Realmに保存されている値取得
        let words = selectedDate?.words
        let dateBase = words![indexPath.row]
        
        //appdelegateのtitleへ入力
        let appDelegate2 = UIApplication.shared.delegate as! AppDelegate
        appDelegate2.tappedJapaneseWord = dateBase.japanese
        
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
