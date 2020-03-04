//
//  StockSearchCell.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper
import GKRepresentable

class StockSearchCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    
    // MARK: - Setup functions
    override func setupView() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear

    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    override func updateViews() {
        guard let model = self.model as? StockSearchCellModel else { return }
        self.nameLabel.text = model.name
        self.symbolLabel.text = model.symbol

    }
    
    public func setup() {}
    
}
