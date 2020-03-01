//
//  InitialInteractor.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

protocol InitialInteractorInput: ViperInteractorInput { }

protocol InitialInteractorOutput: ViperInteractorOutput { }

open class InitialInteractor: ViperInteractor, InitialInteractorInput {

    // MARK: - Props
    private var output: InitialInteractorOutput? {
        guard let output = self._output as? InitialInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - InitialInteractorInput
    
    // MARK: - Module functions
}
