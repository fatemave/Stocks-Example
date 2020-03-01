//
//  StockDetailModel.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import Foundation

class StockDetailModel {
    let symbol: String
    let companyName: String
    let latestPrice: Double
    let latestTime: String
    let latestUpdate: Int
    let change: Double
    let changePercent: Double
    let volume: Int
    
    init(symbol: String, companyName: String, latestPrice: Double, latestTime: String, latestUpdate: Int, change: Double, changePercent: Double, volume: Int) {
        self.symbol = symbol
        self.companyName = companyName
        self.latestPrice = latestPrice
        self.latestTime = latestTime
        self.latestUpdate = latestUpdate
        self.change = change
        self.changePercent = changePercent
        self.volume = volume

    }
}
