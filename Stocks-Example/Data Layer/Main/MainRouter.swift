//
//  MainRemoteRouter.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKNetwork

enum MainRouter {
    
    enum Remote {
        case getStocks
        
        var method: HTTPMethod {
            switch self {
            case .getStocks:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .getStocks:
                return "https://api.iextrading.com/1.0/ref-data/symbols"
            }
        }
        
        var request: URLRequest? {
            switch self {
            case .getStocks:
                let headers: [String: String] = [:]
                let params: [String: Any] = [:]
                return RemoteFactory.request(path: self.path, parameters: params, headers: headers, method: self.method)
            }
        }
    }
}

