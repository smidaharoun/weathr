//
//  Requests.swift
//  weathr
//
//  Created by Haroun Smida on 15/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

class BaseRequest {
    var defaultQueries: String {
        "&mode=json&units=\(UserSettings.unitTemperature.apiValue)&lang=\(UserSettings.languageCode)&appid=\(apiKey)"
    }
}

protocol Request {
    var url: URL? { get }
    var httpMethod : HttpMethod { get }
    var body : Data? { get }
}


// MARK: - GetForecastsRequest
class GetForecastsRequest: BaseRequest, Request {
    
    var url: URL? {
        URL(string: baseUrl + "/" + apiVersion + "/forecast" + "?q=" + city + defaultQueries)
    }
    
    var httpMethod: HttpMethod = .get
    
    var body: Data? = nil
    
    var city: String
    
    init(city: String) {
        self.city = city
    }
}
