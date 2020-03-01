//
//  StockResponse.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKNetwork

// MARK: - StockResponse
class StockResponse: Codable {
    let symbol: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case name = "name"
    }
}

extension StockResponse: RemoteMappable {
    
    func mapResponseToDomain() -> AnyObject? {
        
        guard let symbol = self.symbol else { return nil }
        guard let name = self.name else { return nil }
        
        let model = StockModel(symbol: symbol, name: name)
        
        return model
    }
}
