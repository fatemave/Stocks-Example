//
//  StocksErrorResponse.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKNetwork

class StocksErrorResponse: Codable {
   
}

extension StocksErrorResponse: RemoteMappable {
    func mapResponseToDomain() -> AnyObject? {
        return nil
    }
}
