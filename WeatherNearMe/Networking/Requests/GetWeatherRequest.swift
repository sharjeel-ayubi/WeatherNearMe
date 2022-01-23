//
//  GetWeatherRequest.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/24/22.
//

import Foundation

struct GetWeatherRequest : DataRequest {
    
    typealias Response = WeatherResponse
    
    var venueDTO: WeatherRequestDTO
    
    var url: String {
        return NetworkConstants.BASE_URL + "\(venueDTO.lat),\(venueDTO.lon)"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(dto: WeatherRequestDTO) {
        venueDTO = dto
    }
}

struct WeatherRequestDTO : Codable {
    
    var lat: String
    var lon: String
    
    init(lat: String, long: String) {
        self.lat = lat
        self.lon = long
    }
    
}

