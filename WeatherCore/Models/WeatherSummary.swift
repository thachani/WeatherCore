//
//  Weather.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

struct WeatherSummary: Decodable{

    //MARK: -Types
    enum CodingKeys: String, CodingKey {

        case description
        case icon
    }

    //MARK: - Properties

    let icon: String
    let description: String

    // MARK: - Initialization

    public init(from decoder: Decoder) throws {
        // Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Icon
        self.icon = try container.decode(String.self, forKey: .icon)

        // Description
        self.description = try container.decode(String.self, forKey: .description)

    }

}
