//
//  CityListViewModelTest.swift
//  BackbaseCodeChallengeTests
//
//  Created by islam Elshazly on 27/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import XCTest
@testable import BackbaseCodeChallenge
import Combine

final class CityListViewModelTest: XCTestCase{
    
    // MARK: - Properties
    
    var apiClient: APIClientMock!
    var cityService: CityListService!
    var sut: CityListViewModel!
    var bindings: Set<AnyCancellable>!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        
        apiClient = APIClientMock()
        cityService = CityListServiceImplementation(apiClient: apiClient!)
        sut = CityListViewModel(service: cityService)
        bindings = Set<AnyCancellable>()
    }
    
    override func tearDownWithError() throws {
        
        apiClient = nil
        cityService = nil
        sut = nil
        bindings = nil
    }
    
    // MARK: - Fetch Cities
    
    func test_FetchCitiesWithDecodableError_returnError() {
        
        //Arrange
        apiClient.error = AppError.errorDecode
        
        //Act
        _ = sut?.$citiesViewModel.sink(receiveCompletion: { (result) in
            
            //Assert
            switch result {
            case .finished:
                break
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, error.localizedDescription)
            }
        }, receiveValue: { (_) in }).store(in: &bindings!)
    }
    
    func test_FetchCities_returnCorrectSortedCities() {
        
        //Act
        _ = sut?.$citiesViewModel.sink(receiveValue: { (cityViewModelArray) in
            
            //Assert
            XCTAssertEqual(cityViewModelArray.count, 5)
            XCTAssertEqual(cityViewModelArray[0].name, "Cairo")
            XCTAssertEqual(cityViewModelArray[1].name, "name1")
            XCTAssertEqual(cityViewModelArray[2].name, "name2")
        }).store(in: &bindings!)
    }
    
    // MARK: - Search Cities
    
    func test_searchCities_returnCorrectData() {
        
        sut?.searchText = "c"
        _ = sut?.$citiesViewModel.sink(receiveValue: { (cityViewModelArray) in
            XCTAssertEqual(cityViewModelArray.count, 1)
            XCTAssertEqual(cityViewModelArray.first?.name, "Cairo")
        }).store(in: &bindings!)
    }
    
}
