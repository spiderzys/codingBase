//
//  TemplateModel.swift
//  CodingBase
//
//  Created by Yangsheng Zou on 2020-02-01.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation

struct TemplateModel:FieldKeysQueryable, Equatable {
    
    enum FieldKeys:CodingKey {
        case id
        case title
        case numbers
        case dict
    }
    
    let id:Int
    let title:String
    let numbers: [Double]
    var dict: [String : Int]
}
