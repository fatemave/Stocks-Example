//
//  StockSearchViewController.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockSearchViewInput: ViperViewInput { }

protocol StockSearchViewOutput: ViperViewOutput { }

class StockSearchViewController: ViperViewController, StockSearchViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: StockSearchViewOutput? {
        guard let output = self._output as? StockSearchViewOutput else { return nil }
        return output
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        self.navigationItem.titleView = searchController.searchBar
        self.searchController.hidesNavigationBarDuringPresentation = false
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - StockSearchViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension StockSearchViewController { }

// MARK: - Module functions
extension StockSearchViewController { }

extension StockSearchViewController: UITableViewDelegate { }

extension StockSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension StockSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
