//
//  StockSearchPresenter.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockSearchPresenterInput: ViperPresenterInput { }

class StockSearchPresenter: ViperPresenter, StockSearchPresenterInput, StockSearchViewOutput, StockSearchInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: StockSearchViewInput? {
        guard let view = self._view as? StockSearchViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: StockSearchInteractorInput? {
        guard let interactor = self._interactor as? StockSearchInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: StockSearchRouterInput? {
        guard let router = self._router as? StockSearchRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: StockSearchViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = StockSearchViewModel()
    }
    
    // MARK: - StockSearchPresenterInput
    
    // MARK: - StockSearchViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - StockSearchInteractorOutput
    
    // MARK: - Module functions
}
