//
//  StockSearchRouter.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockSearchRouterInput: ViperRouterInput { }

class StockSearchRouter: ViperRouter, StockSearchRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: StockSearchViewController? {
        guard let mainController = self._mainController as? StockSearchViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - StockSearchRouterInput
    
    // MARK: - Module functions
}
