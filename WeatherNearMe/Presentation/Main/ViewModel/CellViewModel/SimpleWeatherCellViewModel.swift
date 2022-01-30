//
//  BasicWeatherCellViewModel.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/30/22.
//

import Foundation

class SimpleWeatherCellViewModel: BaseCellViewModel {
    let basicWeatherData: BasicWeatherData
    
    init(data: BasicWeatherData) {
        self.basicWeatherData = data
    }
    
    func getPrecipPercentage() -> String {
        return "\(Int((basicWeatherData.precipProbability ?? 0.0) * 100.0))%"
    }
    
    func getHoursTime() -> String {
        let date = getDateFromTimestamp()
        let localTime = date.UTCtoLocalDateStr(in: "hh a")
        return localTime
    }
    
    func getMonthDate() -> String {
        let date = getDateFromTimestamp()
        let localTime = date.UTCtoLocalDateStr(in: "dd/MM")
        return localTime
    }
    
    private func getDateFromTimestamp() -> Date {
        return Date(timeIntervalSince1970: basicWeatherData.time ?? 0.0)
    }
    
}
