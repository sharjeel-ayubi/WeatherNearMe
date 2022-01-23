//
//  String+Extension.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/24/22.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
