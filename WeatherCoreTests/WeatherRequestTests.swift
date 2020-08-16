//
//  WeatherRequestTest.swift
//  WeatherCoreTests
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
import XCTest
@testable import WeatherCore

class WeatherRequestTests: XCTestCase {
    var lat: Double?
    var lon: Double?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_weatherRequest_withLatitudeAndLongitude_shouldNotBeNil() {
        //GIVEN
        lat = 30
        lon = 3
        
        //WHEN
        let weatherRequest = WeatherRequest.init(latitude: lat!, longitude: lon!)
        
        //THEN
        XCTAssertNotNil(weatherRequest)
    }
    
    func test_weatherRequest_shouldCorrectlyMakeUrl() {
        
        //GIVEN
        lat = 30.3
        lon = 3.5
        
        //WHEN
        let url = WeatherRequest.init(latitude: lat!, longitude: lon!).url
        
        //THEN
        XCTAssertEqual(url, URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=30.3&lon=3.5&appid=6cd70baf89887625a69fe375c4d7d0e7"))
        
    }
    
    
}
