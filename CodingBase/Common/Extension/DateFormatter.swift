//
//  DateFormatter.swift
//  CNBMobile
//
//  Created by Haja Masood on 2019-03-01.
//  Copyright © 2019 IBM Corporation. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func format(_ format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    static func dateFormatterWithPSTTimeZone() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")
        return dateFormatter
    }
    
}
