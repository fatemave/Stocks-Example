//
//  DaysResponse.swift
//  Stocks-Widget
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import Foundation

typealias DaysResponse = [DayResponse]

// MARK: - DaysResponseElement
class DayResponse: Codable {
    let date: String?
    let price: Double?

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case price = "close"
    }
    
    func mapResponseToDomain() -> AnyObject? {
        
        guard let date = self.date else { return nil }
        guard let price = self.price else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let dateFromString = dateFormatter.date(from: date) else { return nil }
        
        
        let model = DayModel(date: dateFromString, price: price)
        
        return model
    }

}
