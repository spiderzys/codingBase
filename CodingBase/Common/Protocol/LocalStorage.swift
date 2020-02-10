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
    
    func retrieve<T>(item: Item) -> T? {
        return  UserDefaults.standard.value(forKey: item.rawValue) as? T
    }
    
    enum Item:String {
        case id = "id"
    }
}

