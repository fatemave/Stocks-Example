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
        case getDetail(symbol: String)
        
        var method: HTTPMethod {
            switch self {
            case .getStocks, .getDetail:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .getStocks:
                return "https://api.iextrading.com/1.0/ref-data/symbols"
            case let .getDetail(symbol):
                return "https://cloud.iexapis.com/stable/stock/\(symbol.lowercased())/quote?token=pk_995f14a470764c0eb3743129d0b82663"
            }
        }
        
        var request: URLRequest? {
            switch self {
            case .getStocks:
                let headers: [String: String] = [:]
                let params: [String: Any] = [:]
                return RemoteFactory.request(path: self.path, parameters: params, headers: headers, method: self.method)
            case .getDetail:
                let headers: [String: String] = [:]
                let params: [String: Any] = [:]
                return RemoteFactory.request(path: self.path, parameters: params, headers: headers, method: self.method)
            }
        }
    }
}

