//
//  StockDetailResponse.swift
//  Stocks-Widget
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import Foundation

class StockDetailResponse: Codable {
    let symbol: String?
    let companyName: String?
    let latestPrice: Double?
    let latestTime: String?
    let latestUpdate: Int?
    let change: Double?
    let changePercent: Double?
    let volume: Int?

    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case companyName = "companyName"
        case latestPrice = "latestPrice"
        case latestTime = "latestTime"
        case latestUpdate = "latestUpdate"
        case change = "change"
        case changePercent = "changePercent"
        case volume = "volume"
    }
    
    func mapResponseToDomain() -> AnyObject? {
        
        guard let symbol = self.symbol else { return nil }
        guard let companyName = self.companyName else { return nil }
        guard let latestPrice = self.latestPrice else { return nil }
        guard let latestTime = self.latestTime else { return nil }
        guard let latestUpdate = self.latestUpdate else { return nil }
        guard let change = self.change else { return nil }
        guard let changePercent = self.changePercent else { return nil }
        let volume = self.volume ?? 0
        
        let model = StockDetailModel(symbol: symbol, companyName: companyName, latestPrice: latestPrice, latestTime: latestTime, latestUpdate: latestUpdate, change: change, changePercent: changePercent, volume: volume)
        
        return model
    }
}
