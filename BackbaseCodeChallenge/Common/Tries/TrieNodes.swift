//
//  TrieNodes.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 27/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import Foundation

final class TrieNode {
    
    // MARK: - Properties
    
    var key: Character?
    var city: CityViewModel?
    weak var parentNode: TrieNode?
    var children: [Character: TrieNode] = [:]
    var isLastNode = false
    
    // MARK: - Init
    
    init(key: Character? = nil, city: CityViewModel? = nil, parentNode: TrieNode? = nil) {
        self.key = key
        self.parentNode = parentNode
        self.city = city
    }
    
    // MARK: - Helper
    
    func add(key: Character, city: CityViewModel? = nil) {
        guard children[key] == nil else {
            return
        }
        children[key] = TrieNode(key: key, city: city, parentNode: self)
    }
}
