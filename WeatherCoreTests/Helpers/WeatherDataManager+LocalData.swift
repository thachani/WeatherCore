//
//  WeatherDataManager+LocalData.swift
//  WeatherCoreTests
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
@testable import WeatherCore

extension WeatherDataManager {

    func weatherFromLocal(data: Data) -> Weather? {
        let decoder = JSONDecoder()

        decoder.dateDecodingStrategy = .secondsSince1970

        do {
            return try decoder.decode(Weather.self, from: data)
        }
        catch {
            return nil
        }
    }
}


