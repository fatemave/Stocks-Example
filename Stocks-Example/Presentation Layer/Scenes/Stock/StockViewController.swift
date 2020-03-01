//
//  StockViewController.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockViewInput: ViperViewInput {
    func updateView(_ viewModel: StockViewModel)
}

protocol StockViewOutput: ViperViewOutput {
    func showStockSearchViewController()
    func viewWillAppear()
}

class StockViewController: ViperViewController, StockViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var companyNameTitleLabel: UILabel!
    @IBOutlet private weak var symbolTitleLabel: UILabel!
    @IBOutlet private weak var lastestUpdateTitleLabel: UILabel!
    @IBOutlet private weak var priceTitleLabel: UILabel!
    @IBOutlet private weak var changeTitleLabel: UILabel!
    @IBOutlet private weak var changePercentTitleLabel: UILabel!
    @IBOutlet private weak var volumeTitleLabel: UILabel!
    
    @IBOutlet private weak var companyNameValueLabel: UILabel!
    @IBOutlet private weak var symbolValueLabel: UILabel!
    @IBOutlet private weak var lastestUpdateValueLabel: UILabel!
    @IBOutlet private weak var priceValueLabel: UILabel!
    @IBOutlet private weak var changeValueLabel: UILabel!
    @IBOutlet private weak var changePercentValueLabel: UILabel!
    @IBOutlet private weak var volumeValueLabel: UILabel!
    
    // MARK: - Props
    fileprivate var output: StockViewOutput? {
        guard let output = self._output as? StockViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.output?.viewWillAppear()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = "Stock"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.searchButtonAction))
        
        for label in [self.companyNameTitleLabel, self.symbolTitleLabel, self.lastestUpdateTitleLabel, self.changeTitleLabel, self.changePercentTitleLabel, self.volumeTitleLabel, self.companyNameValueLabel, self.symbolValueLabel, self.lastestUpdateValueLabel, self.priceTitleLabel, self.priceValueLabel, self.changeValueLabel, self.changePercentValueLabel, self.volumeValueLabel] {
            label?.isHidden = true
        }
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - StockViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    override func beginLoading() {
        super.beginLoading()
        DispatchQueue.main.async {
            ActivityView.shared.show(from: self)
        }
    }
    
    override func finishLoading(with error: Error?) {
        super.finishLoading(with: error)
        DispatchQueue.main.async {
            ActivityView.shared.hide()
        }
    }
    
    func updateView(_ viewModel: StockViewModel) {
        DispatchQueue.main.async {
            if let stockDetailModel = viewModel.stockDetailModel {
                for label in [self.companyNameTitleLabel, self.symbolTitleLabel, self.lastestUpdateTitleLabel, self.changeTitleLabel, self.changePercentTitleLabel, self.volumeTitleLabel, self.companyNameValueLabel, self.symbolValueLabel, self.lastestUpdateValueLabel, self.priceTitleLabel, self.priceValueLabel, self.changeValueLabel, self.changePercentValueLabel, self.volumeValueLabel] {
                    label?.isHidden = false
                }
                self.companyNameValueLabel.text = stockDetailModel.companyName
                self.symbolValueLabel.text = stockDetailModel.symbol
                self.lastestUpdateValueLabel.text = stockDetailModel.latestTime
                self.priceValueLabel.text = "\(stockDetailModel.latestPrice) $"
                self.changeValueLabel.text = "\(stockDetailModel.change) $"
                self.changePercentValueLabel.text = "\(stockDetailModel.changePercent) %"
                self.volumeValueLabel.text = "\(stockDetailModel.volume) pcs."
            } else {
                for label in [self.companyNameTitleLabel, self.symbolTitleLabel, self.lastestUpdateTitleLabel, self.changeTitleLabel, self.changePercentTitleLabel, self.volumeTitleLabel, self.companyNameValueLabel, self.symbolValueLabel, self.lastestUpdateValueLabel, self.priceTitleLabel, self.priceValueLabel, self.changeValueLabel, self.changePercentValueLabel, self.volumeValueLabel] {
                    label?.isHidden = true
                }
            }
        }
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
