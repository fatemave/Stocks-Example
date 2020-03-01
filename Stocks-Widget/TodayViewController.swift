//
//  TodayViewController.swift
//  Stocks-Widget
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var priceTitleLabel: UILabel!
    @IBOutlet private weak var changeValueLabel: UILabel!
    @IBOutlet private weak var priceValueLabel: UILabel!
    @IBOutlet private weak var lastUpdateTitleLabel: UILabel!
    @IBOutlet private weak var lastUpdateValueLabel: UILabel!
    @IBOutlet private weak var chartTitleLabel: UILabel!
    @IBOutlet private weak var chartView: LineChart!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
        self.loadChartData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
                
        self.chartView.isCurved = false

    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
            self.chartTitleLabel.alpha = 0.0
            self.chartView.alpha = 0.0
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 370)
            UIView.animate(withDuration: 0.5) {
                self.chartTitleLabel.alpha = 1.0
                self.chartView.alpha = 1.0
            }
        }
    }
    
    func loadData() {
        let groupUserDefaults = UserDefaults(suiteName: "group.pro.AAPL")
        guard let symbol = groupUserDefaults?.value(forKey: "symbol") as? String,
            let url = URL(string: "https://cloud.iexapis.com/stable/stock/\(symbol.lowercased())/quote?token=pk_995f14a470764c0eb3743129d0b82663") else { return }

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let model = try? decoder.decode(StockDetailResponse.self, from: data)
            if let stockDetailModel = model?.mapResponseToDomain() as? StockDetailModel {
                DispatchQueue.main.async {
                    self.companyLabel.text = stockDetailModel.companyName
                    if stockDetailModel.change < 0 {
                        self.changeValueLabel.text = "\(stockDetailModel.change)"
                        self.changeValueLabel.textColor = .red
                    } else if stockDetailModel.change > 0 {
                        self.changeValueLabel.text = "+\(stockDetailModel.change)"
                        self.changeValueLabel.textColor = .green
                    } else {
                        self.changeValueLabel.text = "\(stockDetailModel.change) $"
                        self.changeValueLabel.textColor = self.companyLabel.textColor
                    }
                    
                    self.priceValueLabel.text = "\(stockDetailModel.latestPrice) $"
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMM d, yyyy HH:mm"
                    let dateString = dateFormatter.string(from: Date())
                    
                    self.lastUpdateValueLabel.text = dateString
                }
            }
        }

        task.resume()
    }
    
    func loadChartData() {
        let groupUserDefaults = UserDefaults(suiteName: "group.pro.AAPL")
        guard let symbol = groupUserDefaults?.value(forKey: "symbol") as? String,
            let url = URL(string: "https://cloud.iexapis.com/stable/stock/\(symbol.lowercased())/chart/5d?token=pk_995f14a470764c0eb3743129d0b82663") else { return }

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let model = try? decoder.decode(DaysResponse.self, from: data)
            var dataEntries: [PointEntry] = []
            if let response = model {
                for day in response {
                    if let dayModel = day.mapResponseToDomain() as? DayModel {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "d MMM"
                        let entity = PointEntry(value: Int(dayModel.price), label: formatter.string(from: dayModel.date))
                        dataEntries.append(entity)
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.chartView.dataEntries = dataEntries
            }
        }

        task.resume()
    }
    
}
