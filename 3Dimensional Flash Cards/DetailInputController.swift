//
//  DtailInputController.swift
//  3Dimensional Flash Cards
//
//  Created by 峯下　優大 on 2018/07/17.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class DetailInputController: UIViewController {
    @IBOutlet weak var inputJapanese: UITextField!
    @IBOutlet weak var inputEnglish: UITextField!
    @IBOutlet weak var inputOtherLanguage: UITextField!
    @IBAction func createWordButton(_ sender: Any){
        //すべてのフィールドに文字が入力されなければ登録できない
        if inputJapanese.text!.count != 0 || inputEnglish.text!.count != 0 || inputOtherLanguage.text!.count != 0 {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let indexTitle = appDelegate.title
            let realm = try! Realm();
            try! realm.write {
                let word = Word()
                word.japanese = inputJapanese.text!
                word.english = inputEnglish.text!
                word.otherLanguage = inputOtherLanguage.text!
                
                let realmDateBase = realm.objects(RealmDateBase.self).filter("title == %@" , indexTitle!).first
                realmDateBase?.words.append(word)
            }
            self.dismiss(animated: true, completion: nil)
            //文字入力がなかった場合
        } else {
            self.dismiss(animated: true, completion: nil)
        }
 }
}
