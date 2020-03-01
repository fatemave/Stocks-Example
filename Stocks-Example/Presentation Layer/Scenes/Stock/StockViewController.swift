//
//  StockViewController.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockViewInput: ViperViewInput { }

protocol StockViewOutput: ViperViewOutput {
    func showStockSearchViewController()
}

class StockViewController: ViperViewController, StockViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: StockViewOutput? {
        guard let output = self._output as? StockViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = "Stock"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.searchButtonAction))
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - StockViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension StockViewController {
    
    @objc
    func searchButtonAction() {
        self.output?.showStockSearchViewController()
    }
}

// MARK: - Module functions
extension StockViewController { }
