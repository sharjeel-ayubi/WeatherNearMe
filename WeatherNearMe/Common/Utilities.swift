//
//  Utilities.swift
//  WeatherNearMe
//
//  Created by Ayubi on 2/1/22.
//

import Foundation

class Utilities {
    static let shared = Utilities()
    
    private init() {}
    
    func getStringDate(from timeStamp: Double, with format: String) -> String {
        let date = getDate(from: timeStamp)
        let localTime = date.UTCtoLocalDateStr(in: format)
        return localTime
    }
    
    private func getDate(from timeStamp: Double) -> Date {
        return Date(timeIntervalSince1970: timeStamp)
    }
}
