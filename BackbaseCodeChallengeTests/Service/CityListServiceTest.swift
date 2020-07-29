//
//  CityListServiceMock.swift
//  BackbaseCodeChallengeTests
//
//  Created by islam Elshazly on 27/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import XCTest
import Combine
@testable import BackbaseCodeChallenge

final class CityListServiceTest: XCTestCase {
    
    // MARK: - Properties
    
    var apiClient: APIClientMock!
    var sut: CityListServiceImplementation!
    private var bindings: Set<AnyCancellable>!
    
    // MARK: - Life Cycle
    override func setUpWithError() throws {
        
        apiClient = APIClientMock()
        sut = CityListServiceImplementation(apiClient: apiClient!)
        bindings = Set<AnyCancellable>()
    }
    
    override func tearDownWithError() throws {
        
        apiClient = nil
        sut = nil
        bindings = nil
    }
    
    // MARK: - FetchCities
    
    func test_FetchCitiesWithDecodableError_ReturnDecodeError() {
        
        //Arrange
        let error = AppError.errorDecode
        apiClient?.error = error
        
        //Act
        let _ = sut.fetchCities().sink(receiveCompletion: { (resutl) in
            
            //Assert
            switch resutl {
            case .finished:
                break
            case .failure(let resultError):
                XCTAssertEqual(error.localizedDescription, resultError.localizedDescription)
            }
        }, receiveValue: { _ in })
            .store(in: &bindings!)
    }
    
    func test_FetchCitiesWithCorrectData_ReturnValidCitiesList() {
        
        //Act
        let _ = sut.fetchCities().sink(receiveCompletion: { (resutl) in
        //Assert
            switch resutl {
            case .finished:
                break
            case .failure:
                break
            }
        }, receiveValue: { cities in
            let firstCity = cities.first
            XCTAssertEqual(cities.count, 5)
            XCTAssertEqual(firstCity?.country, "country3")
            XCTAssertEqual(firstCity?.name, "name3")
            XCTAssertEqual(firstCity?.id, 3)
        })
            .store(in: &bindings!)
    }
}
