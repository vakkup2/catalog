//
//  CatalogPresenter.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol ICatalogPresenter {
    func present(catalog response: Catalog.Response)
    func present(error: ISceneError)
}

struct CatalogPresenter: ICatalogPresenter {
    var viewController: ICatalogViewController
    
    func present(catalog response: Catalog.Response) {
        let items = response.items.compactMap { CatalogCellViewModel(item: $0) }
        let viewModel = Catalog.ViewModel(items: items)
        viewController.show(catalog: viewModel)
    }
    
    func present(error: ISceneError) {
        viewController.show(error: error)
    }
}
