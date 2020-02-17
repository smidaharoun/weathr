//
//  Responses.swift
//  weathr
//
//  Created by Haroun Smida on 15/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import Foundation


// MARK: - GetForecastsResponse
struct GetForecastsResponse: Codable {
    let cod: String
    let message, cnt: Int
    let list: [Forecast]
    let city: City
}
