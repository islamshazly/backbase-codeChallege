//
//  CityListViewControllerTests.swift
//  BackbaseCodeChallengeTests
//
//  Created by islam Elshazly on 29/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import XCTest
@testable import BackbaseCodeChallenge

final class CityListViewControllerTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: CityListViewController!
    var viewModel: CityListViewModel!
    var service: CityListService!
    var apiClient: APIClientMock!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        
        apiClient = APIClientMock()
        service = CityListServiceImplementation(apiClient: apiClient)
        viewModel = CityListViewModel(service: service)
        sut = CityListViewController.initFromStoryboard(storyboard: .main)
        sut.viewModel = viewModel
        
        _ = sut.view
    }
    
    override func tearDownWithError() throws {
        
        apiClient = nil
        service = nil
        viewModel = nil
        sut = nil
    }
    
    // MARK: - SetupUI
    
    func test_SetupUI_UpdatedTheTitleCorrectly() {
        
        addSomeDelay()
        
        //Assert
        XCTAssertEqual(sut.title, C.appName)
    }
    
    // MARK: - TableView
    
    func test_TableViewNumberOfRows_ReturnsCorrectNumberOfRows() {
        
        addSomeDelay()
        
        //Assert
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 5)
    }
    
    func test_TableViewCellForRow_DisplaySortedCities() {
        
        addSomeDelay()
        
        //Assert
        let cell1 = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! CiltyCellTableViewCell
        let cell2 = sut.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! CiltyCellTableViewCell
        XCTAssertEqual(cell1.nameLabel.text, "Cairo")
        XCTAssertEqual(cell2.nameLabel.text, "name1")
    }
    
    func test_TableViewCellForRow_DisplaySearchSortedCities() {
        
        //Arrange
        viewModel.searchText = "C"
        addSomeDelay()
        
        //Assert
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
        let cell1 = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! CiltyCellTableViewCell
        XCTAssertEqual(cell1.nameLabel.text, "Cairo")
    }
}

// MARK: - XCTestCase Extension

extension XCTestCase {
    
    func addSomeDelay() {
    
        let delay = expectation(description: "delay")
        delay.isInverted = true
        waitForExpectations(timeout: 0.8, handler: nil)
    }
}
