//
//  CitiyListViewModel.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 25/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import Combine

final class CityListViewModel {
    
    // MARK: - Properties
    
    @Published var searchText: String = ""
    @Published private(set) var title: String = ""
    @Published private(set) var state = State.loading
    @Published private var sortedCitiesViewModel: [CityViewModel] = []
    @Published private(set) var citiesViewModel: [ CityViewModel] = []
    private var bindings = Set<AnyCancellable>()
    private var service: CityListService
    private var trie = Trie()
    
    enum State {
        case loading
        case finishedLoading
        case error(Error)
    }
    
    // MARK: - Init
    
    init(service: CityListService) {
        
        title = C.appName
        self.service = service
        state = .loading
        $searchText
            .sink{ [weak self] in
                self?.state = .loading
                self?.searchTrie(letters: $0)}
            .store(in: &bindings)
        fetchCityList()
    }
    
}

extension CityListViewModel {
    
    // MARK: - API
    
    private func fetchCityList() {
        
        let fetchCityCompletionHandler: (Subscribers.Completion<Error>) -> Void = { [weak self] completion in
            switch completion {
            case .failure(let error): self?.state = .error(error)
            case .finished: self?.state = .finishedLoading
            }
        }
        
        let fetchCityValueHandler: ([City]) -> Void = { [weak self] cityList in
            
            guard let self = self else { return }
            let citiesViewModel = cityList.map { CityViewModel(city: $0) }
            let sortedCities = citiesViewModel.sorted(by: { (city1, city2) -> Bool in
                if city1.name != city2.name {
                    
                    return city1.name < city2.name
                } else {
                    return city1.name < city2.name && city1.country < city2.country
                }
            })
            self.sortedCitiesViewModel = sortedCities
            self.citiesViewModel = sortedCities
            self.fillTrie(citiesViewModel: sortedCities)
        }
        
        _ = service.fetchCities()
            .sink(receiveCompletion: fetchCityCompletionHandler, receiveValue: fetchCityValueHandler)
            .store(in: &bindings)
    }
    
    // MARK: - Trie Helpers
    
    private func fillTrie(citiesViewModel: [CityViewModel]) {
        citiesViewModel.forEach({ self.trie.insert(city: $0) })
    }
    
    private func searchTrie(letters: String) {
        if !letters.isEmpty {
            citiesViewModel = trie.findCities(prefix: letters)
            state = .finishedLoading
        }else {
            citiesViewModel = self.sortedCitiesViewModel
            state = .finishedLoading
        }
    }
}
