//
//  City.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import Foundation

struct City: Codable {
    
    // MARK: - Properties
    
    var country: String
    var name: String
    var id: Int
    var coordinate: Coordinate
    var nameAndCountry: String {
        get {
            return name + " , " + country
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case country = "country"
        case id = "_id"
        case coordinate = "coord"
    }
}

// MARK: - Equatable

extension City: Equatable {
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.id == rhs.id
    }
}

