//
//  ValidatorTextField.swift
//  CodingBase
//
//  Created by Yangsheng Zou on 2020-02-10.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit


enum InputConstraint {
    case nonEmpty;
    case minLength(Int);
    case maxLength(Int);
    case noEmoji;
    case numeric;
    case noSpace;
    case enumeration([String])
    
    func constraintFulfilled(text: String?) -> Bool {
        switch self {
        case .nonEmpty:
            if text == nil || text == "" {
                return false
            }
            else {
                let string = text!.replacingOccurrences(of: " ", with: "")
                if string == "" {
                    return false
                }
            }
        case .minLength(let length):
            if (text ?? "").count < length {
                return false
            }
        case .maxLength(let length):
            if (text ?? "").count > length {
                return false
            }
        case .noEmoji:
            if (text ?? "").containsEmoji {
                return false
            }
        case .numeric:
            if CLongLong(text ?? "") == nil {
                return false
            }
        case .noSpace:
            if (text ?? "").contains(" ") {
                return false
            }
        case .enumeration(let list):
            if !list.contains(text ?? "") && list.count > 0 {
                
                return false
            }
        }
        return true
    }
    
    var errorMessasge:String {
        switch self {
       case .nonEmpty:
            return "cannot be empty"
        case .minLength(let length):
           return "should be at least \(length)"
        case .maxLength(let length):
            return "should be at most \(length)"
        case .noEmoji:
            return "cannot include Emoji"
        case .numeric:
            return "numeric input only"
        case .noSpace:
            return "cannot include space"
        case .enumeration(let list):
            return "only input in the \(list) allowed"
        
        }
        
    }
    
}


extension InputConstraint: Equatable {
    
    public static func ==(lhs: InputConstraint, rhs:InputConstraint) -> Bool {
        
        switch (lhs,rhs) {
        case (.nonEmpty, .nonEmpty):
            return true
        case (.minLength(_) , .minLength(_)):
            return true
        case (.maxLength(_) , .maxLength(_)):
            return true
        case (.numeric, .numeric):
            return true
        case (.noSpace, .noSpace):
            return true
        case (.enumeration(_), .enumeration(_)):
            return true
        case (.noEmoji, .noEmoji):
            return true
        default:
            return false
        }
        
    }
}


protocol TextFieldWithValidator {
    var inputConstraints: [InputConstraint] {get}
}

protocol TextFieldValidator {
    func didInputInvalidated(constraint: InputConstraint)
}
