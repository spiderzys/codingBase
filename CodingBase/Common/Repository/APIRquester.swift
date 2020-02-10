//
//  MovieRequest.swift
//  Movie
//
//  Created by Yangsheng Zou on 2020-01-27.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Moya

class APIRequester {
    
   static let sharedInstance = APIRequester()
   let disposeBag = DisposeBag()
    
    let templateProvider = MoyaProvider<TemplateRequest>()
    /*
    func request(templateRequest: TemplateRequest) {
        
         templateProvider.rx.request(movieRequest).subscribe { event in
            switch event {
            case let .success(response): break
                
            case let .error(error):
                print(error)
            }
        }.disposed(by: disposeBag)
    }
    
   */
    
    
}


class superClass {
    func superFunc() {
        
    }
}


extension superClass {
    @objc func superExtFunc() {
        
    }
}


class childClass:superClass {
    func childFunc() {
        
    }
    
    @objc override func superExtFunc() {
    
    }
    
    override func superFunc() {
        
    }
}
