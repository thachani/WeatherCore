//
//  WeatherRequest.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 15/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

struct WeatherRequest: Equatable {
    private let apiKey = "6cd70baf89887625a69fe375c4d7d0e7"
    private let baseUrl = URL(string: "https://api.openweathermap.org/data/2.5/onecall")!
    let latitude: Double
    let longitude: Double
    var url: URL {
        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to Create URL Components for Weather Service Request")
        }

        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "appid", value: apiKey),
        ]

        guard let url = components.url else {
            fatalError("Unable to Create URL for Weather Service Request")
        }

        return url
    }
}
