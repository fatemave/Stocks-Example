//
//  StockSearchAssembly.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

enum StockSearchAssembly {
    
    // Create and return controller
    static func create() -> StockSearchViewController {
        return StockSearchViewController(nibName: StockSearchViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: StockSearchViewController) -> StockSearchPresenterInput {
        let presenter = StockSearchPresenter()
        
        let interactor = StockSearchInteractor()
        interactor._output = presenter
        
        let router = StockSearchRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
