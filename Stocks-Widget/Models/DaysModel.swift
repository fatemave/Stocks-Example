//
//  DaysModel.swift
//  Stocks-Widget
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import Foundation

typealias DaysModel = [DayModel]

// MARK: - DaysResponseElement
class DayModel {
    let date: Date
    let price: Double

    init(date: Date, price: Double) {
        self.date = date
        self.price = price
    }

}
