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
    
    func getStringDate(with format: String) -> String {
        return Utilities.shared.getStringDate(from: basicWeatherData.time ?? 0.0, with: format)
    }
    
}
