
import Foundation

final class Trie {
    
    // MARK: - Properties
    
    fileprivate let root: TrieNode
    
    // MARK: - Init
    
    init() {
        root = TrieNode()
    }
}

// MARK: - Helpers

extension Trie {
    
    func insert(city: CityViewModel) {
        guard !city.name.isEmpty else {
            return
        }
        var currentNode = root
        for character in city.name.lowercased().enumerated() {
            if let childNode = currentNode.children[character.element] {
                currentNode = childNode
            } else {
                if character.offset == city.name.count - 1 {
                    currentNode.add(key: character.element, city: city)
                } else {
                    currentNode.add(key: character.element)
                }
                currentNode = currentNode.children[character.element]!
            }
        }
        
        guard !currentNode.isLastNode else {
            return
        }
        
        currentNode.isLastNode = true
    }
    
    private func findLastNode(word: String) -> TrieNode? {
        var currentNode = root
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return nil
            }
            currentNode = childNode
        }
        return currentNode
    }
    
    fileprivate func citiesInSubtrie(rootNode: TrieNode) -> [CityViewModel] {
        var cities = [CityViewModel]()
        if rootNode.isLastNode {
            if let city = rootNode.city {
                cities.append(city)
            }
        }
        for childNode in rootNode.children.values {
            let childCities = citiesInSubtrie(rootNode: childNode)
            cities += childCities
        }
        return cities
    }
    
    func findCities(prefix: String) -> [CityViewModel] {
        var cities = [CityViewModel]()
        let prefixLowerCased = prefix.lowercased()
        if let lastNode = findLastNode(word: prefixLowerCased) {
            if lastNode.isLastNode {
                cities.append((lastNode.city)!)
                
            }
            for childNode in lastNode.children.values {
                let childCities = citiesInSubtrie(rootNode: childNode)
                cities += childCities
            }
        }
        return cities
    }
}
