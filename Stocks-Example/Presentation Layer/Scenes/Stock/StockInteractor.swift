//
//  StockInteractor.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockInteractorInput: ViperInteractorInput { }

protocol StockInteractorOutput: ViperInteractorOutput { }

open class StockInteractor: ViperInteractor, StockInteractorInput {

    // MARK: - Props
    private var output: StockInteractorOutput? {
        guard let output = self._output as? StockInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - StockInteractorInput
    
    // MARK: - Module functions
}
