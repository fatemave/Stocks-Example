//
//  MainRepository.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKUseCase

protocol MainRepositoryInterface: RepositoryInterface {
    func getStocks(completion: @escaping ([StockModel]) -> Void)
}

class MainRepository: StocksRepository, MainRepositoryInterface {
    
    // MARK: - Props
    
    // MARK: - AccountsRepositoryInterface
    
    func getStocks(completion: @escaping ([StockModel]) -> Void) {
        guard let request = MainRouter.Remote.getStocks.request else {
            completion([])
            return
        }
        
        self.execute(request, response: [StockResponse].self) { (result, _, error) in
            if let mappedResult = result as? [StockModel], error == nil {
                completion(mappedResult)
            } else {
                completion([])
            }
        }
    }

    // MARK: - Module functions
    
}
