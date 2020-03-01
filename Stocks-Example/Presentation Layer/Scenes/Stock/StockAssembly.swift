//
//  StockAssembly.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

enum StockAssembly {
    
    // Create and return controller
    static func create() -> StockViewController {
        return StockViewController(nibName: StockViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: StockViewController) -> StockPresenterInput {
        let presenter = StockPresenter()
        
        let interactor = StockInteractor()
        interactor._output = presenter
        
        let router = StockRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
