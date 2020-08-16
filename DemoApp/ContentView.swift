//
//  ContentView.swift
//  DemoApp
//
//  Created by Tarek HACHANI on 15/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import SwiftUI
import WeatherCore

struct ContentView: View {
    var body: some View {
        Text("Weather Demo")
            .onAppear() {
                fetchWeatherData()
        }
    }
}

private func fetchWeatherData() {
    let weatherManager = WeatherDataManager()

    let latitude = 48.2
    let longitude = 2.3

    weatherManager.weatherForLocation(latitude: latitude, longitude: longitude) { result in
        switch result {
        case .success(let weather):
            print(weather)
        case .failure(let error):
            print("\(error.localizedDescription)")
        }
    }
}
