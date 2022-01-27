//
//  MainViewModel.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/27/22.
//

import Foundation
import CoreLocation

class MainViewModel {
    
    let locationService: LocationService
    let networkService: NetworkService
    
    var weatherData: WeatherResponse?
    var selectedWeatherType: WeatherType = .current
    
    init(locationService: LocationService = LocationService(),
         networkService: NetworkService = DefaultNetworkService()) {
        self.locationService = locationService
        self.networkService = networkService
        self.locationService.delegate = self
    }
    
    func viewControllerDidLoad() {
        locationService.requestLocation()
    }
    
    func onChangeWeatherType(with index: Int) {
        selectedWeatherType = WeatherType(rawValue: index) ?? .current
    }
}

//MARK: API Calls
extension MainViewModel {
    func fetchWeather(latitude: Double?, longitude: Double?) {
        guard let lat = latitude, let lon = longitude else { return }
        
        let dto = WeatherRequestDTO(lat: lat, long: lon)
        let request = GetWeatherRequest(dto: dto)
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let resp):
                self?.weatherData = resp
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

//MARK: Location delegate
extension MainViewModel: LocationServiceDelegate {
    func locationIsSet(location: CLLocation?) {
        fetchWeather(latitude: location?.coordinate.latitude, longitude: location?.coordinate.longitude)
    }
    
    
}
