//
//  CurrentWeather.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

public struct CurrentWeather: Decodable {
    
    // MARK: - Types
    
    enum CodingKeys: String, CodingKey {
        
        case time = "dt"
        case windSpeed = "wind_speed"
        case temperature = "temp"
        case weatherSummary = "weather"
    }
    
    // MARK: - Properties
    
   public let time: Date
   public let temperature: Double
   public let windSpeed: Double
    
   public let weather: [WeatherSummary]
    
    // MARK: - Initialization
    
    public init(from decoder: Decoder) throws {
        // Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Time
        self.time = try container.decode(Date.self, forKey: .time)
        
        // Wind Speed and Temperature
        self.windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        self.temperature = try container.decode(Double.self, forKey: .temperature)

        //weather Summary
        self.weather = try container.decode([WeatherSummary].self, forKey: .weatherSummary)
        
    }
}
