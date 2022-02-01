//
//  WeatherDetailViewModel.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/31/22.
//

import Foundation

class WeatherDetailViewModel {
    
    let weatherData: BasicWeatherData
    
    init(data: BasicWeatherData) {
        weatherData = data
    }
    
    func getStringDate(with format: String) -> String {
        return Utilities.shared.getStringDate(from: weatherData.time ?? 0.0, with: format)
    }
    
    func getPercentage(for probability: Float?) -> String {
        return "\(Int((probability ?? 0.0) * 100.0))%"
    }
    
    func getTime() -> String {
        return getStringDate(with: "dd/MM") + " - " + getStringDate(with: "hh a")
    }
}
