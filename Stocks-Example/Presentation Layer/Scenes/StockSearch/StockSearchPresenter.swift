//
//  StockSearchPresenter.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper
import GKRepresentable
import CoreData

protocol StockSearchPresenterInput: ViperPresenterInput { }

class StockSearchPresenter: ViperPresenter, StockSearchPresenterInput, StockSearchViewOutput, StockSearchInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: StockSearchViewInput? {
        guard let view = self._view as? StockSearchViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: StockSearchInteractorInput? {
        guard let interactor = self._interactor as? StockSearchInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: StockSearchRouterInput? {
        guard let router = self._router as? StockSearchRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: StockSearchViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = StockSearchViewModel()
    }
    
    // MARK: - StockSearchPresenterInput
    
    // MARK: - StockSearchViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        self.view?.beginLoading()
        self.interactor?.getStocks()
    }
    
    func filterContent(for searchText: String) {
        self.viewModel.searchText = searchText
        self.makeSections()
    }
    
    func select(symbol: String) {
        let groupUserDefaults = UserDefaults(suiteName: "group.pro.appcraft.stocks-example")
        groupUserDefaults?.setValue(symbol, forKey: "symbol")
        
        self.save(symbol: symbol)

        self.router?.goBack(animated: true)
    }
    
    // MARK: - StockSearchInteractorOutput
    
    func providedStocks(models: [StockModel]) {
        self.view?.finishLoading(with: nil)
        self.viewModel.stocks = models
        self.makeSections()
    }
    
    // MARK: - Module functions
    
    func makeSections() {
        let mainSection = TableSectionModel()
 
        for stock in self.viewModel.stocks {
            let isShow = self.viewModel.searchText.isEmpty ? true : stock.name.range(of: self.viewModel.searchText, options: .caseInsensitive) != nil
            guard !stock.name.isEmpty, isShow else { continue }
            let stockSearchModel = StockSearchCellModel(symbol: stock.symbol, name: stock.name)
            mainSection.rows.append(stockSearchModel)
        }
        
        self.view?.updateSections([mainSection])
    }
    
    // MARK: - Core Data
    
    func save(symbol: String) {
        
        guard let appDelegate =  UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Stock", in: context)!
        
        let stock = NSManagedObject(entity: entity, insertInto: context)
        
        stock.setValue(symbol, forKeyPath: "symbol")
        
        do {
            try context.save()
            print("Success save!")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
