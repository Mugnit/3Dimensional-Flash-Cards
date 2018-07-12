//
//  InputController.swift
//  3Dimensional Flash Cards
//
//  Created by 峯下　優大 on 2018/07/12.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class InputController:UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputJapanese: UITextField!
    @IBOutlet weak var inputEnglish: UITextField!
    @IBOutlet weak var inputOtherLanguage: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.textAlignment = NSTextAlignment.center
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        titleLabel?.text = appDelegate.title
    }
    @IBAction func createWordButton(_ sender: Any){
        //すべてのフィールドに文字が入力されなければ登録できない
        if inputJapanese.text!.count != 0 || inputEnglish.text!.count != 0 || inputOtherLanguage.text!.count != 0 {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let realm = try! Realm();
            try! realm.write {
                let word = Word()
                word.japanese = inputJapanese.text!
                word.english = inputJapanese.text!
                word.otherLanguage = inputOtherLanguage.text!
                
                let realmDateBase = RealmDateBase()
                realmDateBase.title = appDelegate.title!
                realm.add(realmDateBase)
                realmDateBase.words.append(word)
            }
            self.dismiss(animated: true, completion: nil)
            //文字入力がなかった場合
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    } 
    
}
