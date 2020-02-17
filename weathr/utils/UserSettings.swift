//
//  UserSettings.swift
//  weathr
//
//  Created by Haroun Smida on 16/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import Foundation


struct UserSettings {
    static var languageCode: String {
        Locale.current.languageCode ?? "en"
    }
    
    static var unitTemperature: UnitTemperatureType {
        get {
            guard let unit = UserDefaults.standard.value(forKey: "unit") as? String  else {
                return UnitTemperatureType.celsius
            }
            return UnitTemperatureType(rawValue: unit) ?? UnitTemperatureType.celsius
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "unit")
        }
    }
}

enum UnitTemperatureType: String {
    case celsius, fahrenheit, kelvin
    
    var unitTemperature: UnitTemperature {
        switch(self) {
        case .celsius: return .celsius
        case .fahrenheit: return .fahrenheit
        case .kelvin: return .kelvin
        }
    }
    
    var apiValue: String {
        switch(self) {
        case .celsius: return "metric"
        case .fahrenheit: return "imperial"
        case .kelvin: return ""
        }
    }
}
