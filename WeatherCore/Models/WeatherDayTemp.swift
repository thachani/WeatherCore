//
//  WeatherDayTemp.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

struct WeatherDayTemp: Decodable {
    
    // MARK: - Types
    
    enum CodingKeys: String, CodingKey {
        case min
        case max
    }
    
    // MARK: - Properties
    
    let min: Double
    let max: Double
    
    // MARK: - Initialization
    
    public init(from decoder: Decoder) throws {
        // Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Min/Max temperature
        self.min = try container.decode(Double.self, forKey: .min)
        self.max = try container.decode(Double.self, forKey: .max)
    }
}
