//
//  InputController.swift
//  3Dimensional Flash Cards
//
//  Created by 峯下　優大 on 2018/07/12.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import UIKit

class InputController:UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.textAlignment = NSTextAlignment.center
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        titleLabel?.text = appDelegate.title
    }
    
}
