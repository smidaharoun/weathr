//
//  ApiManager.swift
//  weathr
//
//  Created by Haroun Smida on 15/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import Foundation

let baseUrl = Bundle.main.object(forInfoDictionaryKey: "Base Url") as! String
let apiVersion = Bundle.main.object(forInfoDictionaryKey: "Api Version") as! String
let apiKey = Bundle.main.object(forInfoDictionaryKey: "Api Key") as! String

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .secondsSince1970
    return encoder
}

// MARK: - URLSession response handlers

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}


extension URLSession {
    fileprivate func codableTask<T: Codable>(with request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.domainError))
                }
                return
            }
            
            let result = try? newJSONDecoder().decode(T.self, from: data)
            
            if let result = result, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }
    }

    
    fileprivate func codableTask<T: Codable>(with request: Request, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask {
        var urlRequest = URLRequest(url: request.url!)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.httpBody = request.body
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return self.codableTask(with: urlRequest, completion: completion)
    }

    func forecastTask(with city: String, completionHandler: @escaping (Result<GetForecastsResponse, NetworkError>) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: GetForecastsRequest(city: city), completion: completionHandler)
    }
}
