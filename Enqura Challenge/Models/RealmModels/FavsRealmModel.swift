//
//  FavsRealmModel.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//

import Foundation
import RealmSwift

class FavsRealmModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var charId: Int = 0
}
