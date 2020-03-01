//
//  StockSearchCellModel.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper
import GKRepresentable

class StockSearchCellModel: TableCellModel {
    
    public override var cellIdentifier: String {
        return StockSearchCell.identifier
    }
    
    public override var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    let symbol: String
    let name: String
    
    init(symbol: String, name: String) {
        self.symbol = symbol
        self.name = name
    }
}
