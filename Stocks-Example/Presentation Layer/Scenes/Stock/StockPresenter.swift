//
//  StockPresenter.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockPresenterInput: ViperPresenterInput { }

class StockPresenter: ViperPresenter, StockPresenterInput, StockViewOutput, StockInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: StockViewInput? {
        guard let view = self._view as? StockViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: StockInteractorInput? {
        guard let interactor = self._interactor as? StockInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: StockRouterInput? {
        guard let router = self._router as? StockRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: StockViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = StockViewModel()
    }
    
    // MARK: - StockPresenterInput
    
    // MARK: - StockViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    func showStockSearchViewController() {
        self.router?.showStockSearchViewController()
    }
    
    // MARK: - StockInteractorOutput
    
    // MARK: - Module functions
}
