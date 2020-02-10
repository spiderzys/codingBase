//
//  localStorage.swift
//  Movie
//
//  Created by Yangsheng Zou on 2020-01-27.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation


class LocalStorage {
    static let sharedInstance:LocalStorage = LocalStorage()
    
    func retrieve<T:Codable>(item: Item) -> T? {
        if let data = UserDefaults.standard.value(forKey: item.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(T.self, from: data) {
                return object
            }
        }
        return nil
    }
    
    func save<T:Codable>(value: T, to key: Item){
        let encoder = JSONEncoder()
        if let encodedValue = try? encoder.encode(value) {
            UserDefaults.standard.setValue(encodedValue, forKey: key.rawValue)
        }
    }
    
    func removeData(in key:Item) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    

    
    enum Item:String {
        case id = "id"
        case template
    }
    
    
}
