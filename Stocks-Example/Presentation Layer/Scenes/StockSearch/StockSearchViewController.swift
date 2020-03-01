//
//  StockSearchViewController.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKViper
import GKRepresentable

protocol StockSearchViewInput: ViperViewInput {
    func updateSections(_ sections: [TableSectionModel])
}

protocol StockSearchViewOutput: ViperViewOutput {
    func filterContent(for searchText: String)
}

class StockSearchViewController: ViperViewController, StockSearchViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    fileprivate var output: StockSearchViewOutput? {
        guard let output = self._output as? StockSearchViewOutput else { return nil }
        return output
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    private var sections: [TableSectionModel] = []
    var searchResults : [TableSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        self.navigationItem.titleView = searchController.searchBar
        self.searchController.hidesNavigationBarDuringPresentation = false
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 100.0, right: 0.0)
        self.tableView.backgroundColor = .white
        self.tableView.registerCellNib(StockSearchCell.self)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - StockSearchViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    override func beginLoading() {
        super.beginLoading()
        DispatchQueue.main.async {
            ActivityView.shared.show(from: self)
        }
    }
    
    override func finishLoading(with error: Error?) {
        super.finishLoading(with: error)
        DispatchQueue.main.async {
            ActivityView.shared.hide()
        }
    }
    
    func updateSections(_ sections: [TableSectionModel]) {
        self.sections = sections
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        }
    }
}

// MARK: - Actions
extension StockSearchViewController { }

// MARK: - Module functions
extension StockSearchViewController {
    func filterContent(for searchText: String) {
        self.output?.filterContent(for: searchText)
    }
}

extension StockSearchViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is StockSearchCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? StockSearchCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.sections[indexPath.section].rows[indexPath.row]
         
         if let _ = model as? StockSearchCellModel {
             
         }
    }
}

extension StockSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            self.filterContent(for: searchText)
        }
    }
}
