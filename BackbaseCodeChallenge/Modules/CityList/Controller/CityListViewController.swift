//
//  ViewController.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import UIKit
import Combine

final class CityListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var viewModel: CityListViewModel!
    private var bindings = Set<AnyCancellable>()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        setupBindings()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


extension CityListViewController {
    
    // MARK: - Setup
    
    func setupUI() {
        searchTextField.addPadding(By: 35, for: .left)
    }
    
    func setupTableView() {
        tableView.register(cellClass: CiltyCellTableViewCell.self)
        tableView.dataSource = self
    }
    
    func setupBindings() {
        
        viewModel.$title.receive(on: RunLoop.main).sink { [weak self] title in
            self?.title = title
        }.store(in: &bindings)
        
        searchTextField.textDidChangePublisher
            .assign(to: \.searchText, on: viewModel)
            .store(in: &bindings)
        
        let viewModelsValueHandler: ([CityViewModel]) -> Void = { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.$citiesViewModel
            .receive(on: RunLoop.main)
            .sink(receiveValue: viewModelsValueHandler)
            .store(in: &bindings)
        
        let stateValueHandler: (CityListViewModel.State) -> Void = { [weak self] state in
            switch state {
            case .loading:
                self?.startLoadingIndicator()
            case .finishedLoading:
                self?.stopLoadingIndicator()
            case .error(let error):
                self?.showErrorAlert(error: error)
            }
        }
        
        viewModel.$state
            .receive(on: RunLoop.main)
            .sink(receiveValue: stateValueHandler)
            .store(in: &bindings)
    }
}

// MARK: - UITableViewDataSource

extension CityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.citiesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CiltyCellTableViewCell = tableView.dequeueResuableCell(forIndexPath: indexPath)
        let cityViewModel = viewModel.citiesViewModel[indexPath.row]
        cell.configure(cityViewModel: cityViewModel)
        
        return cell
    }
}

