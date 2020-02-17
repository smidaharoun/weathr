//
//  Forecast.swift
//  weathr
//
//  Created by Haroun Smida on 15/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import Foundation

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let country: String
    let population: Int
    let timezone: Int
    let sunrise, sunset: Date
}

// MARK: - Forecast
struct Forecast: Codable {
    let dt: Date
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let rain: Rain?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
