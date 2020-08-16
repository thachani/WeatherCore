//
//  WeatherDayData.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 15/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

public struct WeatherDay: Decodable {

    // MARK: - Types

    enum CodingKeys: String, CodingKey {

        case time = "dt"
        case windSpeed = "wind_speed"
        case temp
        case weatherSummary = "weather"
    }

    // MARK: - Properties

    let time: Date
    let windSpeed: Double
    let temp: WeatherDayTemp
    let weatherSummary: [WeatherSummary]

    // MARK: - Initialization

    public init(from decoder: Decoder) throws {
        // Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Time and Windspeed
        self.time = try container.decode(Date.self, forKey: .time)
        self.windSpeed = try container.decode(Double.self, forKey: .windSpeed)

        // Daily Temperature
        self.temp = try container.decode(WeatherDayTemp.self, forKey: .temp)

        // WeatherSummary
        self.weatherSummary = try container.decode([WeatherSummary].self, forKey: .weatherSummary)
    }

}

