//
//  CityListBuilder.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 26/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import Foundation

final class CityListBuilder: Builder {
    
    // MARK: - Build
    
    func build() -> CityListViewController {
        
        let apiClient = APIClientImplmentation()
        let cityListService = CityListServiceImplementation(apiClient: apiClient)
        let viewModel = CityListViewModel(service: cityListService)
        let cityListViewCotroller = CityListViewController.initFromStoryboard(storyboard: .main)
        cityListViewCotroller.viewModel = viewModel
        
        return cityListViewCotroller
    }
}
