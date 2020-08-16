//
//  WeatherDataManager.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 15/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

public final class WeatherDataManager {
    
    public typealias WeatherResult = (Result<Weather, NetworkTaskError>) -> ()
    
    public init() {} 
    
    // MARK: - Requesting Data
    
    public func weatherForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherResult) {
        let url = WeatherRequest(latitude: latitude, longitude: longitude).url
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)

        NetworkManager.shared.perform(request) { networkResult in
            switch networkResult {
            case .success(let data):
                self.didFetchWeather(data: data, completion: completion)
            case .failure(let error):
                print(error)

            }
        }
    }
    
    // MARK: - Helpers

    private func didFetchWeather(data: Data, completion: WeatherResult) {
        do {
            let decoder = JSONDecoder()
            
            decoder.dateDecodingStrategy = .secondsSince1970
            
            let weatherData = try decoder.decode(Weather.self, from: data)
            
            completion(.success(weatherData))
            
        } catch {
            completion(.failure(.badData))
        }
        
    }

    private func didFailToFetchWeather(error: NetworkTaskError, completion: WeatherResult) {
        print("fail to fetch weather Data : \(error.localizedDescription)")
        completion(.failure(error))
    }

    
}
