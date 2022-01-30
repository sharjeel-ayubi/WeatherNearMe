//
//  WeatherResponse.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/24/22.
//

import Foundation

protocol Weather: Codable {
    var time: Double? { get }
    var summary: String? { get }
    var icon: String? { get }
    var precipIntensity: Float? { get }
    var precipProbability: Float? { get }
    var dewPoint: Float? { get }
    var humidity: Float? { get }
    var pressure: Float? { get }
    var windSpeed: Float? { get }
    var windGust: Float? { get }
    var windBearing: Float? { get }
    var cloudCover: Float? { get }
    var uvIndex: Float? { get }
    var visibility: Float? { get }
    var ozone: Float? { get }
}

class WeatherResponse: Codable {
    let latitude: Double?
    let longitude: Double?
    let timezone: String?
    let currently: BasicWeatherData?
    let hourly: HourlyWeatherData?
    let daily: DailyWeatherData?
}

class BasicWeatherData: Weather {
    let time: Double?
    let summary: String?
    let icon: String?
    let precipIntensity: Float?
    let precipProbability: Float?
    let dewPoint: Float?
    let humidity: Float?
    let pressure: Float?
    let windSpeed: Float?
    let windGust: Float?
    let windBearing: Float?
    let cloudCover: Float?
    let uvIndex: Float?
    let visibility: Float?
    let ozone: Float?
    let temperature: Float?
    let apparentTemperature: Float?
}

class WeatherDetail: Weather {
    let time: Double?
    let summary: String?
    let icon: String?
    let precipIntensity: Float?
    let precipProbability: Float?
    let dewPoint: Float?
    let humidity: Float?
    let pressure: Float?
    let windSpeed: Float?
    let windGust: Float?
    let windBearing: Float?
    let cloudCover: Float?
    let uvIndex: Float?
    let visibility: Float?
    let ozone: Float?
    
    let sunriseTime: Int?
    let sunsetTime: Int?
    let moonPhase: Float?
    let precipIntensityMax: Float?
    let precipIntensityMaxTime: Int?
    let temperatureHigh: Float?
    let temperatureHighTime: Int?
    let temperatureLow: Float?
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Float?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Float?
    let apparentTemperatureLowTime: Int?
    let windGustTime: Int?
    let uvIndexTime: Int?
    let temperatureMin: Float?
    let temperatureMinTime: Int?
    let temperatureMax: Float?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Float?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Float?
    let apparentTemperatureMaxTime: Int?
    
}

class HourlyWeatherData: Codable {
    let summary: String?
    let icon: String?
    let data: [BasicWeatherData]?
}

class DailyWeatherData: Codable {
    let summary: String?
    let icon: String?
    let data: [WeatherDetail]?
}
