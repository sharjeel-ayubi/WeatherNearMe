//
//  LocationService.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/27/22.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func locationIsSet(location: CLLocation?)
}

class LocationService: NSObject {
    
    var delegate: LocationServiceDelegate?
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        return manager
    }()
    
    private var currentLocation: CLLocation? {
        didSet {
            delegate?.locationIsSet(location: currentLocation)
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = location
            manager.delegate = nil
            manager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        dump(error)
    }
    
    func requestLocation() {
        locationManager.delegate = self
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
}
