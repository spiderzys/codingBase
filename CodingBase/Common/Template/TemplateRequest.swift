//
//  TemplateRequest.swift
//  Movie
//
//  Created by Yangsheng Zou on 2020-01-29.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation
import Moya

enum TemplateRequest:TargetType {
    case popular(page:Int)
    case image(path:String)
    
    
    private var apiKey:String  {
        return "3c9140cda64a622c6cb5feb6c2689164"
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .popular:
            return .requestParameters(parameters: ["api_key" : apiKey], encoding: JSONEncoding.default)
        case .image:
            return .requestPlain
        }
    }
    
    var baseURL: URL {
        let dummyUrl = URL(fileURLWithPath: "")
        switch self {
        case .popular:
            return URL(string: "https://api.themoviedb.org/3") ?? dummyUrl
        case .image:
            return URL(string: "https://image.tmdb.org/t/p/") ?? dummyUrl
        }
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular?"
        case .image(let path):
            return path
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popular:
            return .get
        case .image:
            return .get
        }
    }
    
    
    var headers: [String : String]? {
        switch self {
        case .popular:
            return nil
        case .image:
            return nil
        }
    }
    
}
