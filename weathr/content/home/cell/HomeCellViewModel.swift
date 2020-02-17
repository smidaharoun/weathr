//
//  HomeCellViewModel.swift
//  weathr
//
//  Created by Haroun Smida on 17/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import Foundation

struct HomeCellViewModel {
    let forecast: Forecast
}

extension HomeCellViewModel {
    var iconUrl: URL? {
        return URL(string: "https://openweathermap.org/img/wn/\(self.forecast.weather.first?.icon ?? "")@2x.png")
    }
    
    var date: String? {
        if Calendar.current.isDateInToday(self.forecast.dt) {
            return String.today.capitalized
        } else {
            return DateFormatter.weekdayDateFormatter.string(from: self.forecast.dt).capitalized
        }
    }
    
    var comment: String? {
        return self.forecast.weather.first?.weatherDescription.capitalized
    }
    
    var secondComment: String? {
        return "\(String.chanceOfRain) \(NumberFormatter.percentFormatter.string(from: NSNumber(value: self.forecast.rain?.the3H ?? 0)) ?? "0 %")"
    }
    
    var averageTemperature: String? {
        return MeasurementFormatter.temperatureFormatter.string(from: self.forecast.main.temp)
    }
    
    var rangeTemperature: String? {
        return "\(MeasurementFormatter.temperatureFormatter.string(from: self.forecast.main.tempMax))/\(MeasurementFormatter.temperatureFormatter.string(from: self.forecast.main.tempMin))"
    }
    
}
