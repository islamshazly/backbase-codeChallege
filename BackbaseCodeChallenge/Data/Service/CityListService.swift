//
//  CitiesService.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 25/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import Foundation
import Combine

// MARK: - CityListService

protocol CityListService {
    func fetchCities() -> AnyPublisher<[City], Error>
}

// MARK: - CityListServiceImplementation

struct CityListServiceImplementation: CityListService {
    
    // MARK: - Properties
    
    private let apiClient: APIClient
    
    // MARK: - Init
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - API
    
    func fetchCities() -> AnyPublisher<[City], Error> {
        
        return self.apiClient.fetchData(fileName: C.citiesJsonFile)
    }
    
    
    
}
