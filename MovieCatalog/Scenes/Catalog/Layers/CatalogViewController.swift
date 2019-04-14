//
//  CatalogViewController.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

protocol ICatalogViewController: class {
    func show(catalog viewModel: Catalog.ViewModel)
    func show(error: ISceneError)
}

class CatalogViewController: UIViewController {
    var interactor: ICatalogInteractor!
    var router: ICatalogRouter!
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private vars
    
    private var catalogCellModels: [CatalogCellModel]?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        loadData()
    }
}

// MARK: Private

private extension CatalogViewController {
    func configureAppearance() {
        setupTable()
    }
    
    func setupTable() {
        tableView.register(CatalogCellModel.self)
    }
    
    func setupRows(from viewModel: Catalog.ViewModel) -> [CatalogCellModel] {
        return viewModel.items.compactMap { CatalogCellModel(viewModel: $0) }
    }
}

// MARK: Data loading

extension CatalogViewController {
    func loadData() {
        interactor.popular(request: Catalog.Request())
    }
}

// MARK: UITableViewDataSource

extension CatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let models = catalogCellModels else {
            return 0
        }
        
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let models = catalogCellModels else {
            assertionFailure("Please check rows container")
            return UITableViewCell()
        }
        
        let cellModel = models[indexPath.row]
        
        return tableView.dequeueReusableCell(withModel: cellModel, for: indexPath)
    }
}

// MARK: UITableViewDataSource

extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let models = catalogCellModels else {
            return
        }
        
        let cellModel = models[indexPath.row]
        
        router.openDetails(id: cellModel.viewModel.id, from: navigationController)
    }
}

// MARK: ICatalogViewController

extension CatalogViewController: ICatalogViewController {
    func show(catalog viewModel: Catalog.ViewModel) {
        catalogCellModels = setupRows(from: viewModel)
        tableView.reloadData()
    }
    
    func show(error: ISceneError) {
        present(UIAlertController.create(from: error), animated: true, completion: nil)
    }
}
