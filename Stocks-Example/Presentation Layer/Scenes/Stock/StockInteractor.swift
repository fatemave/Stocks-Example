//
//  StockInteractor.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockInteractorInput: ViperInteractorInput {
    func getStockDetail(symbol: String)
}

protocol StockInteractorOutput: ViperInteractorOutput {
    func provideStockDetail(model: StockDetailModel)
}

open class StockInteractor: ViperInteractor, StockInteractorInput {

    // MARK: - Props
    private var output: StockInteractorOutput? {
        guard let output = self._output as? StockInteractorOutput else {
            return nil
        }
        return output
    }
    
    let mainRepository = MainRepository()
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - StockInteractorInput
    
    func getStockDetail(symbol: String) {
        self.mainRepository.getDetail(symbol: symbol) { model in
            guard let model = model else {
                self.output?.finishLoading(with: NSError(domain: "",
                                                         code: 500,
                                                         userInfo: [NSLocalizedDescriptionKey: "Load error"]) as Error)
                return
            }
            self.output?.provideStockDetail(model: model)
        }
    }
    
    // MARK: - Module functions
}
