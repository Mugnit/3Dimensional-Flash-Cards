//
//  ViewController.swift
//  3Dimensional Flash Cards
//
//  Created by Ryuton on 2018/06/17.
//  Copyright © 2018年 Mugnit. All rights reserved.
//


import UIKit
class ViewController: UIViewController {
    var Japanese = "こんにちは"
    var English = "Hello"
    
    @IBOutlet weak var label: UILabel!
    @IBAction func chageWord(_ sender: Any) {
        if label.text == Japanese {
            label.text = English
        } else if label.text == English {
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
