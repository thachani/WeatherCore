//
//  WeatherData.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 15/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

public struct Weather: Decodable {

    // MARK: - Types

    enum CodingKeys: String, CodingKey {

        case latitude = "lat"
        case longitude = "lon"
        case daily
        case currently = "current"

    }

    // MARK: - Properties

  public  let latitude: Double
  public  let longitude: Double

    // MARK: -

  public  let currently: CurrentWeather

    // MARK: -

  public  let daily: [WeatherDay]

    // MARK: - Initialization

    public init(from decoder: Decoder) throws {
        // Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Latitude and Longitude
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)

        // Daily Data
        self.daily = try container.decode([WeatherDay].self, forKey: .daily)

        // Currently Data
        self.currently = try container.decode(CurrentWeather.self, forKey: .currently)
    }

}
