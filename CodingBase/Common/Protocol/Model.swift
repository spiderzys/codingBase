//
//  Model.swift
//  Movie
//
//  Created by Yangsheng Zou on 2020-01-27.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation

protocol FieldKeysQueryable: Encodable, Decodable {
    associatedtype FieldKeys: CodingKey
}

