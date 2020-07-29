//
//  CityListServiceMock.swift
//  BackbaseCodeChallengeTests
//
//  Created by islam Elshazly on 27/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import Combine
import Foundation

@testable import BACKBASE

final class CityListServiceMock: CityListService {
    
    // ADD MARKS
    var cities: [City]!
    
    func fetchCities() -> AnyPublisher<[City], Error> {
        
        return Just(cities).mapError({ _ in AppError.impossible }).eraseToAnyPublisher()
    }
}
