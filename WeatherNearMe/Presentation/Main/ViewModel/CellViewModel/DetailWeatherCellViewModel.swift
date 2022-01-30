//
//  DetailWeatherViewModel.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/30/22.
//

import Foundation

class DetailWeatherCellViewModel: BaseCellViewModel {
    let detailWeatherData: WeatherDetail
    
    init(data: WeatherDetail) {
        self.detailWeatherData = data
    }
}
