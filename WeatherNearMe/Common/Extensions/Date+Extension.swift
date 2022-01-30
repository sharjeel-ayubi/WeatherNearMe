//
//  Date+Extension.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/31/22.
//

import Foundation

extension Date {
    func UTCtoLocalDateStr(in format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDateString = dateFormatter.string(from: self)
        let UTCDate = dateFormatter.date(from: UTCDateString)
        dateFormatter.dateFormat = format//"yyyy-MM-dd hh:mm:ss" // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
}
