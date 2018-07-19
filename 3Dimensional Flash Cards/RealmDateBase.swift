//
//  RealmDateBase.swift
//  3Dimensional Flash Cards
//
//  Created by 峯下　優大 on 2018/06/26.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import RealmSwift
import Foundation

class RealmDateBase: Object{
    @objc dynamic var title = ""
    let words = List<Word>()
    override static func primaryKey() -> String? {
        return "title"
    }
}
class Word: Object{
    @objc dynamic var japanese = ""
    @objc dynamic var english = ""
    @objc dynamic var otherLanguage = ""
    let owners = LinkingObjects(fromType: RealmDateBase.self, property: "words")
}
