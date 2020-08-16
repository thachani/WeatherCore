//
//  WeatherDataManagerTests.swift
//  WeatherCoreTests
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import XCTest
@testable import WeatherCore

class WeatherDataManagerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_weatherData_fromLocal_shouldNotBeNil() {
        
        //GIVEN
        let localData = loadLocalStub(fileName: "weather", fileExtension: "Json")
        
        //WHEN
        let weather = WeatherDataManager.init().weatherFromLocal(data: localData)
        
        //THEN
        XCTAssertNotNil(weather)
    }
    
    func test_weatherData_shouldCorrectlyDecodeLatitudeAndLongitude() {
        
        //GIVEN
        let localData = loadLocalStub(fileName: "weather", fileExtension: "Json")
        
        //WHEN
        let weather = WeatherDataManager.init().weatherFromLocal(data: localData)
        
        //THEN
        XCTAssertEqual(weather?.latitude, 48.2)
        XCTAssertEqual(weather?.longitude, 2.3)
    }

    func test_weatherData_shouldCorrectlyDecodeCurrentlyTemperature() {

        //GIVEN
        let localData = loadLocalStub(fileName: "weather", fileExtension: "Json")

        //WHEN
        let weather = WeatherDataManager.init().weatherFromLocal(data: localData)

        //THEN
        XCTAssertEqual(weather?.currently.temperature, 295.94)
    }

    func test_weatherData_shouldCorrectlyDecodeDailyWeather() {

        //GIVEN
        let localData = loadLocalStub(fileName: "weather", fileExtension: "Json")

        //WHEN
        let weather = WeatherDataManager.init().weatherFromLocal(data: localData)

        //THEN
        XCTAssertFalse((weather?.daily.isEmpty)!)
        XCTAssertEqual(weather?.daily.first?.temp.max, 295.94)
        XCTAssertEqual(weather?.daily.first?.temp.min, 291.3)
    }
    
    
    
}
