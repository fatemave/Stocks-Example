//
//  StockSearchViewModel.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper

class StockSearchViewModel: ViperViewModel {
    var stocks: [StockModel] = []
    var searchText: String = String()
}
