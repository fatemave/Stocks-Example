//
//  StockRouter.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockRouterInput: ViperRouterInput {
    func showStockSearchViewController()
}

class StockRouter: ViperRouter, StockRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: StockViewController? {
        guard let mainController = self._mainController as? StockViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - StockRouterInput
    
    func showStockSearchViewController() {
        DispatchQueue.main.async {
            let vc = StockSearchAssembly.create()
            _ = StockSearchAssembly.configure(with: vc)
            
            self.mainController?.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    // MARK: - Module functions
}
