//
//  InitialRouter.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol InitialRouterInput: ViperRouterInput {
    func showStockViewController()
}

class InitialRouter: ViperRouter, InitialRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: InitialViewController? {
        guard let mainController = self._mainController as? InitialViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - InitialRouterInput
    
    func showStockViewController() {
        DispatchQueue.main.async {
            let vc = StockAssembly.create()
            _ = StockAssembly.configure(with: vc)
            
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            
            self.mainController?.present(nc, animated: false, completion: nil)
        }
    }
    
    // MARK: - Module functions
}
