//
//  APIClientMock.swift
//  BackbaseCodeChallengeTests
//
//  Created by islam Elshazly on 27/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//
import Foundation
import Combine
@testable import BackbaseCodeChallenge

final class APIClientMock: APIClient {
    
    // MARK: - Properties
    
    var error: Error?
    
    // MARK: - API
    
    func fetchData<T>(fileName: String) -> AnyPublisher<T, Error> where T : Decodable {
        
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        } else {
            // return data for mock json file
            let data =  LocalJsonReader.loadJson(name: C.UnitTesting.citiesMockFile, bundle: Bundle(for: APIClientMock.self))
            let decoder = JSONDecoder()
            let cities = try! decoder.decode([City].self, from: data)
            return Just(cities as! T).mapError({ _ in AppError.impossible }).eraseToAnyPublisher()
        }
    }
}
