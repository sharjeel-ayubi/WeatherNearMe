//
//  MainViewModel.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/27/22.
//

import Foundation
import CoreLocation

class MainViewModel {
    
    private let locationService: LocationService
    private let networkService: NetworkService
    
    var weatherData: Observable<WeatherResponse?> = Observable(nil)
    var selectedWeatherType: Observable<WeatherType> = Observable(.current)
    var showLoader: Observable<Bool> = Observable(false)
    
    init(locationService: LocationService = LocationService(),
         networkService: NetworkService = DefaultNetworkService()) {
        self.locationService = locationService
        self.networkService = networkService
        self.locationService.delegate = self
    }
    
    func viewControllerDidLoad() {
        showLoader.value = true
        locationService.requestLocation()
    }
    
    func onChangeWeatherType(with index: Int) {
        selectedWeatherType.value = WeatherType(rawValue: index) ?? .current
    }
    
    func getCellViewModel(for indexPath: IndexPath) -> BaseCellViewModel? {
        switch selectedWeatherType.value {
        case .current:
            guard let weatherData = weatherData.value?.currently
                else { return nil }
            let simpleWeatherCellVM = SimpleWeatherCellViewModel(data: weatherData)
            return simpleWeatherCellVM as BaseCellViewModel
            
        case .hourly:
            guard let weatherData = weatherData.value?.hourly?.data?[indexPath.row]
                else { return nil }
            let simpleWeatherCellVM = SimpleWeatherCellViewModel(data: weatherData)
            return simpleWeatherCellVM as BaseCellViewModel
            
        case .daily:
            guard let weatherData = weatherData.value?.daily?.data?[indexPath.row]
                else { return nil }
            let detailWeatherCellVM = DetailWeatherCellViewModel(data: weatherData)
            return  detailWeatherCellVM as BaseCellViewModel
        }
    }
    
    func getRowCount() -> Int? {
        switch selectedWeatherType.value {
        case .current:
            return 1
        case .hourly:
            return weatherData.value?.hourly?.data?.count
        case .daily:
            return weatherData.value?.daily?.data?.count
        }
    }
    
    func getCellIdentifier(for viewModel: BaseCellViewModel) -> String? {
        switch viewModel {
        case is SimpleWeatherCellViewModel:
            return SimpleWeatherCell.identifier
        case is DetailWeatherCellViewModel:
            return DetailWeatherCell.identifier
        default:
            return nil
        }
    }
}

//MARK: API Calls
extension MainViewModel {
    func fetchWeather(latitude: Double?, longitude: Double?) {
        guard let lat = latitude, let lon = longitude else { return }
        
        let dto = WeatherRequestDTO(lat: lat, long: lon)
        let request = GetWeatherRequest(dto: dto)
        showLoader.value = true
        networkService.request(request) { [weak self] result in
            self?.showLoader.value = false
            switch result {
            case .success(let resp):
                self?.weatherData.value = resp
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
