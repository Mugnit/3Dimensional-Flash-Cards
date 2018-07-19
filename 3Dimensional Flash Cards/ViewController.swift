//
//  ViewController.swift
//  3Dimensional Flash Cards
//
//  Created by Ryuton on 2018/06/17.
//  Copyright © 2018年 Mugnit. All rights reserved.
//


import UIKit
import RealmSwift
class ViewController: UIViewController {
    var pageNumber = 0
    @IBOutlet weak var label: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let indexTitle = appDelegate.title
        let appDelegate2 = UIApplication.shared.delegate as! AppDelegate
        let selectedWords =  appDelegate2.tappedJapaneseWord
        let realm = try! Realm()
        let realmDateBase = realm.objects(RealmDateBase.self).filter("title == %@" , indexTitle!).first
        let selecctedWord = realmDateBase?.words.filter("japanese == %@" , selectedWords!).first
        let Japanese = selecctedWord?.japanese
        label.text = Japanese
    }
    @IBAction func chageWord(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let indexTitle = appDelegate.title
        let appDelegate2 = UIApplication.shared.delegate as! AppDelegate
        let selectedWords =  appDelegate2.tappedJapaneseWord
        let realm = try! Realm()
        let realmDateBase = realm.objects(RealmDateBase.self).filter("title == %@" , indexTitle!).first
        let selecctedWord = realmDateBase?.words.filter("japanese == %@" , selectedWords!).first
        let Japanese = selecctedWord?.japanese
        let English =  selecctedWord?.english
        let otherLanguage = selecctedWord?.otherLanguage
        pageNumber = pageNumber + 1
        if pageNumber % 3 == 1 {
            label.text = English
        } else if pageNumber % 3 == 2 {
            label.text = otherLanguage
        } else {
            label.text = Japanese
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
