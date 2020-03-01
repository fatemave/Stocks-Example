//
//  StockSearchInteractor.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol StockSearchInteractorInput: ViperInteractorInput { }

protocol StockSearchInteractorOutput: ViperInteractorOutput { }

open class StockSearchInteractor: ViperInteractor, StockSearchInteractorInput {

    // MARK: - Props
    private var output: StockSearchInteractorOutput? {
        guard let output = self._output as? StockSearchInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - StockSearchInteractorInput
    
    // MARK: - Module functions
}
