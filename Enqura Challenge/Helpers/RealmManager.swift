//
//  RealmManager.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
   
    fileprivate var realm: Realm {
        let realm = try! Realm()
        return realm
    }
    
    func get<Objects: Object>(of: Objects.Type) -> Results<Objects> {
        realm.objects(Objects.self)
    }
    
    func delete<Objects: Object>(object: Objects.Type) {
        let objectToDelete = get(of: object)
        realm.beginWrite()
        realm.delete(objectToDelete)
        try! realm.commitWrite()
    }
    
    func set<Objects: Object>(object: Objects.Type) {
        let objectToSet = get(of: object)
        realm.beginWrite()
        realm.add(objectToSet)
        try! realm.commitWrite()
    }
  
}


class RealmFavs: RealmManager {
    static let instance = RealmFavs()
    
    fileprivate var realmFavs: FavsRealmModel? {
        realm.objects(FavsRealmModel.self).first
    }

    func getFavs() -> Results<FavsRealmModel> {
        return realm.objects(FavsRealmModel.self)
    }
    func deleteFav(charId: Int?){
        let realmObj = realm.objects(FavsRealmModel.self).filter({$0.charId == charId})
        realm.beginWrite()
        realm.delete(realmObj)
        try! realm.commitWrite()
        print("Fav has been deleted")
    }
    func deleteFavs(){
        let favs = getFavs()
        realm.beginWrite()
        realm.delete(favs)
        try! realm.commitWrite()
        print("Favs has been deleted")
    }
    func setFav(id: String = UUID().uuidString, charId: Int?) {
        let realmFav = FavsRealmModel()
        realmFav.id = id
        realmFav.charId = charId ?? 0
        realm.beginWrite()
        realm.add(realmFav)
        try! realm.commitWrite()
        if let _ = self.realmFavs { print("Fav is succesfully set") }
    }
}
