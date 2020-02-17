//
//  ForecastDetailsViewModel.swift
//  weathr
//
//  Created by Haroun Smida on 17/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import Foundation

struct ForecastDetailsViewModel {
    let forecasts: [Forecast]
    let city: City
}


extension ForecastDetailsViewModel {
    
    var date: String? {
        if Calendar.current.isDateInToday(self.forecasts.first!.dt) {
            return String.today.capitalized
        } else {
            return DateFormatter.weekdayDateFormatter.string(from: self.forecasts.first!.dt).capitalized
        }
    }
    
    var sunrise: String {
        DateFormatter.hourFormatter.string(from: city.sunrise)
    }
    
    var sunset: String {
        DateFormatter.hourFormatter.string(from: city.sunset)
    }
    
    var chanceOfRain: String? {
        return NumberFormatter.percentFormatter.string(from: NSNumber(value: self.forecasts.first?.rain?.the3H ?? 0)) ?? "0 %"
    }
    
    var wind: String? {
        return "\(self.forecasts.first?.wind.speed ?? 0) km/hr"
    }
    
    var humidity: String? {
        return "\(self.forecasts.first?.main.humidity ?? 0) %"
    }
    
    var feelsLike: String? {
        return "\(Int(self.forecasts.first?.main.feelsLike ?? 0)) °"
    }
    
    var pressure: String? {
        return "\(self.forecasts.first?.main.pressure ?? 0) hPa"
    }
    
}
