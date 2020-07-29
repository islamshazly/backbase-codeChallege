//
//  CityViewModel.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 26/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import Foundation

struct CityViewModel {
    
    // MARK: - Properties
    
    let name: String
    let country: String
    let id: Int
    
    // MARK: - Properties
    
    init(city: City) {
        
        name = city.name
        country = city.country
        id = city.id
    }
}

// MARK: - Comparable

extension CityViewModel: Comparable {
    
    static func < (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
