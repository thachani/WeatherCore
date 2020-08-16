//
//  XCTestCase+LoadStub.swift
//  WeatherCoreTests
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {

    func loadLocalStub(fileName: String, fileExtension: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: fileName, withExtension: fileExtension)

        return try! Data(contentsOf: url!)
    }
}
