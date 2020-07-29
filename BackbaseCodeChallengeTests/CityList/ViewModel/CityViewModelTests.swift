//
//  CityViewModelTests.swift
//  BackbaseCodeChallengeTests
//
//  Created by islam Elshazly on 29/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import XCTest
@testable import BackbaseCodeChallenge

class CityViewModelTests: XCTestCase {
    
    // MARK: - Init
    
    func test_Init_AllFieldsAreCorrect() {
        
        //Arrange
        let data =  LocalJsonReader.loadJson(name: C.UnitTesting.citiesMockFile, bundle: Bundle(for: CityViewModelTests.self))
        let decoder = JSONDecoder()
        let cities = try! decoder.decode([City].self, from: data)
        let city = cities[0]
        
        //Act
        let sut = CityViewModel(city: city)
        
        //Assert
        XCTAssertEqual(sut.name, city.name)
        XCTAssertEqual(sut.country, city.country)
        XCTAssertEqual(sut.id, city.id)
    }
}
