//
//  Date.swift
//  CNBMobile
//
//  Created by Haja Masood on 2019-03-01.
//  Copyright © 2019 IBM Corporation. All rights reserved.
//

import Foundation

/**
 DATE FORMATS:
 
 Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
 09/12/2018                        --> MM/dd/yyyy
 09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
 Sep 12, 2:11 PM                   --> MMM d, h:mm a
 September 2018                    --> MMMM yyyy
 Sep 12, 2018                      --> MMM d, yyyy
 Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
 2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
 12.09.18                          --> dd.MM.yy
 10:41:02.112                      --> HH:mm:ss.SSS
 */

extension Date {
    
    var isWeekend: Bool {
        return NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!.isDateInWeekend(self)
    }
    
    func toString(format:String = "yyyy-MM-dd hh:mm:ssSSS") -> String {
        return DateFormatter.format(format).string(from: self)
    }
    
    func removeTimeStamp() -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            return Date()
        }
        return date
    }
    
    static func getDate(dateString:String, format:String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
        let date = String(dateString.prefix(19))
        let dateFormatter = DateFormatter.dateFormatterWithPSTTimeZone()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: date)
    }
    
    static func getRelativeDate(date: Date) -> String {
        let dateFormatter = DateFormatter.dateFormatterWithPSTTimeZone()
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter.string(from: date)
    }
    
    static func getRelativeDate(stringDate: String, outputFormat: String? = nil) -> String {
        guard let date = getDate(dateString: stringDate) else {
            return stringDate
        }
        guard outputFormat != nil else {
            return getRelativeDate(date: date)
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat
        if Date.isToday(date: date) {
            return "Today"
        } else if Date.isYesterday(date: date) {
            return "Yesterday"
        }
        return outputFormatter.string(from: date).uppercased()
    }

    
    
    static func isToday(date: Date) -> Bool {
        return Date.getRelativeDate(date: date) == "Today"
    }
    
    static func isYesterday(date: Date) -> Bool {
        return Date.getRelativeDate(date: date) == "Yesterday"
    }
    
    static func currentTimeInPST(format: String = "yyyy-MM-dd'T'HH:mm:ss") -> String {
        let dateFormatter = DateFormatter.dateFormatterWithPSTTimeZone()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    
    static func isItToday(date: Date) -> Bool {
        let gregorian = Calendar.init(identifier: .gregorian)
        return gregorian.isDateInToday(date)
    }
    
    // Uses 24 hours clock, so if you want to validate against 6 PM, pass 18
    static func isItAfterLastHour(lastHour: Int) -> Bool {
        
        let currentHourInPST = Date.currentTimeInPST(format: "HH")
        if let hour = Int(currentHourInPST), hour < lastHour {
            return false
        }
        return true
    }

    static func datesRange(from: Date, to: Date) -> [Date] {
        // in case of the "from" date is more than "to" date,
        // it should returns an empty array:
        if from > to { return [Date]() }
        
        var tempDate = from
        var array = [tempDate]
        
        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }
        
        return array
    }

    // Returns next date which is not-Saturday/not-Sunday
    func nextBusinessDay(after: Int = 1) -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = after
        
        guard let nextDate = Calendar.current.date(byAdding: dateComponent, to: self) else {
            return self
        }
        
        if nextDate.isWeekend {
            return nextDate.nextBusinessDay()
        } else {
            return nextDate
        }
    }
    
    
    
    static func compareSameDayMonthAndYearOnly(date1: Date, date2: Date) -> Bool {
        let day1 = Calendar.current.component(.day, from: date1)
        let day2 = Calendar.current.component(.day, from: date2)

        let month1 = Calendar.current.component(.month, from: date1)
        let month2 = Calendar.current.component(.month, from: date2)
        
        let year1 = Calendar.current.component(.year, from: date1)
        let year2 = Calendar.current.component(.year, from: date2)

        return day1 == day2 && month1 == month2 && year1 == year2
    }


}
