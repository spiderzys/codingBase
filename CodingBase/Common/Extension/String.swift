//
//  StringExtensions.swift
//  SpruceMeadowsiOS
//
//  Created by Kevin Dion on 2018-04-24.
//  Copyright © 2018 IBM. All rights reserved.
//

import Foundation

extension String {
    var urlEscaped: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }

    var utf8Encoded: Data? {
        return data(using: .utf8)
    }

    var utf16Encoded: Data? {
        return data(using: .utf16)
    }

    var emailRegexPattern: String {
        // RFC 5322 Official Standard from http://emailregex.com/
        return "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    }
    
    var containsEmoji: Bool {
        return unicodeScalars.contains { $0.isEmoji }
    }

    var isEmail: Bool {
        return matchRegex(with: emailRegexPattern)
    }

    var passwordRegexPattern: String {
        return "^(?=.*[a-zA-Z])(?=.*[0-9]).{6,32}$"
    }

    var isPassword: Bool {
        return matchRegex(with: passwordRegexPattern)
    }

    private func matchRegex(with pattern: String) -> Bool {
        return startIndex..<endIndex == range(of: pattern, options: .regularExpression)
    }

    func htmlToAttributedString(attributes: [NSAttributedString.Key: Any]) -> NSMutableAttributedString? {
        guard let data = utf16Encoded else { return NSMutableAttributedString() }
        do {
            let str = try NSMutableAttributedString(data: data,
                                          options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                                          documentAttributes: nil)
            str.addAttributes(attributes, range: NSRange(location: 0, length: str.length))
            return str
        } catch {
            return NSMutableAttributedString()
        }
    }

    func stripZeroMinutesFromTime() -> String {
        return self.replacingOccurrences(of: ":00", with: "")
    }

    func components(regex pattern: String) -> [String]? {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return nil }

        let matches =  regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
        return matches.compactMap {
            guard let range = Range($0.range, in: self) else { return nil }
            return String(self[range])
        }
    }
    
    func dateWithMonthDayYearFormat(dateFormat: String = "yyyy'-'MM'-'dd'T'HH':'mm':'ss") -> Date {
        let dateFormatter = DateFormatter.dateFormatterWithPSTTimeZone()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: self) ?? Date()
        return date.removeTimeStamp()
    }
}
