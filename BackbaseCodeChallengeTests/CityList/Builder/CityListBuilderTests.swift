//
//  CityListBuilderTests.swift
//  BackbaseCodeChallengeTests
//
//  Created by islam Elshazly on 29/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import XCTest
@testable import BACKBASE

final class CityListBuilderTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: CityListBuilder!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        
        sut = CityListBuilder()
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
    }
    
    // MARK: - Build
    
    func test_Build_ReturnsCorrectComponents() {
        let cityListViewController = sut.build()
        
        XCTAssertNotNil(cityListViewController)
        XCTAssertNotNil(cityListViewController.viewModel)
    }
}
